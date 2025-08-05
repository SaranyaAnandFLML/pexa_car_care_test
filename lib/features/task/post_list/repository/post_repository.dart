import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:pexa_carcare_test/core/constants/api_constants.dart';
import '../../../../models/post_model.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) => PostRepository());

class PostRepository {
  Future<List<PostModel>> getPosts() async {
    final response = await http.get(Uri.parse(ApiConstants.getPost));

    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.take(10).map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
