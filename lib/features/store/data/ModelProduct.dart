import 'package:equatable/equatable.dart';

import 'Data.dart';

/// status : 200
/// data : [{"main_cat":"البان","sub_cat":"test sub","product":[{"code":"S-54785","ar_name":"عبوة لبن جهينة","units":[]},{"code":"E-85447","ar_name":"زيت بهية","units":[{"product_id":"2","unit_id":"2","conversation_factory":"1","barcode":"12345678","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":13},{"product_id":"2","unit_id":"1","conversation_factory":"3","barcode":"12345677","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":14},{"product_id":"2","unit_id":"3","conversation_factory":"3","barcode":"12345667","sale_price":"12","half_sale_price":"6","customer_price":"9","created_at":null,"updated_at":null,"id":15}]}]},{"main_cat":"البان","sub_cat":"test sub 2","product":[{"code":"S-54785","ar_name":"عبوة لبن جهينة","units":[]},{"code":"E-85447","ar_name":"زيت بهية","units":[{"product_id":"2","unit_id":"2","conversation_factory":"1","barcode":"12345678","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":13},{"product_id":"2","unit_id":"1","conversation_factory":"3","barcode":"12345677","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":14},{"product_id":"2","unit_id":"3","conversation_factory":"3","barcode":"12345667","sale_price":"12","half_sale_price":"6","customer_price":"9","created_at":null,"updated_at":null,"id":15}]},{"code":"S-85246","ar_name":"عبور لاند","units":[]}]},{"main_cat":"زيت","sub_cat":"test sub 3","product":[{"code":"S-54785","ar_name":"عبوة لبن جهينة","units":[]},{"code":"E-85447","ar_name":"زيت بهية","units":[{"product_id":"2","unit_id":"2","conversation_factory":"1","barcode":"12345678","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":13},{"product_id":"2","unit_id":"1","conversation_factory":"3","barcode":"12345677","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":14},{"product_id":"2","unit_id":"3","conversation_factory":"3","barcode":"12345667","sale_price":"12","half_sale_price":"6","customer_price":"9","created_at":null,"updated_at":null,"id":15}]},{"code":"S-85246","ar_name":"عبور لاند","units":[]}]}]

class ModelProduct extends Equatable{
  ModelProduct({
      this.status, 
      this.data,});

  ModelProduct.fromJson(Map<String,dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  num? status;
  List<Data>? data;
ModelProduct copyWith({  num? status,
  List<Data>? data,
}) => ModelProduct(  status: status ?? this.status,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  List<Object?> get props =>[
    status,
    data,
  ];

}