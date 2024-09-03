class Recipe { // might get editted 
  String? title = '';
  String? chef = '';
  int? rate = 0;
  String? time = '';
  String? calories = '';
  String? type = '';
  String? imgPath = '';
  String? vidURL = '';
  bool? isFav = false;
  List<String>? instructions = [];
  List<String>? ingreadiants = [];
  Recipe(
      {this.title,
      this.time,
      this.calories,
      this.chef,
      this.imgPath,
      this.ingreadiants,
      this.instructions,
      this.isFav,
      this.rate,
      this.type,
      this.vidURL});
}
