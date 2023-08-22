
import "dart:convert";

import "package:http/http.dart" as http;

import "../model/exercise_model.dart";

class ExerciseDetailProvider {
  
  
  Future<List<dynamic>> getExerciseDetail(String bodyPartName) async {



  final apiUrl = Uri.parse('https://exercisedb.p.rapidapi.com/exercises/bodyPart/$bodyPartName');
  
  final headers = {
    'X-RapidAPI-Key': 'f925a3a868msh31590fab0d6261cp10a4dcjsn69a1919dfed5',
    'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
  };


  try {
    final response = await http.get(apiUrl, headers: headers);
    if (response.statusCode == 200) {
      
      List<ExerciseModel> exerciseDetailList = [];

      final List<dynamic> data = json.decode(response.body);
      for (var item in data){
        exerciseDetailList.add(ExerciseModel.fromJson(item));
      }
      return exerciseDetailList;
      
    
    }  
    else {
      print("error");
      return ["Error", response.statusCode.toString()];
    }
  } 
  catch (error) {
    print(error.toString());
    return ["Error", "$error"];
  }
  
}
}

