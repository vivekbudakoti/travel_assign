import 'package:flutter/material.dart';
import 'package:travel_assign/core/utils/shared_pref_util.dart';
import 'package:travel_assign/modules/app/view/view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = SharedPrefUtil();
  await prefs.init();
  runApp(const MyApp());
}
