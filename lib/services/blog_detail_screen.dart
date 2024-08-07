import 'package:flutter/material.dart';

class BlogDetailScreen extends StatelessWidget {
  final dynamic blog;

  const BlogDetailScreen({Key? key, required this.blog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract values with null checks
    final String id = blog['id'] ?? 'No ID';
    final String title = blog['title'] ?? 'No Title';
    final String imageUrl = blog['image_url'] ?? '';
    final String content = blog['content'] ?? 'No Content';

    // Debug print statements
    print('ID: $id');
    print('Title: $title');
    print('Image URL: $imageUrl');
    print('Content: $content');

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display a placeholder image if the image URL is empty
              imageUrl.isNotEmpty
                  ? Image.network(
                      imageUrl,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.image_not_supported, size: 100);
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(child: CircularProgressIndicator());
                        }
                      },
                    )
                  : Icon(Icons.image_not_supported, size: 100),
              SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                content,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
