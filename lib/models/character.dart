class Character {
  final String? id;
  final String? name;
  final String? species;
  final String? gender;
  final String? house;
  final int? yearOfBirth;
  final String? eyeColour;
  final String? hairColour;
  final bool? hogwartsStudent;
  final bool? hogwartsStaff;
  final String? actor;
  final bool? alive;
  final String? image;

  Character({
    required this.id,
    required this.name,
    required this.species,
    required this.gender,
    required this.house,
    required this.yearOfBirth,
    required this.eyeColour,
    required this.hairColour,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.actor,
    required this.alive,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json["id"] as String? ?? "",
      name: json["name"] as String? ?? "",
      species: json["species"] as String? ?? "",
      gender: json["gender"] as String? ?? "",
      house: json["house"] as String? ?? "",
      yearOfBirth: (json["yearOfBirth"] as int?) ?? 0,
      eyeColour: json["eyeColour"] as String? ?? "",
      hairColour: json["hairColour"] as String? ?? "",
      hogwartsStudent: json["hogwartsStudent"],
      hogwartsStaff: json["hogwartsStaff"],
      actor: json["actor"] as String? ?? "",
      alive: json["alive"],
      image: json["image"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "species": species,
    "gender": gender,
    "house": house,
    "yearOfBirth": yearOfBirth,
    "eyeColour": eyeColour,
    "hairColour": hairColour,
    "hogwartsStudent": hogwartsStudent,
    "hogwartsStaff": hogwartsStaff,
    "actor": actor,
    "alive": alive,
    "image": image,
  };
}
