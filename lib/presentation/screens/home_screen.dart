import 'package:api_handling_dio/data/models/post_model.dart';
import 'package:api_handling_dio/logic/Cubit/post_cubit/post_cubit.dart';
import 'package:api_handling_dio/logic/Cubit/post_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("API Handling"),
      ),
      body: SafeArea(child: BlocBuilder<PostCubit, PostState>(
        builder: (cotext, state) {
          if (state is PostLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is PostLoadedState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                PostModel post = state.posts[index];
                return ListTile(
                  title: Text(post.title.toString()),
                  subtitle: Text(post.body.toString()),
                );
              },
            );
          }
          return Center(
            child: Text("An error Occured"),
          );
        },
      )),
    );
  }
}
