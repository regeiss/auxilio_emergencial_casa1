import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gtk_flutter/source/features/responsavel/data/responsavel_repository.dart';
import 'package:gtk_flutter/source/features/responsavel/domain/responsavel.dart';

class ListaResponsavelScreen extends ConsumerWidget {
  const ListaResponsavelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final responsavelData = ref.watch(responsavelDataProvider.future);
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: responsavelData,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<Responsavel> responsavel = snapshot.data!;
            return ListView.builder(
              itemCount: responsavel.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  title: Text(responsavel[index].nome),
                  subtitle: Text(responsavel[index].cpf),
                  leading: Text(responsavel[index].telefone.toString()),
                  children: [Text(responsavel[index].logradouro)],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Não foi possível obter os dados'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
