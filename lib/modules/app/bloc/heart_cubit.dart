import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/core/utils/common.dart';
import 'package:travel_assign/modules/app/bloc/heart_state.dart';

class HeartCubit extends Cubit<HeartState> {
  HeartCubit() : super(HeartInitialState());

  /// Toggle save/unsave for a specific experience
  /// Only emits state for the specific experience ID
  Future<void> toggleSave({required String experienceId, required bool currentSaveStatus}) async {
    emit(HeartLoadingState(experienceId));

    try {
      final success = await CommonUtil.instance.toggleExperienceSaveById(
        id: experienceId,
        currentSaveStatus: currentSaveStatus,
      );

      if (success) {
        emit(HeartUpdatedState(experienceId: experienceId, isSaved: !currentSaveStatus));
      } else {
        emit(HeartUpdatedState(experienceId: experienceId, isSaved: currentSaveStatus));
      }
    } catch (e) {
      emit(HeartUpdatedState(experienceId: experienceId, isSaved: currentSaveStatus));
    }
  }
}
