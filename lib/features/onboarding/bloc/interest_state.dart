import 'package:travel_assign/features/onboarding/model/interests_model.dart';

abstract class InterestState {}

class InterstInitalState extends InterestState {}

class InterstLoadingState extends InterestState {}

class InterestSuccessState extends InterestState {
  final List<InterestsModel> data;
  InterestSuccessState({required this.data});
}

class InterstFailureState extends InterestState {}
