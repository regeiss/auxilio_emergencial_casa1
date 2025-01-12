import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_persistence_provider.g.dart';

@riverpod
class DarkThemeNotifier extends _$DarkThemeNotifier {
  @override
  bool build() {
    _loadDarkThemeStatus();
    return false;
  }

  // Verifica o estado do tema
  Future<void> _loadDarkThemeStatus() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('temaEscuroAtivo') ?? false;
  }

  // Seta o tema escuro
  Future<void> setaDarkTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('temaEscuroAtivo', true);
    state = true;
  }
}
