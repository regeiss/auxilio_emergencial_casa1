import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:gtk_flutter/source/theme/domain/theme_data.dart';
import 'package:gtk_flutter/source/theme/presentation/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import '../../core/router/app_router.dart';

class MainApp extends HookConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final appThemeState = ref.watch(appThemeStateNotifier);
    late final AppLifecycleListener _listener;

    return MaterialApp.router(
      routerConfig: goRouter,
      locale: const Locale('pt'),
      supportedLocales: [const Locale('pt'), const Locale('en')],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate,
        FirebaseUILocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      themeMode: appThemeState.isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      theme: AppTheme.lightblueWhale,
      darkTheme: AppTheme.darkblueWhale,
      highContrastTheme: FlexThemeData.dark(),
      highContrastDarkTheme: FlexThemeData.light(),
    );
  }
}
