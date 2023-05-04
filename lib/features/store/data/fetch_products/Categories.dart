/// id : 1
/// name : "البان"

class Categories {
  Categories({
      this.id, 
      this.name,});

  Categories.fromJson(Map<String , dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;
Categories copyWith({  num? id,
  String? name,
}) => Categories(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}