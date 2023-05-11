/// product_id : "2"
/// unit_id : "2"
/// conversation_factory : "1"
/// barcode : "12345678"
/// sale_price : "12"
/// half_sale_price : "6"
/// customer_price : "10"
/// created_at : null
/// updated_at : null
/// id : 13

class Units {
  Units({
      this.productId, 
      this.unitId, 
      this.conversationFactory, 
      this.barcode, 
      this.salePrice, 
      this.halfSalePrice, 
      this.customerPrice, 
      this.createdAt, 
      this.updatedAt, 
      this.id,});

  Units.fromJson(Map<String , dynamic> json) {
    productId = json['product_id'];
    unitId = json['unit_id'];
    conversationFactory = json['conversation_factory'];
    barcode = json['barcode'];
    salePrice = json['sale_price'];
    halfSalePrice = json['half_sale_price'];
    customerPrice = json['customer_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
  }
  String? productId;
  String? unitId;
  String? conversationFactory;
  String? barcode;
  String? salePrice;
  String? halfSalePrice;
  String? customerPrice;
  dynamic createdAt;
  dynamic updatedAt;
  num? id;
Units copyWith({  String? productId,
  String? unitId,
  String? conversationFactory,
  String? barcode,
  String? salePrice,
  String? halfSalePrice,
  String? customerPrice,
  dynamic createdAt,
  dynamic updatedAt,
  num? id,
}) => Units(  productId: productId ?? this.productId,
  unitId: unitId ?? this.unitId,
  conversationFactory: conversationFactory ?? this.conversationFactory,
  barcode: barcode ?? this.barcode,
  salePrice: salePrice ?? this.salePrice,
  halfSalePrice: halfSalePrice ?? this.halfSalePrice,
  customerPrice: customerPrice ?? this.customerPrice,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  id: id ?? this.id,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = productId;
    map['unit_id'] = unitId;
    map['conversation_factory'] = conversationFactory;
    map['barcode'] = barcode;
    map['sale_price'] = salePrice;
    map['half_sale_price'] = halfSalePrice;
    map['customer_price'] = customerPrice;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['id'] = id;
    return map;
  }

}