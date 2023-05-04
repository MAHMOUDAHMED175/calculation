import 'Categories.dart';
import 'SubCategories.dart';
import 'Brands.dart';
import 'Products.dart';

/// warehouses : []
/// categories : [{"id":1,"name":"البان"},{"id":2,"name":"زيت"}]
/// sub_categories : [{"id":1,"name":"test sub"},{"id":2,"name":"test sub 2"},{"id":3,"name":"test sub 3"}]
/// brands : [{"id":1,"name":"الملكة"},{"id":2,"name":"جهينة"}]
/// products : [{"id":2,"code":"E-85447","name":"زيت بهية","category":"test sub","brand":"الملكة","quantity":236,"image":"no-image.png","units":[{"product_id":"2","unit_id":"2","conversation_factory":"1","barcode":"12345678","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":13},{"product_id":"2","unit_id":"1","conversation_factory":"3","barcode":"12345677","sale_price":"12","half_sale_price":"6","customer_price":"10","created_at":null,"updated_at":null,"id":14},{"product_id":"2","unit_id":"3","conversation_factory":"3","barcode":"12345667","sale_price":"12","half_sale_price":"6","customer_price":"9","created_at":null,"updated_at":null,"id":15}]},{"id":1,"code":"S-54785","name":"عبوة لبن جهينة","category":"test sub","brand":"جهينة","quantity":0,"image":"no-image.png","units":[]},{"id":3,"code":"S-85246","name":"عبور لاند","category":"test sub 2","brand":"جهينة","quantity":148,"image":"no-image.png","units":[]}]
/// totalRows : 8

class FechProductsModel {
  FechProductsModel({
      this.warehouses, 
      this.categories, 
      this.subCategories, 
      this.brands, 
      this.products, 
      this.totalRows,});

  FechProductsModel.fromJson(Map<String , dynamic> json) {
    if (json['warehouses'] != null) {
      warehouses = [];
      json['warehouses'].forEach((v) {
        // warehouses?.add(null.fromJson(v)); =-----------------lalallalalalalal-------------------------------------la lalalalalallal
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    if (json['sub_categories'] != null) {
      subCategories = [];
      json['sub_categories'].forEach((v) {
        subCategories?.add(SubCategories.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = [];
      json['brands'].forEach((v) {
        brands?.add(Brands.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    totalRows = json['totalRows'];
  }
  List<dynamic>? warehouses;
  List<Categories>? categories;
  List<SubCategories>? subCategories;
  List<Brands>? brands;
  List<Products>? products;
  num? totalRows;
FechProductsModel copyWith({  List<dynamic>? warehouses,
  List<Categories>? categories,
  List<SubCategories>? subCategories,
  List<Brands>? brands,
  List<Products>? products,
  num? totalRows,
}) => FechProductsModel(  warehouses: warehouses ?? this.warehouses,
  categories: categories ?? this.categories,
  subCategories: subCategories ?? this.subCategories,
  brands: brands ?? this.brands,
  products: products ?? this.products,
  totalRows: totalRows ?? this.totalRows,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (warehouses != null) {
      map['warehouses'] = warehouses?.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (subCategories != null) {
      map['sub_categories'] = subCategories?.map((v) => v.toJson()).toList();
    }
    if (brands != null) {
      map['brands'] = brands?.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['totalRows'] = totalRows;
    return map;
  }

}