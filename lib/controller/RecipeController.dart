import 'package:get/get.dart';
import 'package:toy/model/Recipe.dart';

class RecipeController extends GetxController {
  var isLoading = true.obs;
  var recipe = Recipe(
    id: '',
    name: '',
    category: '',
    area: '',
    instructions: '',
    thumbnail: '',
  ).obs;

  @override
  void onInit() {
    fetchRandomRecipe();
    super.onInit();
  }

  void fetchRandomRecipe() async {
    isLoading(true);
    try {
      final response = await GetConnect().get('https://www.themealdb.com/api/json/v1/1/random.php');
      if (response.statusCode == 200) {
        var jsonData = response.body;
        if (jsonData['meals'] != null && jsonData['meals'].isNotEmpty) {
          recipe(Recipe.fromJson(jsonData['meals'][0]));
        }
      }
    } catch (e) {
      print("Error fetching recipe: $e");
    } finally {
      isLoading(false);
    }
  }
}
