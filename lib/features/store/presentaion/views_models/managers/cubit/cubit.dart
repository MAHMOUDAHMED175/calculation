import 'dart:io';

import 'package:cache_repo/core/errors/exeptions.dart';
import 'package:cache_repo/core/errors/failure.dart';
import 'package:cache_repo/core/utils/dioHelper.dart';
import 'package:cache_repo/features/sell/presentaion/views_models/managers/cubit/sell_cubit.dart';
import 'package:cache_repo/features/store/data/fetch_products/FechProducts.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../../core/errors/error_message_model.dart';
import '../../../../data/product_tree/ModelProduct.dart';



class StoreCubit extends Cubit<StoreStates> {
  StoreCubit() : super(StoreInitialState());

  static StoreCubit get(context) => BlocProvider.of(context);

  ///NavigationButton
  // int currentIndex = 0;
  // List<Widget> screen=[
  //   NewTasks(),
  //   DoneTasks(),
  //   ArchiveTasks(),
  // ];
  //
  // void ChangeIndex(index){
  //   currentIndex=index;
  //   emit(StoreChangeCurvedNavBarState());
  //
  // }
  ///NavigationButton

  ///searchProduct
  List searchCount = [];

  void searchProductCount({required String text}) {
    int num = int.parse(text);
    searchCount = product
        .where((element) => int.parse(element['productCount']) <= num)
        .toList();
    emit(searchProductCountState());
  }

  List searchStoreViewProduct = [];

  void searchProductView({required String text}) {
    searchStoreViewProduct = product
        .where((element) => element['productName'].contains(text.toLowerCase()))
        .toList();
    emit(searchStoreViewstate());
  }

  ///TakePhoto
  File? imagesFile;
  String? savePathImage;

  Future<void> takeImageGellary(context) async {
    final XFile? imageFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile == null) {
      return;
    }
    imagesFile = File(imageFile.path);
    emit(takeImageGellaryState());
    final apDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imagesFile!.path);
    final saveImagepath = await imagesFile!.copy('${apDir.path}/$fileName');
    Navigator.pop(context);

    addImagePlace(saveImagepath);

  }

  Future<void> takeImageCamera(context) async {
    final XFile? imageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (imageFile == null) {
      return;
    }
    imagesFile = File(imageFile.path);
    emit(takeImageCameraState());

    final apDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imagesFile!.path);

    final saveImagepath = await imagesFile!.copy('${apDir.path}/$fileName');
    Navigator.pop(context);
    addImagePlace(saveImagepath);

  }

  void addImagePlace(File image) {
    savePathImage = image.path;
    // print(image.path);
  }

  ///TakePhoto

  ///database sqllite
  late Database database;
  List<Map> product = [];
  List<num> allPriceSells = [];

  void CreateDatabase() {
    openDatabase(
      'store.db',
      version: 1,
      onCreate: (database, version) {
        print("congratulation database is created");
        database
            .execute(
                'CREATE TABLE store(id INTEGER PRIMARY KEY,image TEXT,qrCode TEXT,productName TEXT,productDetails TEXT,productBuy TEXT,productSell TEXT,productCount TEXT,productDate TEXT)')
            .then((value) {
          print('table is created');
        }).catchError((error) {
          print('errror when create table');
        });
      },
      onOpen: (database) {
        getDatabase(database);
        print("congratulation database is opend");
      },
    ).then((value) {
      database = value;
      emit(StoreCreateDatabaseState());
    });
  }

  Future InsertDatabase({
    required String qrCode,
    String? image,
    required String productName,
    required String productDetails,
    required String productBuy,
    required String productSell,
    required String productCount,
    required String productDate,
  }) async {
    return await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO store(qrCode,image,productName,productDetails,productBuy,productSell,productCount,productDate)VALUES("$qrCode","$image","$productName","$productDetails","$productBuy","$productSell","$productCount","$productDate")')
          .then((value) {
        emit(StoreInsertDatabaseState());
        print("values inserted successfully");
        print(value);
        getDatabase(database);
      }).catchError((error) {
        print(error);
      });
    });
  }

  void getDatabase(database) {
    product = []; // إعادة تعيين القائمة عند كل استرداد للبيانات
    allPriceSells = []; // إعادة تعيين القائمة عند كل استرداد للبيانات
    emit(StoreGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM store').then((value) {
      value.forEach((element) {
        product.add(element);
        // حساب قيمة allPriceSell للعنصر الحالي وإضافتها للقائمة
        num allPriceSell = int.parse(element['productCount']) *
            int.parse(element['productSell']);
        allPriceSells.add(allPriceSell);
      });
      emit(StoreGetDatabaseState());
    });
  }

  void updateData(
    String qrCode,
    String productName,
    String productDetails,
    String productBuy,
    String productSell,
    String productCount,
    String productDate,
    int id,
  ) async {
    database.rawUpdate(
      'UPDATE store SET qrCode=?,productName=?,productDetails=?,productBuy=?,productSell=?,productCount=?,productDate=? WHERE id=?',
      [
        qrCode,
        productName,
        productDetails,
        productBuy,
        productSell,
        productCount,
        productDate,
        id
      ],
    ).then((value) {
      getDatabase(database);
      emit(StoreUpdateDatabaseState());
    });
  }

  void DeleteData({required int id1, context}) async {
    await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM store WHERE id = ?', [id1]);
    }).then((value) {
      getDatabase(database);
      // Check if product[index] was removed from product list
      if (!SellCubit.get(context).sellProduct.contains(product)) {
        SellCubit.get(context).sellProduct = product;
      }
      emit(StoreDeleteDatabaseState());
    });
    // final db=await  databaseImages();
    // db.transaction((txn) async {
    //   await txn.rawDelete('DELETE FROM user_images WHERE id = ?', [id2]);
    // }).then((value) {
    //   getImages(db);
    //   emit(deletImagesstate());
    // });
  }

  ///database sqllite

  ///qr_code
  QRViewController? controller;
  String scannedText = '';

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    emit(controllerQrCodeState());
    controller.scannedDataStream.listen((scanData) {
      scannedText = scanData.code!;
      emit(scaneQrCodeState());
    });
  }

  ///qr_code

  /// sellAddCountProduct
//   int productCount = 1;
//   void addProductItem() {
//     productCount++;
//     emit(addProductItemstate());
//   }
//   void minusProductItem() {
//     if (productCount > 1) {
//       productCount--;
//       emit(minusProductItemstate());
//     }
//   }
  /// sellAddCountProduct
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///
///                                api
///
///
///
///
///
///                       ProductTree
  ModelProduct? modelProduct;

///
  Future<Either<Failure, ModelProduct>> ProductTree() async {
      emit(GetProductTreeLoadingState());
      print('لسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسه');

      try {
      final response = await DioHelper.getData(url: '/products/tree');
      if (response.statusCode == 200) {
         modelProduct = ModelProduct.fromJson(response.data);
         print(modelProduct.toString());
             emit((GetProductTreeSuccessState()));
             print('ايوا ايوا ايوا ايو ا ايوا ايوا ');


         return right(modelProduct!);
      } else {
        emit((GetProductTreeErrorState()));
        print('لسسسغلط لغط غلط علط غلط غلط لغلط لغلط');

        throw ServerException(
            errorMessageModel: ErrorMessageModel.formJson(response.data));
      }
    } on ServerException catch (error) {
        print('لسسسغلط لغط غلط علط غلط غلط لغلط لغلط');

        emit((GetProductTreeErrorState()));
      return left(ServerFailure(error.errorMessageModel.status_message));

    }
  }




  FechProductsModel? fechProductsModel;

  Future<Either<Failure, FechProductsModel>> FechProducts() async {
      emit(GetFechProductsLoadingState());
      print('لسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسسه');

      try {
      final response = await DioHelper.getData(url: '/products?limit=3&SortField=cost&SortType=desc');
      if (response.statusCode == 200) {
         fechProductsModel = FechProductsModel.fromJson(response.data);
         print(fechProductsModel.toString());
             emit((GetProductTreeSuccessState()));
             print('ايوا ايوا ايوا ايو ا ايوا ايوا ');


         return right(fechProductsModel!);
      } else {
        emit((GetFechProductsErrorState()));
        print('لسسسغلط لغط غلط علط غلط غلط لغلط لغلط');

        throw ServerException(
            errorMessageModel: ErrorMessageModel.formJson(response.data));
      }
    } on ServerException catch (error) {
        print('لسسسغلط لغط غلط علط غلط غلط لغلط لغلط');

        emit((GetFechProductsErrorState()));
      return left(ServerFailure(error.errorMessageModel.status_message));

    }
  }






}
