import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/favorite_contoller.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Favorites"),
        centerTitle: true,
      ),
      body: favoritesProvider.favorites.isEmpty
          ? const Center(child: Text("No favorites yet!"))
          : ListView.builder(
              itemCount: favoritesProvider.favorites.length,
              itemBuilder: (context, index) {
                final news = favoritesProvider.favorites[index];
                return ListTile(
                  title: Text(news.title),
                  subtitle: Text(news.description ?? "No description"),
                  leading: news.urlToImage != null
                      ? Image.network(news.urlToImage!,
                          width: 50, fit: BoxFit.cover)
                      : const Icon(Icons.article),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/detail',
                      arguments: news,
                    );
                  },
                );
              },
            ),
    );
  }
}
