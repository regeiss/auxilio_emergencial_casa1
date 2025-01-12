import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TermoResponsbilidadeScreen extends HookConsumerWidget {
  const TermoResponsbilidadeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.termoResponsabilidade),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
              onPressed: () {
                context.goNamed(AppRoute.home.name);
              },
              child: Text('OK'), // style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.blue)),
            ),
          ],
        ),
        //drawer: MainDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(Strings.textoTermoResponsabilidade,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black)),
        ));
  }
}
