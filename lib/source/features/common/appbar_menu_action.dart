import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:gtk_flutter/source/features/auth/data/firebase_auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarPopUpMenuActions {
  void handleClick(int item, BuildContext context, WidgetRef ref) {
    switch (item) {
      case 0:
        _showAlertDialog(context, ref);
        break;
      case 1:
        context.goNamed(AppRoute.ajustes.name);
        break;
    }
  }

  void _showAlertDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Strings.dialogoConfirmaAcao),
          content: Text(Strings.dialogoSair),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(Strings.cancelar),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(firebaseAuthProvider).signOut();
              },
              child: Text(Strings.ok),
            ),
          ],
        );
      },
    );
  }
}
