import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/modules/app/bloc/heart/heart_cubit.dart';

/// Global provider for HeartCubit that ensures all screens share the same instance
class GlobalHeartProvider extends StatelessWidget {
  final Widget child;
  static final HeartCubit _globalHeartCubit = HeartCubit();

  const GlobalHeartProvider({super.key, required this.child});

  /// Get the global HeartCubit instance
  static HeartCubit get instance => _globalHeartCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HeartCubit>.value(value: _globalHeartCubit, child: child);
  }
}
