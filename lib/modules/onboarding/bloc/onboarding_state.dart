import 'package:travel_assign/core/model/interests_model.dart';

abstract class OnboardingState {}

class OnboardingInitalState extends OnboardingState {}

class OnboardingLoadingState extends OnboardingState {}

class OnboardingSuccessState extends OnboardingState {
  final List<InterestsModel> data;
  final List<String> selectedInterests;

  OnboardingSuccessState({required this.data, List<String>? selectedInterests})
    : selectedInterests = selectedInterests ?? [];

  OnboardingSuccessState copyWith({List<InterestsModel>? data, List<String>? selectedInterests}) {
    return OnboardingSuccessState(
      data: data ?? this.data,
      selectedInterests: selectedInterests ?? this.selectedInterests,
    );
  }
}

class OnboardingErrorState extends OnboardingState {}
