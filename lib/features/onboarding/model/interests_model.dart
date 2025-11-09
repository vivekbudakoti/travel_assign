class InterestsModel {
  final int id;
  final String title;
  final String imageUrl;

  InterestsModel({required this.id, required this.title, required this.imageUrl});

  factory InterestsModel.fromJson(Map<String, dynamic> json) {
    return InterestsModel(id: json['id'], title: json['title'], imageUrl: json['image_url']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'title': title, 'image_url': imageUrl};
  }

  static List<InterestsModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => InterestsModel.fromJson(json)).toList();
  }
}
