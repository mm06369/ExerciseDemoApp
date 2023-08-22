




import 'package:bloc/bloc.dart';
import 'package:fitness_app_ui/data/repository/exercise_detail_repository.dart';
import 'excise_detail_state.dart';

class ExerciseDetailCubit extends Cubit<ExerciseDetailState>{

  ExerciseDetailCubit():super(ExerciseDetailState(isLoading: false));

  final repository = ExerciseDetailRepository();

  getExerciseDetail(String bodyPartName) async {

    print("called");
    
    emit(state.copyWith(isLoading: true));
    final result = await repository.getExerciseName(bodyPartName);
    if (result[0].name == "Error"){
      emit(state.copyWith(isLoading: false));
    }
    emit(state.copyWith(excersiceDetailList: result, isLoading: false));

  }

}