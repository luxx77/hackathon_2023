import 'package:new_one_v1/models/user_model.dart';

class NewsModel {
  final String title;
  final String des;
  final String imgPath;
  final int id;
  NewsModel({
    required this.des,
    required this.imgPath,
    required this.title,
    required this.id,
  });
  factory NewsModel.fromMap(Map map) {
    return NewsModel(
      des: map['article'],
      imgPath: 'assets/images/tsunami.png',
      title: map['title'],
      id: map['id'],
    );
  }
}
