// ignore_for_file: depend_on_referenced_packages

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gtk_flutter/source/features/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/source/features/notificacoes/domain/notificacao.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

part 'notificacoes_repository.g.dart';

class NotificacaoRepository {
  const NotificacaoRepository(this._firestore);
  final FirebaseFirestore _firestore;

  static String notificacaoPath(String uid, String notificacaoId) => '/notificacao/$notificacaoId';
  static String notificacoesPath(String uid) => '/notificacao';

  // create
  Future<void> addNotificacao(
          {required NotificacaoID uid,
          required String titulo,
          required String texto,
          required DateTime data,
          required int prioridade}) =>
      _firestore.collection(notificacoesPath(uid)).add({
        'titulo': titulo,
        'texto': texto,
        'data': data,
        'prioridade': prioridade,
      });

  // update
  Future<void> updateNotificacao({required NotificacaoID uid, required Notificacao notificacao}) =>
      _firestore.doc(notificacaoPath(uid, notificacao.id)).update(notificacao.toMap());

  // delete
  Future<void> deleteNotificacao({required NotificacaoID uid, required NotificacaoID notificacaoId}) async {}

  // read
  Stream<Notificacao> watchNotificacao({required NotificacaoID uid, required NotificacaoID notificacaoId}) => _firestore
      .doc(notificacaoPath(uid, notificacaoId))
      .withConverter<Notificacao>(
        fromFirestore: (snapshot, _) => Notificacao.fromMap(snapshot.data()!, snapshot.id),
        toFirestore: (notificacao, _) => notificacao.toMap(),
      )
      .snapshots()
      .map((snapshot) => snapshot.data()!);

  Stream<List<Notificacao>> watchNotificacoes({required NotificacaoID uid}) =>
      queryNotificacao(uid: uid).snapshots().map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  Query<Notificacao> queryNotificacao({required NotificacaoID uid}) =>
      _firestore.collection(notificacoesPath(uid)).withConverter(
            fromFirestore: (snapshot, _) => Notificacao.fromMap(snapshot.data()!, snapshot.id),
            toFirestore: (notificacao, _) => notificacao.toMap(),
          );

  Future<List<Notificacao>> fetchNotificacao({required NotificacaoID uid}) async {
    final notificacoes = await queryNotificacao(uid: uid).get();
    return notificacoes.docs.map((doc) => doc.data()).toList();
  }
}

@Riverpod(keepAlive: true)
NotificacaoRepository notificacoesRepository(Ref ref) {
  return NotificacaoRepository(FirebaseFirestore.instance);
}

@riverpod
Query<Notificacao> notificacoesQuery(Ref ref) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('User can\'t be null');
  }
  final repository = ref.watch(notificacoesRepositoryProvider);
  return repository.queryNotificacao(uid: user.uid);
}

@riverpod
Stream<Notificacao> notificacaoStream(Ref ref, NotificacaoID notificacaoId) {
  final user = ref.watch(firebaseAuthProvider).currentUser;
  if (user == null) {
    throw AssertionError('User can\'t be null');
  }
  final repository = ref.watch(notificacoesRepositoryProvider);
  return repository.watchNotificacao(uid: user.uid, notificacaoId: notificacaoId);
}
