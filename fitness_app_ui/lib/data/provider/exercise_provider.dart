
import "dart:convert";

import "package:http/http.dart" as http;

class ExerciseProvider {
  
  
  Future<List<dynamic>> getExerciseName() async {

  final apiUrl = Uri.parse('https://exercisedb.p.rapidapi.com/exercises/bodyPartList');
  
  final headers = {
    'X-RapidAPI-Key': 'f925a3a868msh31590fab0d6261cp10a4dcjsn69a1919dfed5',
    'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com'
  };


  try {
    final response = await http.get(apiUrl, headers: headers);
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print("Provider: $data");
      return data;
    }  
    else {
      return ["Error", response.statusCode.toString()];
    }
  } 
  catch (error) {
    return ["Error", "$error"];
  }
  
}
}

// void main(){
//   var a = ExerciseProvider();
//   a.getExerciseName();
// }