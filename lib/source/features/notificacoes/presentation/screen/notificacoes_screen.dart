import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/features/notificacoes/data/notificacoes_repository.dart';
import 'package:gtk_flutter/source/features/notificacoes/domain/notificacao.dart';
import 'package:gtk_flutter/source/features/notificacoes/presentation/controller/notificacoes_screen_controller.dart';
import 'package:gtk_flutter/source/utils/async_value_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:intl/intl.dart';

class NotificacoesScreen extends StatelessWidget {
  const NotificacoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Strings.centralMensagens),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              onPressed: () {
                context.goNamed(AppRoute.home.name);
              },
              child: Text('OK'),
            ),
          ],
        ),
        body: Consumer(builder: (context, ref, child) {
          ref.listen<AsyncValue>(
            notificacoesScreenControllerProvider,
            (_, state) => state.showAlertDialogOnError(context),
          );
          final jobsQuery = ref.watch(notificacoesQueryProvider);
          return FirestoreListView<Notificacao>.separated(
            query: jobsQuery,
            emptyBuilder: (context) => const Center(child: Text('Não há dados para exibir')),
            errorBuilder: (context, error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loadingBuilder: (context) => const Center(child: CircularProgressIndicator()),
            itemBuilder: (context, doc) {
              final notificacao = doc.data();
              return Dismissible(
                key: Key('notificacao-${notificacao.id}'),
                background: Container(color: Colors.red),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) =>
                    ref.read(notificacoesScreenControllerProvider.notifier).deleteNotificacao(notificacao),
                child: NotificacaoListTile(
                  notificacao: notificacao,
                  onTap: () => context.goNamed(
                    AppRoute.notificacao.name,
                    pathParameters: {'id': notificacao.id},
                  ),
                ),
              );
            }, separatorBuilder: (BuildContext context, int index) { 
              return Divider();
             },
          );
        }));
  }
}

class NotificacaoListTile extends StatelessWidget {
  const NotificacaoListTile({super.key, required this.notificacao, this.onTap});
  final Notificacao notificacao;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd/MM/yyyy hh:mm a');

    return ListTile(
      leading: Icon(Icons.warning), // Text(notificacao.data.toString()),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(notificacao.titulo),
          Text(' - '),
          Text(dateFormat.format(notificacao.data)),
        ],
      ),
      subtitle: Text(notificacao.texto),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
