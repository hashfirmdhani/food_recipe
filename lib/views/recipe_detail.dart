import 'package:flutter/material.dart';
import 'package:food_recipe/model/recipe.dart';
import 'package:food_recipe/views/widget/card_recipe.dart';

class RecipeDetails extends StatelessWidget {
  final String name;
  final String images;
  final String rating;
  final String totalTime;
  final String description;
  final String videoUrl;
  final List<Instructions> instructions;
  final List<Section> sections;

  RecipeDetails({required this.name,
                required this.images,
                required this.rating,
                required this.totalTime,
                required this.description,
                required this.videoUrl,
                required this.instructions,
                required this.sections});

  @override
  Widget build(BuildContext context) {
    List<Component> components = List.from(sections[0].components);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.restaurant_menu),
          SizedBox(width: 10),
          Text('Food Recipe')
         ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            CardRecipe(
                title: name,
                cookTime: totalTime,
                rating: rating,
                urlThumbnail: images,
                videoUrl: videoUrl,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                  child: Text('Description', style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(description,
                    style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.justify)
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Instructions', style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          itemCount: instructions.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(instructions[index].displayText),
                        );
                      }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Ingredients', style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        itemCount: components.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(components[index].rawText),
                          );
                        }),
                  ),
                ],
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
}