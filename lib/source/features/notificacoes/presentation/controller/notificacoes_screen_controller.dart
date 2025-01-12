import 'package:gtk_flutter/source/features/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/source/features/notificacoes/data/notificacoes_repository.dart';
import 'package:gtk_flutter/source/features/notificacoes/domain/notificacao.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notificacoes_screen_controller.g.dart';

@riverpod
class NotificacoesScreenController extends _$NotificacoesScreenController {
  @override
  FutureOr<void> build() {
    // ok to leave this empty if the return type is FutureOr<void>
  }

  Future<void> deleteNotificacao(Notificacao notificacao) async {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    if (currentUser == null) {
      throw AssertionError('User can\'t be null');
    }
    final repository = ref.read(notificacoesRepositoryProvider);
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => repository.deleteNotificacao(uid: currentUser.uid, notificacaoId: notificacao.id));
  }
}
