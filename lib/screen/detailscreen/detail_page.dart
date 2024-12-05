import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exam_api/model/news_model.dart';

import '../../controller/favorite_contoller.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)?.settings.arguments as NewsModel;
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text(
          news.title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              favoritesProvider.toggleFavorite(news);
            },
            icon: Icon(
              favoritesProvider.isFavorite(news)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (news.urlToImage != null)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 400,
                width: double.infinity,
                child: Image.network(
                  news.urlToImage!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            Text(
              news.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              news.description ?? "No description available",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
