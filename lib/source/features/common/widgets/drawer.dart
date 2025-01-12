import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/constants/app_sizes.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:gtk_flutter/source/features/common/widgets/link_text_span.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            curve: Curves.bounceInOut,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(Strings.empresa, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white)),
              Text(Strings.municipio, style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white)),
              Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text('Ciclano Fulanosky da Silva',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white))),
              Text('999.999.999-00', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
            ]),
          ),
          ListTile(
            title: const Text(Strings.centralAjuda),
            onTap: () {
              context.goNamed(AppRoute.centralajuda.name);
            },
          ),
          ListTile(
            title: const Text(Strings.mensagens),
            onTap: () {
              context.goNamed(AppRoute.notificacao.name);
            },
          ),
          ListTile(
            title: const Text(Strings.politicaPrivacidade),
            onTap: () {
              context.goNamed(AppRoute.politicapriv.name);
            },
          ),
          ListTile(
            title: const Text(Strings.termoResponsabilidade),
            onTap: () {
              context.goNamed(AppRoute.termoresp.name);
            },
          ),
          ListTile(
            title: const Text(Strings.sobreApp),
            onTap: () {
              _showDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showDialog(context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle aboutTextStyle = themeData.textTheme.bodyLarge!;
    final TextStyle footerStyle = themeData.textTheme.bodySmall!;
    final TextStyle linkStyle = themeData.textTheme.bodyLarge!.copyWith(color: themeData.primaryColor);

    showAboutDialog(
      context: context,
      applicationName: Strings.appName,
      applicationIcon: ImageIcon(AssetImage("assets/icons/icon.png")),
      applicationVersion: Strings.version,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: AppInsets.l),
          child: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  style: aboutTextStyle,
                  text: Strings.textoSobreApp,
                ),
                LinkTextSpan(
                  style: linkStyle,
                  uri: Strings.packageUri,
                  text: Strings.linkSobreApp,
                ),
                TextSpan(
                  style: aboutTextStyle,
                  text: '.\n',
                ),
                TextSpan(
                  style: footerStyle,
                  text: Strings.textoBuildInfo,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
