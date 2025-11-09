import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_assign/features/onboarding/bloc/interest_state.dart';
import 'package:travel_assign/features/onboarding/repository/repo.dart';

class InterestCubit extends Cubit<InterestState> {
  InterestCubit() : super(InterstInitalState()) {
    getInterests();
  }

  Future<void> getInterests() async {
    emit(InterstLoadingState());
    try {
      final data = await InterestRepo().getInterests();
      emit(InterestSuccessState(data: data));
    } catch (e) {
      emit(InterstFailureState());
    }
  }
}
