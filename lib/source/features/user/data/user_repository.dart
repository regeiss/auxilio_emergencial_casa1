import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gtk_flutter/source/features/user/application/api_service.dart';
import 'package:gtk_flutter/source/features/user/domain/user.dart';

final apiService = Provider<UserApiService>((ref) => UserApiService());
final userDataProvider = FutureProvider<List<User>>((ref) => ref.read(apiService).getUser());
