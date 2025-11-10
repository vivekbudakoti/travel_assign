import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/features/experience_details/bloc/experience_details_state.dart';
import 'package:travel_assign/features/experience_details/repo/experience_repo.dart';

class ExperienceDetailsCubit extends Cubit<ExperienceDetailsState> {
  ExperienceDetailsCubit() : super(ExperienceDetailsInitialState());

  Future<void> getDetails({required String id}) async {
    emit(ExperienceDetailsLoadingState());
    final data = await ExperienceDetailsRepo().getDetails(id: id);
    if (data != null) {
      emit(ExperienceDetailsSuccessState(experienceData: data));
    } else {
      emit(ExperienceDetailsErrorState(message: "No data found"));
    }
  }
}
