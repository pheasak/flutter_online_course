class CharacterModel {
  int? id;
  String? name;
  String? size;
  String? age;
  String? bounty;

  CharacterModel({this.id, this.name, this.size, this.age, this.bounty});

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
    id: json["id"],
    name: json["name"],
    size: json["size"],
    age: json["age"],
    bounty: json["bounty"],
  );
}
