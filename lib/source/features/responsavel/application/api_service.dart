import 'dart:io';

import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gtk_flutter/source/features/responsavel/domain/responsavel.dart';
import 'dart:developer';
import 'package:gtk_flutter/source/utils/logging.dart';

class ApiService {
  final dio = Dio(
    BaseOptions(
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: "application/json",
      },
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 35),
    ),
  );

  Future<List<Responsavel>> getResponsavel() async {
    try {
      //String baseUrl = 'http://apireconstrucao.novohamburgo.rs.gov.br/api/buscar_responsaveis';

      if (kDebugMode) {
        dio.interceptors.add(AwesomeDioInterceptor(
          logRequestHeaders: false,
          logRequestTimeout: true,
          logResponseHeaders: false,
        ));
      }
      var response = await dio.get(
          'http://apireconstrucao.novohamburgo.rs.gov.br/api/buscar_responsaveis');
      var responsaveis = (response.data as List);

      List<Responsavel> allUser = responsaveis
          .map((responsaveisData) => Responsavel.fromJson(responsaveisData))
          .toList();

      if (response.statusCode == 200) {
        return allUser;
      }
      return [];
    } on DioException catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        log('${e.response?.statusMessage}');
        log('${e.response?.statusCode}');
      } else {
        printWarning('Failed to load data: ${e.response?.statusMessage}');
        throw Exception('Failed to load data');
      }
    }
    return [];
  }
}
