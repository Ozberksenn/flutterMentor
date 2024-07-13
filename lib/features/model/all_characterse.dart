class AllCharactersWand {
  String? wood;
  String? core;
  int? length;

  AllCharactersWand({
    this.wood,
    this.core,
    this.length,
  });
  AllCharactersWand.fromJson(Map<String, dynamic> json) {
    wood = json['wood']?.toString();
    core = json['core']?.toString();
    length = json['length']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['wood'] = wood;
    data['core'] = core;
    data['length'] = length;
    return data;
  }
}

class AllCharacters {
  String? name;
  List<String?>? alternateNames;
  String? species;
  String? gender;
  String? house;
  String? dateOfBirth;
  int? yearOfBirth;
  bool? wizard;
  AllCharactersWand? wand;
  String? patronus;
  bool? hogwartsStudent;
  bool? hogwartsStaff;
  String? actor;
  bool? alive;
  String? image;

  AllCharacters({
    this.name,
    this.alternateNames,
    this.species,
    this.gender,
    this.house,
    this.dateOfBirth,
    this.yearOfBirth,
    this.wizard,
    this.wand,
    this.patronus,
    this.hogwartsStudent,
    this.hogwartsStaff,
    this.actor,
    this.alive,
    this.image,
  });
  AllCharacters.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    if (json['alternate_names'] != null) {
      final v = json['alternate_names'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      alternateNames = arr0;
    }
    species = json['species']?.toString();
    gender = json['gender']?.toString();
    house = json['house']?.toString();
    dateOfBirth = json['dateOfBirth']?.toString();
    yearOfBirth = json['yearOfBirth']?.toInt();
    wizard = json['wizard'];
    wand = (json['wand'] != null)
        ? AllCharactersWand.fromJson(json['wand'])
        : null;
    patronus = json['patronus']?.toString();
    hogwartsStudent = json['hogwartsStudent'];
    hogwartsStaff = json['hogwartsStaff'];
    actor = json['actor']?.toString();
    alive = json['alive'];
    image = json['image']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    if (alternateNames != null) {
      final v = alternateNames;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['alternate_names'] = arr0;
    }
    data['species'] = species;
    data['gender'] = gender;
    data['house'] = house;
    data['dateOfBirth'] = dateOfBirth;
    data['yearOfBirth'] = yearOfBirth;
    data['wizard'] = wizard;
    if (wand != null) {
      data['wand'] = wand!.toJson();
    }
    data['patronus'] = patronus;
    data['hogwartsStudent'] = hogwartsStudent;
    data['hogwartsStaff'] = hogwartsStaff;
    data['actor'] = actor;
    data['alive'] = alive;
    data['image'] = image;
    return data;
  }
}
