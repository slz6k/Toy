import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toy/controller/RecipeController.dart';

class RecipeScreen extends StatelessWidget {
  final RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Recipe'),
      ),
      body: Obx(() {
        if (recipeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(recipeController.recipe.value.thumbnail),
                  SizedBox(height: 10),
                  Text(
                    recipeController.recipe.value.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Category: ${recipeController.recipe.value.category}'),
                  Text('Area: ${recipeController.recipe.value.area}'),
                  SizedBox(height: 10),
                  Text(
                    'Instructions:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(recipeController.recipe.value.instructions),
                ],
              ),
            ),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: recipeController.fetchRandomRecipe,
        tooltip: 'Fetch Random Meal',
        child: Icon(Icons.refresh),
      ),
    );
  }
}