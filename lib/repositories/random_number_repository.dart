import 'package:deepcare/core/network/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'random_number_repository.g.dart';

@riverpod
RandomNumberRepository randomNumberRepository(Ref ref) {
  return RandomNumberRepository(dioClient: ref.read(dioClientProvider));
}

class RandomNumberRepository {
  final DioClient dioClient;

  RandomNumberRepository({required this.dioClient});

  Future<int> getRandomNumber() async {
    try {
      final response = await dioClient.dio.get('/random');
      final data = response.data as List<dynamic>;
      if (data.isEmpty) {
        throw Exception('No data returned from API');
      }
      return data.first as int;
    } on DioException catch (e) {
      throw Exception(e.response?.data);
    }
  }
}
