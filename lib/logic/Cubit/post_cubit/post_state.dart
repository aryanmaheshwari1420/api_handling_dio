import 'package:api_handling_dio/data/models/post_model.dart';

abstract class PostState {}

class PostLoadingState extends PostState {}

class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);
}

class PostLoadedState extends PostState {
  final List<PostModel> posts;
  PostLoadedState(this.posts);
}
