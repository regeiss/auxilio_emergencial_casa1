// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/theme/presentation/theme_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AjustesScreen extends HookConsumerWidget {
  const AjustesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeState = ref.watch(appThemeStateNotifier);

    final platformsMap = <DevicePlatform, String>{
      DevicePlatform.device: 'Default',
      DevicePlatform.android: 'Android',
      DevicePlatform.iOS: 'iOS',
      DevicePlatform.web: 'Web',
      DevicePlatform.fuchsia: 'Fuchsia',
      DevicePlatform.linux: 'Linux',
      DevicePlatform.macOS: 'MacOS',
      DevicePlatform.windows: 'Windows',
    };

    DevicePlatform selectedPlatform = DevicePlatform.device;
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.ajustes),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.goNamed(AppRoute.home.name);
            },
            child: Text('OK'),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: Text('Comuns'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.language),
                title: Text('Linguagem'),
                value: Text('Português'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.cloud_outlined),
                title: Text('Ambiente'),
                value: Text('Produção'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.devices_other),
                title: Text('Plataforma'),
                onPressed: (context) {},
                value: Text(platformsMap[selectedPlatform]!),
              ),
              SettingsTile.switchTile(
                onToggle: (value) {
                  if (value) {
                    appThemeState.setDarkTheme();
                  } else {
                    appThemeState.setLightTheme();
                  }
                },
                initialValue: appThemeState.isDarkModeEnabled,
                leading: Icon(Icons.format_paint),
                title: Text('Tema escuro'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('Conta'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.phone),
                title: Text('Telefone'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.mail),
                title: Text('Email'),
                enabled: false,
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.logout),
                title: Text('Sair'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('Segurança'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (_) {},
                initialValue: true,
                leading: Icon(Icons.phonelink_lock),
                title: Text('Bloquear app em background'),
              ),
              SettingsTile.switchTile(
                onToggle: (_) {},
                initialValue: true,
                leading: Icon(Icons.fingerprint),
                title: Text('Usar biometria'),
                description: Text(
                  'Autorizar acesso a biometria',
                ),
              ),
              SettingsTile.switchTile(
                onToggle: (_) {},
                initialValue: true,
                leading: Icon(Icons.lock),
                title: Text('Alterar senha'),
              ),
              SettingsTile.switchTile(
                onToggle: (_) {},
                initialValue: true,
                leading: Icon(Icons.notifications_active),
                title: Text('Habilitar notificações'),
              ),
            ],
          ),
          SettingsSection(
            title: Text('Misc'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: Icon(Icons.description),
                title: Text('Termos de serviço'),
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.collections_bookmark),
                title: Text('Licença'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlatformPickerScreen extends StatelessWidget {
  const PlatformPickerScreen({
    super.key,
    required this.platform,
    required this.platforms,
  });

  final DevicePlatform platform;
  final Map<DevicePlatform, String> platforms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Platforms')),
      body: SettingsList(
        platform: platform,
        sections: [
          SettingsSection(
            title: Text('Select the platform you want'),
            tiles: platforms.keys.map((e) {
              final platform = platforms[e];

              return SettingsTile(
                title: Text(platform!),
                onPressed: (_) {
                  Navigator.of(context).pop(e);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
      //  Padding(
      //   padding: const EdgeInsets.all(10),
      //   child: ListView(
      //     children: [
      //       SettingsGroup(
      //         backgroundColor: Colors.blue,
      //         items: [
      //           SettingsItem(
      //             onTap: () {},
      //             icons: Icons.edit_square,
      //             iconStyle: IconStyle(),
      //             title: 'Aparência',
      //             subtitle: "Personalize o app",
      //           ),
      //           SettingsItem(
      //             onTap: () {},
      //             icons: Icons.dark_mode_rounded,
      //             iconStyle: IconStyle(
      //               iconsColor: Colors.white,
      //               withBackground: true,
      //               backgroundColor: Colors.black,
      //             ),
      //             title: 'Modo escuro ',
      //             subtitle: "Automático",
      //             trailing: Switch.adaptive(
      //               value: appThemeState.isDarkModeEnabled,
      //               onChanged: (enabled) {
      //                 if (enabled) {
      //                   appThemeState.setDarkTheme();
      //                 } else {
      //                   appThemeState.setLightTheme();
      //                 }
      //               },
      //             ),
      //           ),
      //           SettingsItem(
      //             onTap: () {},
      //             icons: Icons.text_increase,
      //             iconStyle: IconStyle(
      //               iconsColor: Colors.white,
      //               withBackground: true,
      //               backgroundColor: Colors.red,
      //             ),
      //             title: 'Modo alto contraste ',
      //             subtitle: "HC",
      //             trailing: Switch.adaptive(
      //               value: appThemeState.isHighContrastEnabled,
      //               onChanged: (enabled) {
      //                 if (enabled) {
      //                   appThemeState.setHighContrast();
      //                 } else {
      //                   appThemeState.unsetHighContrast();
      //                 }
      //               },
      //             ),
      //           ),
      //         ],
      //       ),
      //       SettingsGroup(
      //         items: [
      //           SettingsItem(
      //             onTap: () {
      //               //  _showDialog(context);
      //             },
      //             icons: Icons.info_rounded,
      //             iconStyle: IconStyle(
      //               backgroundColor: Colors.purple,
      //             ),
      //             title: 'Sobre',
      //             subtitle: "Informações do app",
      //           ),
      //         ],
      //       ),
      //       // You can add a settings title
      //       SettingsGroup(
      //         settingsGroupTitle: "Conta",
      //         items: [
      //           SettingsItem(
      //             onTap: () {},
      //             icons: Icons.exit_to_app_rounded,
      //             title: "Sair",
      //           ),
      //           SettingsItem(
      //             onTap: () {},
      //             icons: Icons.delete_forever,
      //             title: "Excluir conta",
      //             titleStyle: TextStyle(
      //               color: Colors.red,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
//     );
//   }
// }