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

bool parseBool(dynamic value) {
  if (value is bool) return value;

  if (value is String) {
    final lower = value.toLowerCase();
    if (lower == 'true' || lower == '1') return true;
    if (lower == 'false' || lower == '0') return false;
  }

  if (value is int || value is double) {
    return value != 0;
  }

  return false;
}
