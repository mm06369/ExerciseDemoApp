import 'package:fitness_app_ui/logic/cubit/exercise_detail/excise_detail_state.dart';
import 'package:fitness_app_ui/logic/cubit/exercise_detail/exercise_detail_cubit.dart';
import 'package:fitness_app_ui/pages/exercises/show_excersice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseDetail extends StatefulWidget {
  final String? bodyPartName;

  ExerciseDetail({required this.bodyPartName});

  @override
  State<ExerciseDetail> createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {

  late final String? bodyPartName;

  void getData(String bodyPartName) async {
    await BlocProvider.of<ExerciseDetailCubit>(context).getExerciseDetail(bodyPartName);
  }

  @override
  void initState(){
    bodyPartName = widget.bodyPartName;
    // getData(bodyPartName ?? "cardio");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Size mobileSize = MediaQuery.of(context).size;
    getData(bodyPartName!);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.grey)),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                    text: "Body Part: ",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Geometria')),
                TextSpan(
                    text: widget.bodyPartName,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Colors.purple,
                        fontFamily: 'Geometria'))
              ])),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: BlocBuilder<ExerciseDetailCubit, ExerciseDetailState>(
                  builder: (context, state) {
                    return state.isLoading == false ? ListView.separated(
                        separatorBuilder: (context, index) => const Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  thickness: 2,
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                        itemCount: state.excersiceDetailList!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_) => ShowExcercise(gifUrl: state.excersiceDetailList![index].gifUrl!, excersiceName: state.excersiceDetailList![index].name!,)));
                            },
                            child: Container(
                              width: double.infinity,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ]),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Equipment: ${state.excersiceDetailList![index].equipment}"),
                                          Text("Exercise Name: ${state.excersiceDetailList![index].name}"),
                                          Text("Targets part of body: ${state.excersiceDetailList![index].target}"),
                                        ],
                                      ),
                                      const Icon(Icons.arrow_right)
                                    ],
                                  ),
                              ),
                            ),
                          );
                        }): const Center(child: CircularProgressIndicator(),);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
