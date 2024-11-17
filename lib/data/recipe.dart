import 'ingredient.dart';

// Classe de dados Recipe
//
// Utilizada para criar instâncias de objetos que contêm
// dados relativos a receitas.
class Recipe {
  String _name;
  List<IngredientQuantity> _ingredientList;

  Recipe(this._name, this._ingredientList);

  String getName() {
    return _name;
  }

  void setName(String newName) {
    _name = newName;
  }

  List<IngredientQuantity> getIngredientList() {
    return _ingredientList;
  }

  void setIngredientList(List<IngredientQuantity> newList) {
    _ingredientList = newList;
  }
}

// Classe de dados IngredientQuantity
//
// Utilizada para criar a relação entre ingredientes e a
// quantidade desses mesmos ingredientes que vão ser
// utilizados numa receita.
class IngredientQuantity {
  Ingredient _ingredient;
  double _recipeQuantity;

  IngredientQuantity(this._ingredient, this._recipeQuantity);

  Ingredient getIngredient() {
    return _ingredient;
  }

  void setIngredient(Ingredient newIngredient) {
    _ingredient = newIngredient;
  }

  double getQuantity() {
    return _recipeQuantity;
  }

  void setQuantity(double newQuantity) {
    _recipeQuantity = newQuantity;
  }
}