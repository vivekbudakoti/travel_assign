import 'package:travel_assign/modules/onboarding/model/interests_model.dart';

abstract class InterestState {}

class InterstInitalState extends InterestState {}

class InterstLoadingState extends InterestState {}

class InterestSuccessState extends InterestState {
  final List<InterestsModel> data;
  final List<String> selectedInterests;

  InterestSuccessState({required this.data, List<String>? selectedInterests})
    : selectedInterests = selectedInterests ?? [];

  InterestSuccessState copyWith({List<InterestsModel>? data, List<String>? selectedInterests}) {
    return InterestSuccessState(
      data: data ?? this.data,
      selectedInterests: selectedInterests ?? this.selectedInterests,
    );
  }
}

class InterstErrorState extends InterestState {}
