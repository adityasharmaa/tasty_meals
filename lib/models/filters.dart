class Filters {
  bool _glutenFree;
  bool _vegan;
  bool _vegetarian;
  bool _lactoseFree;

  Filters(
    this._glutenFree,
    this._lactoseFree,
    this._vegan,
    this._vegetarian,
  );

  bool get getGluten => _glutenFree;
  bool get getVegan => _vegan;
  bool get getVegetarian => _vegetarian;
  bool get getLacose => _lactoseFree;

  set setGluten(v) => _glutenFree = v;
  set setVegan(v) => _vegan = v;
  set setVegetarian(v) => _vegetarian= v;
  set setLactose(v) => _lactoseFree = v;

}
