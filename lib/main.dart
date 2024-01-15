import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NewsFeed(),
    );
  }
}

class NewsFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              return NewsCard(article: articles[index]);
            },
          );
        },
      ),
    );
  }
}

class Article {
  final String title;
  final String description;
  final String imageUrl;

  Article({
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

class NewsCard extends StatelessWidget {
  final Article article;

  NewsCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        leading: Container(
          width: 80.0,
          height: 80.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(article.imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        title: Text(article.title),
        subtitle: Text(article.description),
      ),
    );
  }
}

List<Article> articles = [
  Article(
    title: 'Flutter News 1',
    description: 'This is the first news article.',
    imageUrl: 'https://placekitten.com/200/300',
  ),
  Article(
    title: 'Flutter News 2',
    description: 'This is the second news article.',
    imageUrl: 'https://placekitten.com/200/301',
  ),
  Article(
    title: 'Flutter News 3',
    description: 'This is the third news article.',
    imageUrl: 'https://placekitten.com/200/302',
  ),
  // Add more articles as needed
];
