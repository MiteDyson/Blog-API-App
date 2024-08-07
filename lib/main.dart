import 'package:flutter/material.dart';
// import 'package:blog_explorer/screens/blog_list_screen.dart';
import 'package:flutter_blog_explorer/services/blog_list_screen.dart';

void main() {
  runApp(BlogExplorerApp());
}

class BlogExplorerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        title: 'SubSpace ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlogListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
