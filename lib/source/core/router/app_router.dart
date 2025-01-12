import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/core/router/app_startup.dart';
import 'package:gtk_flutter/source/core/router/go_router_refresh_stream.dart';
import 'package:gtk_flutter/source/core/router/presentation/not_found_page.dart';
import 'package:gtk_flutter/source/core/router/scaffold_with_nested_navigation.dart';
import 'package:gtk_flutter/source/features/ajustes/presentation/ajustes_screen.dart';
import 'package:gtk_flutter/source/features/auth/data/firebase_auth_repository.dart';
import 'package:gtk_flutter/source/features/auth/presentation/custom_sign_in_screen.dart';
import 'package:gtk_flutter/source/features/central_ajuda/presentation/central_ajuda_screen.dart';
import 'package:gtk_flutter/source/features/notificacoes/presentation/screen/notificacoes_screen.dart';
import 'package:gtk_flutter/source/features/home/presentation/home_screen.dart';
import 'package:gtk_flutter/source/features/localizacao/presentation/localizacao.dart';
import 'package:gtk_flutter/source/features/onboarding/data/onboarding_repository.dart';
import 'package:gtk_flutter/source/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:gtk_flutter/source/features/placeholder/presentation/placeholder_screen.dart';
import 'package:gtk_flutter/source/features/politica_privacidade/screen/politica_priv_screen.dart';
import 'package:gtk_flutter/source/features/termo_responsabilidade/termo_resp_screen.dart';
import 'package:gtk_flutter/source/features/user/domain/user.dart';
import 'package:gtk_flutter/source/features/user/presentation/user_add_screen.dart';
import 'package:gtk_flutter/source/features/user/presentation/user_detail_screen.dart';
import 'package:gtk_flutter/source/features/user/presentation/user_list_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _cadastroNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'cadastro');
final _abrigoNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'abrigo');
final _listaNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'lista');
// final _perfilNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'perfil');
final _responsavelNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'responsavel');

// teste
// final _searchNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'search');
// final _favoritesNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'favorites');

enum AppRoute {
  onboarding,
  startup,
  signIn,
  home,
  cadastro,
  abrigos,
  listas,
  responsavel,
  pesquisaresponsavel,
  addresponsavel,
  editresponsavel,
  perfil,
  ajustes,
  // testes
  movies,
  movie,
  favorites,
  // fim dos testes
  termoresp,
  politicapriv,
  notificacao,
  centralajuda
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final appStartupState = ref.watch(appStartupProvider);
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: '/signIn',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundScreen(),
    ),
    redirect: (context, state) {
      // If the app is still initializing, show the /startup route
      if (appStartupState.isLoading || appStartupState.hasError) {
        return '/startup';
      }

      final onboardingRepository = ref.read(onboardingRepositoryProvider).requireValue;
      final didCompleteOnboarding = onboardingRepository.isOnboardingComplete();
      final path = state.uri.path;

      if (!didCompleteOnboarding) {
        if (path != '/onboarding') {
          return '/onboarding';
        }
        return null;
      }

      final isLoggedIn = authRepository.currentUser != null;

      if (isLoggedIn) {
        if (path.startsWith('/startup') || path.startsWith('/onboarding') || path.startsWith('/signIn')) {
          return '/home';
        }
      } else {
        if (path.startsWith('/startup') ||
            path.startsWith('/onboarding') ||
            path.startsWith('/home') ||
            path.startsWith('/perfil')) {
          return '/signIn';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
    routes: [
      GoRoute(
        path: '/startup',
        pageBuilder: (context, state) => NoTransitionPage(
          child: AppStartupWidget(
            onLoaded: (_) => const SizedBox.shrink(),
          ),
        ),
      ),
      GoRoute(
        path: '/onboarding',
        name: AppRoute.onboarding.name,
        pageBuilder: (context, state) => NoTransitionPage(
          child: OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: '/signIn',
        name: AppRoute.signIn.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CustomSignInScreen(),
        ),
      ),
      GoRoute(
        path: '/ajuda',
        name: AppRoute.centralajuda.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: CentralAjudaScreen(),
        ),
      ),
      GoRoute(
        path: '/termo',
        name: AppRoute.termoresp.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TermoResponsbilidadeScreen(),
        ),
      ),
      GoRoute(
        path: '/notificacoes',
        name: AppRoute.notificacao.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: NotificacoesScreen(),
        ),
      ),
      GoRoute(
        path: '/politica',
        name: AppRoute.politicapriv.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: PoliticaPrivacidadeScreen(),
        ),
      ),
      GoRoute(
        path: '/ajustes',
        name: AppRoute.ajustes.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: AjustesScreen(),
        ),
      ),
      GoRoute(
        path: '/perfil',
        name: AppRoute.perfil.name,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: PlaceholderScreen(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) => NoTransitionPage(
          child: ScaffoldWithNestedNavigation(navigationShell: navigationShell),
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: '/home',
                name: AppRoute.home.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: HomeScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _cadastroNavigatorKey,
            routes: [
              GoRoute(
                path: '/cadastro',
                name: AppRoute.cadastro.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: PlaceholderScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _abrigoNavigatorKey,
            routes: [
              GoRoute(
                path: '/abrigo',
                name: AppRoute.abrigos.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: PlaceholderScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _listaNavigatorKey,
            routes: [
              GoRoute(
                path: '/lista',
                name: AppRoute.listas.name,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Localizacao(), // PlaceholderScreen(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _responsavelNavigatorKey,
            routes: [
              GoRoute(
                path: '/responsavel',
                name: AppRoute.responsavel.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: ListaUserScreen(),
                ),
                routes: [
                  GoRoute(
                    path: ':id',
                    name: AppRoute.editresponsavel.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      final id = int.parse(state.pathParameters['id'] as String);
                      final user = state.extra is User ? state.extra as User : null;
                      return MaterialPage(
                        // fullscreenDialog: true,
                        key: state.pageKey,
                        child: UserDetalheScreen(userId: id, user: user),
                      );
                    },
                  ),
                  GoRoute(
                    path: 'responsavel/add',
                    name: AppRoute.addresponsavel.name,
                    parentNavigatorKey: _rootNavigatorKey,
                    pageBuilder: (context, state) {
                      return MaterialPage(
                        // fullscreenDialog: true,
                        key: state.pageKey,
                        child: UserAddScreen(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
