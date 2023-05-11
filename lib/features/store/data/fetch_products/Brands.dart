/// id : 1
/// name : "الملكة"

class Brands {
  Brands({
      this.id, 
      this.name,});

  Brands.fromJson(Map<String , dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;
Brands copyWith({  num? id,
  String? name,
}) => Brands(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}