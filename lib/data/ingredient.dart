// Classe de dados Ingredient
//
// Utilizada para criar instâncias de objetos que contêm
// dados relativos aos ingredientes.
class Ingredient {
  String _name;

  Ingredient(this._name);

  String getName() {
    return _name;
  }

  void setName(String newName) {
    _name = newName;
  }
}