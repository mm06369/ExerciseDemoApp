
import 'package:fitness_app_ui/logic/cubit/choose_exercise/exercise_cubit.dart';
import 'package:fitness_app_ui/pages/exercises/choose_exercise.dart';
import 'package:fitness_app_ui/pages/membership_form.dart';
import 'package:fitness_app_ui/pages/select_plan.dart';
import 'package:fitness_app_ui/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/exercise_detail/exercise_detail_cubit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<ExerciseCubit>(create: (context) => ExerciseCubit()),
      BlocProvider<ExerciseDetailCubit>(create: (context) => ExerciseDetailCubit())
    ], child: MaterialApp(
      theme: ThemeData(fontFamily: 'Geometria'),
      home: Scaffold(
        body: Membershipform(),
      ),
    ));

  }
}




