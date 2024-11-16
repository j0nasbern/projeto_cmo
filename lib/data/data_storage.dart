// Data storage class to create an instance with the necessary Lists
class DataStorage {
  List<String> _ingredientList;

  DataStorage(this._ingredientList);

  List<String> getIngredientList() {
    return _ingredientList;
  }

  void setIngredientList(List<String> ingredientList) {
    _ingredientList = ingredientList;
  }
}