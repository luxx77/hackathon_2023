import 'package:flutter/material.dart';
import 'package:new_one_v1/models/news_model.dart';
import 'package:new_one_v1/view/widgets/news_widget.dart';

class NewsBuilder extends StatelessWidget {
  const NewsBuilder({super.key, required this.news});
  final List<NewsModel> news;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (context, index) {
        return NewsWidget(
          model: news[index],
        );
      },
    );
  }
}
