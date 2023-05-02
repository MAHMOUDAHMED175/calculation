import 'package:equatable/equatable.dart';

import 'Units.dart';

/// code : "E-85447"
/// ar_name : "زيت بهية"
/// units : [{"product_id":"2","unit_id":"2","conversation_factory":"1","barcode":"12345678","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":13},{"product_id":"2","unit_id":"1","conversation_factory":"3","barcode":"12345677","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":14},{"product_id":"2","unit_id":"3","conversation_factory":"3","barcode":"12345667","sale_price":"12","half_sale_price":"6","customer_price":"9","created_at":null,"updated_at":null,"id":15}]

class Product extends Equatable {
  Product({
      this.code, 
      this.arName, 
      this.units,});

  Product.fromJson(Map<String,dynamic> json) {
    code = json['code'];
    arName = json['ar_name'];
    if (json['units'] != null) {
      json['units'].forEach((v) {
        units?.add(Units.fromJson(v));
      });
    }
  }
  String? code;
  String? arName;
  List<Units>? units=[];
Product copyWith({  String? code,
  String? arName,
  List<Units>? units,
}) => Product(  code: code ?? this.code,
  arName: arName ?? this.arName,
  units: units ?? this.units,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['ar_name'] = arName;
    if (units != null) {
      map['units'] = units?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      code,
      arName,
      units,
    ];
  }

}