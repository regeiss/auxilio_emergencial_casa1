import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/features/user/data/user_repository.dart';
import 'package:gtk_flutter/source/features/common/appbar_menu_action.dart';
import 'package:gtk_flutter/source/features/user/presentation/user_search_bar.dart';

class BuscaUserScreen extends ConsumerWidget {
  const BuscaUserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider.future);
    final actions = AppBarPopUpMenuActions();

    return Scaffold(
        appBar: AppBar(
          title: Text('Responsáveis'),
          actions: <Widget>[
            PopupMenuButton<int>(
              onSelected: (item) => actions.handleClick(item, context, ref),
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text(Strings.logout)),
                PopupMenuItem<int>(value: 1, child: Text(Strings.ajustes)),
              ],
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            const UserSearchBar(),
          ],
        ));
  }
}
