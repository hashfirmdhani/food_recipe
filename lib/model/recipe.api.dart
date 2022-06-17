import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:food_recipe/model/recipe.dart';
import 'package:http/http.dart' as http;

class RecipeApi {

  static Future<List<Recipe>> getRecipe() async {
   
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "0",
          "size": "30",
          "tags": "under_30_minutes"});

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "2441c2ac9emsh6cbbd2d4e154892p1a83aejsn453ec1359b02",
      "X-RapidAPI-Host": "tasty.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }

    return Recipe.recipeFromSnapshot(_temp);
  }
}