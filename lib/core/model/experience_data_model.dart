import 'package:travel_assign/core/utils/parser.dart';
import 'package:travel_assign/core/model/interests_model.dart';

class ExperienceDataModel {
  final String? id;
  final String? title;
  final String? category;
  final String? location;
  final String? shortDescription;
  final String? fullDescription;
  final String? thumbnail;
  final List<String>? imageUrls;
  bool isSaved;
  final List<InterestsModel>? interests;

  ExperienceDataModel({
    this.id,
    this.title,
    this.category,
    this.location,
    this.shortDescription,
    this.fullDescription,
    this.thumbnail,
    this.imageUrls,
    this.interests,
    this.isSaved = false,
  });

  /// Safe parser that converts raw map data into ExperienceDataModel
  factory ExperienceDataModel.fromMap(Map<String, dynamic>? map) {
    if (map == null) return ExperienceDataModel();

    return ExperienceDataModel(
      id: parseString(map['id']),
      title: parseString(map['title']),
      category: parseString(map['category']),
      location: parseString(map['location']),
      shortDescription: parseString(map['short_description']),
      fullDescription: parseString(map['full_description']),
      thumbnail: parseString(map['thumbnail']),
      imageUrls: parseStringList(map['image_urls']),
      isSaved: parseBool(map['is_saved']),
      interests: InterestsModel.listFromJson(map['interests']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'location': location,
      'short_description': shortDescription,
      'full_description': fullDescription,
      'thumbnail': thumbnail,
      'image_urls': imageUrls,
      'is_saved': isSaved,
      'interests': interests?.map((e) => e.toJson()).toList(),
    };
  }


  static List<ExperienceDataModel> getListFromRawData(Map<String, Map<String, dynamic>>? rawData) {
    if (rawData == null) return [];
    return rawData.values.map((itemMap) => ExperienceDataModel.fromMap(itemMap)).toList();
  }
}
