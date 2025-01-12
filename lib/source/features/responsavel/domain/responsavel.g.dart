// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responsavel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponsavelImpl _$$ResponsavelImplFromJson(Map<String, dynamic> json) =>
    _$ResponsavelImpl(
      cpf: json['cpf'] as String,
      nome: json['nome'] as String,
      cep: json['cep'] as String,
      numero: (json['numero'] as num).toInt(),
      complemento: json['complemento'] as String,
      telefone: (json['telefone'] as num).toInt(),
      bairro: json['bairro'] as String,
      logradouro: json['logradouro'] as String,
      nomeMae: json['nomeMae'] as String,
      dataNasc: json['dataNasc'] as String,
      timestamp: json['timestamp'] as String,
      status: json['status'] as String,
      codRge: (json['codRge'] as num).toInt(),
    );

Map<String, dynamic> _$$ResponsavelImplToJson(_$ResponsavelImpl instance) =>
    <String, dynamic>{
      'cpf': instance.cpf,
      'nome': instance.nome,
      'cep': instance.cep,
      'numero': instance.numero,
      'complemento': instance.complemento,
      'telefone': instance.telefone,
      'bairro': instance.bairro,
      'logradouro': instance.logradouro,
      'nomeMae': instance.nomeMae,
      'dataNasc': instance.dataNasc,
      'timestamp': instance.timestamp,
      'status': instance.status,
      'codRge': instance.codRge,
    };
