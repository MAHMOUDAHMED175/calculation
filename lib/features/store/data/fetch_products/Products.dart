import 'Units.dart';

/// id : 2
/// code : "E-85447"
/// name : "زيت بهية"
/// category : "test sub"
/// brand : "الملكة"
/// quantity : 236
/// image : "no-image.png"
/// units : [{"product_id":"2","unit_id":"2","conversation_factory":"1","barcode":"12345678","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":13},{"product_id":"2","unit_id":"1","conversation_factory":"3","barcode":"12345677","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":14},{"product_id":"2","unit_id":"3","conversation_factory":"3","barcode":"12345667","sale_price":"12","half_sale_price":"6","customer_price":"9","created_at":null,"updated_at":null,"id":15}]

class Products {
  Products({
      this.id, 
      this.code, 
      this.name, 
      this.category, 
      this.brand, 
      this.quantity, 
      this.image, 
      this.units,});

  Products.fromJson(Map<String , dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    category = json['category'];
    brand = json['brand'];
    quantity = json['quantity'];
    image = json['image'];
    if (json['units'] != null) {
      units = [];
      json['units'].forEach((v) {
        units?.add(Units.fromJson(v));
      });
    }
  }
  num? id;
  String? code;
  String? name;
  String? category;
  String? brand;
  num? quantity;
  String? image;
  List<Units>? units;
Products copyWith({  num? id,
  String? code,
  String? name,
  String? category,
  String? brand,
  num? quantity,
  String? image,
  List<Units>? units,
}) => Products(  id: id ?? this.id,
  code: code ?? this.code,
  name: name ?? this.name,
  category: category ?? this.category,
  brand: brand ?? this.brand,
  quantity: quantity ?? this.quantity,
  image: image ?? this.image,
  units: units ?? this.units,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['name'] = name;
    map['category'] = category;
    map['brand'] = brand;
    map['quantity'] = quantity;
    map['image'] = image;
    if (units != null) {
      map['units'] = units?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}