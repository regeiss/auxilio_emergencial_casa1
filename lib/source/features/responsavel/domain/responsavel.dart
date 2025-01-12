import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'responsavel.freezed.dart';
part 'responsavel.g.dart';

@freezed
class Responsavel with _$Responsavel {
  factory Responsavel(
      {required String cpf,
      required String nome,
      required String cep,
      required int numero,
      required String complemento,
      required int telefone,
      required String bairro,
      required String logradouro,
      required String nomeMae,
      required String dataNasc,
      required String timestamp,
      required String status,
      required int codRge}) = _Responsavel;

  factory Responsavel.fromJson(Map<String, dynamic> json) => _$ResponsavelFromJson(json);
}
