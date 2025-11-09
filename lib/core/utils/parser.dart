List<String> parseStringList(dynamic value) {
  if (value is List) {
    return value.whereType<String>().toList();
  }
  return [];
}

String? parseString(dynamic value) {
  if (value is String || value is int || value is double) return value.toString();
  return null;
}
