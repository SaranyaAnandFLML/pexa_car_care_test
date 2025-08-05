import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pexa_carcare_test/models/post_model.dart';

import '../repository/post_repository.dart';

final postControllerProvider = StateNotifierProvider<PostController, bool>(
      (ref) => PostController(
    objectsRepository: ref.watch(postRepositoryProvider),
  ),
);

final getPostsProvider = FutureProvider<List<PostModel>>((ref) async {
  final repository = ref.read(postRepositoryProvider);
  return repository.getPosts();
});


class PostController extends StateNotifier<bool> {
  final PostRepository _PostRepository;

  PostController({required PostRepository objectsRepository})
      : _PostRepository = objectsRepository,
        super(false);

  Future<List<PostModel>> getPosts() async {
    final postList = await _PostRepository.getPosts();
    return postList;
  }

}