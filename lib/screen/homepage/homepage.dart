import 'package:exam_api/Routes/routes.dart';
import 'package:exam_api/helper/helper.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: const Text(
          "News App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.favoritesreen);
              },
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: NewsHelper.newsHelper.fetchNewsData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading State
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.brown,
              ),
            );
          } else if (snapshot.hasError) {
            // Error State
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(color: Colors.white),
              ),
            );
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            // Data Loaded State
            final newsList = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.8,
              ),
              itemCount: newsList.length,
              itemBuilder: (context, index) {
                final news = newsList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.detailscreen,
                      arguments: news,
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display image if available
                        if (news.urlToImage != null)
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12.0),
                            ),
                            child: Image.network(
                              news.urlToImage!,
                              height: 100,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            news.title,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            // No Data State
            return const Center(
              child: Text(
                "No news available",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
