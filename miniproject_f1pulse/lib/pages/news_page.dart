import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:miniproject_f1pulse/models/news_model.dart';
import 'package:share_plus/share_plus.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final News news = ModalRoute.of(context)!.settings.arguments as News;
    double screenHeight = MediaQuery.of(context).size.height;
    String formattedDate = DateFormat('dd MMMM yyyy').format(news.publishedAt!);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight,
              child: Stack(
                children: [
                  Image.network(
                    news.image!,
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                  )),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.share,
                                    color: Colors.white,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 10),
                          child: Column(
                            children: [
                              Text(
                                news.title!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Icon(
                                Icons.expand_less,
                                color: Colors.white,
                                size: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(news.source!.name!,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ))
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(
                thickness: 0.5,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    news.content!,
                    style: const TextStyle(
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
