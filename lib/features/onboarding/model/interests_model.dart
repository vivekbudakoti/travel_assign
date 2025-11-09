import 'package:travel_assign/core/utils/parser.dart';

class InterestsModel {
  final String? id;
  final String? title;
  final String? imageUrl;

  InterestsModel({this.id, this.title, this.imageUrl});

  factory InterestsModel.fromJson(Map<String, dynamic> json) {
    return InterestsModel(
      id: parseString(json['id']),
      title: parseString(json['title']),
      imageUrl: parseString(json['image_url']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'image_url': imageUrl};
  }

  static List<InterestsModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => InterestsModel.fromJson(json)).toList();
  }
}
