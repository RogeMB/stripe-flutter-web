import 'package:bloc/bloc.dart';

part 'completed_state.dart';

class CompletedCubit extends Cubit<CompletedState> {
  CompletedCubit({
    bool isCompleted = false,
  }) : super(CompletedState(isCompleted: isCompleted));

  // void toggleToTrue() {
  //   emit(state.copyWith(isCompleted: state.copyWith(isCompleted: false)));
  // }

  // void toggleToFalse() {
  //   if (state.isCompleted)
  //     emit(state.copyWith(isCompleted: state.isCompleted = false));
  // }
  void toggleToFalse() {
    emit(state.copyWith(isCompleted: false));
  }

  void toggleCompleted() {
    emit(state.copyWith(isCompleted: !state.isCompleted));
  }
}
