import 'package:equatable/equatable.dart';

import 'Product.dart';

/// main_cat : "البان"
/// sub_cat : "test sub"
/// product : [{"code":"S-54785","ar_name":"عبوة لبن جهينة","units":[]},{"code":"E-85447","ar_name":"زيت بهية","units":[{"product_id":"2","unit_id":"2","conversation_factory":"1","barcode":"12345678","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":13},{"product_id":"2","unit_id":"1","conversation_factory":"3","barcode":"12345677","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":14},{"product_id":"2","unit_id":"3","conversation_factory":"3","barcode":"12345667","sale_price":"12","half_sale_price":"6","customer_price":"9","created_at":null,"updated_at":null,"id":15}]}]

class Data extends Equatable {
  Data({
    this.mainCat,
    this.subCat,
    this.product,
  });

  Data.fromJson(Map<String, dynamic> json) {
    mainCat = json['main_cat'];
    subCat = json['sub_cat'];
    if (json['product'] != null) {
      json['product'].forEach((v) {
        product?.add(Product.fromJson(v));
      });
    }
  }

  String? mainCat;
  String? subCat;
  List<Product>? product=[];

  Data copyWith({
    String? mainCat,
    String? subCat,
    List<Product>? product,
  }) =>
      Data(
        mainCat: mainCat ?? this.mainCat,
        subCat: subCat ?? this.subCat,
        product: product ?? this.product,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['main_cat'] = mainCat;
    map['sub_cat'] = subCat;
    if (product != null) {
      map['product'] = product?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  List<Object?> get props => [
        mainCat,
        subCat,
        product,
      ];
}
