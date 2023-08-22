

import '../../../data/model/exercise_model.dart';

class ExerciseDetailState {
  final List<ExerciseModel>? excersiceDetailList;
  final bool? isLoading;

  ExerciseDetailState({this.excersiceDetailList, this.isLoading});

  ExerciseDetailState copyWith ({
    List<ExerciseModel>? excersiceDetailList,
    bool? isLoading
  }){
    return ExerciseDetailState(
      excersiceDetailList: excersiceDetailList ?? this.excersiceDetailList,
      isLoading: isLoading ?? this.isLoading
    );
  }
}