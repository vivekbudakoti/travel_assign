abstract class HeartState {}

class HeartInitialState extends HeartState {}

class HeartLoadingState extends HeartState {
  final String experienceId;
  HeartLoadingState(this.experienceId);
}

class HeartUpdatedState extends HeartState {
  final String experienceId;
  final bool isSaved;

  HeartUpdatedState({required this.experienceId, required this.isSaved});
}
