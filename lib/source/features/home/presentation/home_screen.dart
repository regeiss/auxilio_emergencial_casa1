import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/source/core/router/app_router.dart';
import 'package:gtk_flutter/source/features/common/widgets/drawer.dart';
import 'package:gtk_flutter/source/constants/strings.dart';
import 'package:gtk_flutter/source/features/common/appbar_menu_action.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final actions = AppBarPopUpMenuActions();

    return Scaffold(
        appBar: AppBar(
          title: const Text(Strings.homePage),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                context.goNamed(AppRoute.notificacao.name);
              },
              icon: Badge.count(
                count: 3,
                child: Icon(Icons.notifications),
              ),
            ),
            PopupMenuButton<int>(
              onSelected: (item) => actions.handleClick(item, context, ref),
              itemBuilder: (context) => [
                PopupMenuItem<int>(value: 0, child: Text('Logout')),
                PopupMenuItem<int>(value: 1, child: Text('Ajustes')),
              ],
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverGrid.count(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green,
                    child: const Text("Area 1"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.green,
                    child: const Text('Area 2'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blue,
                    child: const Text('Area 3'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.blue,
                    child: const Text('Area 4'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.orange,
                    child: const Text('Area 5'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.orange,
                    child: const Text('Area 6'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.red,
                    child: const Text('Area 7'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.red,
                    child: const Text('Area 8'),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
