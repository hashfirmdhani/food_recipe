import 'package:flutter/material.dart';
import 'package:food_recipe/model/recipe.api.dart';
import 'package:food_recipe/views/recipe_detail.dart';
import 'package:food_recipe/views/widget/card_recipe.dart';
import '../model/recipe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<Recipe> _recipe;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipe();
  }

  Future<void> getRecipe() async{
    _recipe = await RecipeApi.getRecipe();
    setState(() {
        _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
            itemCount: _recipe.length,
            itemBuilder: (context, index){
              return GestureDetector(
                child: CardRecipe(
                  title: _recipe[index].name,
                  cookTime: _recipe[index].totalTime,
                  rating: _recipe[index].rating.toString(),
                  urlThumbnail: _recipe[index].images,
                  videoUrl: _recipe[index].videoUrl),
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(builder:
                    (context) => RecipeDetails(
                  name: _recipe[index].name,
                  totalTime: _recipe[index].totalTime,
                  rating: _recipe[index].rating.toString(),
                  images: _recipe[index].images,
                        description: _recipe[index].description,
                    videoUrl: _recipe[index].videoUrl,
                      instructions: _recipe[index].instructions,
                      sections: _recipe[index].sections,

                    ),
                    ))
                  },
                  );
              },
          )
        );
      }
    }
