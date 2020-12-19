import 'package:Recipe_App/constants/random.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
Future<Mobile> fetchRecipe() async {
  final response = await http.get('http://192.168.42.163:5000/random');
  if (response.body !=null) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Mobile.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load recipe');
  }
}
Future<Mobile> fetchBeverages() async {
  final response = await http.get('http://192.168.42.163:5000/categories?category=beverages');
  if (response.body !=null) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Mobile.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load recipe');
  }
}



