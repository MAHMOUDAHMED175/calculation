/// id : 1
/// name : "test sub"

class SubCategories {
  SubCategories({
      this.id, 
      this.name,});

  SubCategories.fromJson(Map<String , dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;
SubCategories copyWith({  num? id,
  String? name,
}) => SubCategories(  id: id ?? this.id,
  name: name ?? this.name,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}