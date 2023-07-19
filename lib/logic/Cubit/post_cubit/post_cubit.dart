import 'package:api_handling_dio/data/models/post_model.dart';
import 'package:api_handling_dio/data/repositories/post_repositories.dart';
import 'package:api_handling_dio/logic/Cubit/post_cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState());

  PostRepository postRepository = PostRepository();

  void fetchPosts() async {
    try {
      List<PostModel> posts = await postRepository.fetchPosts();
      emit(PostLoadedState(posts));
    } catch (ex) {
      emit(PostErrorState(ex.toString()));
    }
  }
}
