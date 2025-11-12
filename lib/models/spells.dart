class Spell {
  final String? id;
  final String? name;
  final String description;

  Spell({required this.id, required this.name, required this.description});

  factory Spell.fromJson(Map<String, dynamic> json) {
    return Spell(
      id: json["id"] as String? ?? "",
      name: json["name"] as String? ?? "",
      description: json["description"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
  };
}
