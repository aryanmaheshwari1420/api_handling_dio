import 'dart:developer'; // Add this import for using the log function

import 'package:api_handling_dio/data/models/post_model.dart';
import 'package:api_handling_dio/data/repositories/post_repositories.dart';
import 'package:api_handling_dio/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line to ensure Flutter is properly initialized
  PostRepository postRepository = PostRepository();
  List<PostModel> postModels = await postRepository.fetchPosts();
  log(postModels.toString());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Fix the constructor syntax here (remove 'super' keyword and fix the brackets)
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
