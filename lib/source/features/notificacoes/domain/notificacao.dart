import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

typedef NotificacaoID = String;

@immutable
class Notificacao extends Equatable {
  const Notificacao(
      {required this.id, required this.titulo, required this.texto, required this.data, required this.prioridade});
  final NotificacaoID id;
  final String titulo;
  final String texto;
  final DateTime data;
  final int prioridade;

  @override
  List<Object> get props => [titulo, texto, data, prioridade];

  @override
  bool get stringify => true;

  factory Notificacao.fromMap(Map<String, dynamic> value, String id) {
    final titulo = value['titulo'] as String;
    final texto = value['texto'] as String;
    final data = value['data'].toDate();
    final prioridade = value['prioridade'] as int;

    return Notificacao(
      id: id,
      titulo: titulo,
      texto: texto,
      data: data,
      prioridade: prioridade,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'texto': texto,
      'data': data,
      'prioridade': prioridade,
    };
  }
}
