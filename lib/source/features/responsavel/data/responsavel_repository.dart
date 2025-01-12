import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gtk_flutter/source/features/responsavel/application/api_service.dart';
import 'package:gtk_flutter/source/features/responsavel/domain/responsavel.dart';

final apiService = Provider<ApiService>((ref) => ApiService());
final responsavelDataProvider = FutureProvider<List<Responsavel>>((ref) => ref.read(apiService).getResponsavel());
