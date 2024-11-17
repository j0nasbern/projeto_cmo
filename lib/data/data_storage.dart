import 'ingredient.dart';
import 'recipe.dart';

// Classe de dados DataStorage
//
// Classe principal de armazem de dados onde é feito o
// armazenamento pricipal dos dados da sessão. Contém uma
// lista para cada um dos aspetos da app
class DataStorage {
  List<Ingredient> _ingredientList;
  List<Recipe> _recipeList;

  DataStorage(this._ingredientList, this._recipeList);

  List<Ingredient> getIngredientList() {
    return _ingredientList;
  }

  void setIngredientList(List<Ingredient> newList) {
    _ingredientList = newList;
  }

  List<Recipe> getRecipeList() {
    return _recipeList;
  }

  void setRecipeList(List<Recipe> newList) {
    _recipeList = newList;
  }
}