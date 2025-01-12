import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'theme_repository.g.dart';

class TemaEscuroRepository {
  TemaEscuroRepository(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  static const temaEscuroAtivoKey = 'temaEscuroAtivo';

  Future<void> setTemaEscuroAtivo() async {
    await sharedPreferences.setBool(temaEscuroAtivoKey, true);
  }

  bool isTemaEscuroAtivo() => sharedPreferences.getBool(temaEscuroAtivoKey) ?? false;
}

@Riverpod(keepAlive: true)
Future<TemaEscuroRepository> temaEscuroRepository(TemaEscuroRepositoryRef ref) async {
  return TemaEscuroRepository(await SharedPreferences.getInstance());
}
