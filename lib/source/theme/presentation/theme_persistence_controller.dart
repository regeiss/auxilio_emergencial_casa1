import 'dart:async';
import 'package:gtk_flutter/source/theme/data/theme_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_persistence_controller.g.dart';

// AutoDisposeAsyncNotifierProvider
@riverpod
class ThemePersistenceController extends _$ThemePersistenceController {
  @override
  FutureOr<void> build() {
    // no op
  }

  Future<void> completeThemePersistence() async {
    final temaEscuroRepository = ref.watch(temaEscuroRepositoryProvider).requireValue;
    state = const AsyncLoading();
    state = await AsyncValue.guard(temaEscuroRepository.setTemaEscuroAtivo);
  }
}
