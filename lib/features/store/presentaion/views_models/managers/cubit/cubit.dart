import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sqflite/sqflite.dart';

class StoreCubit extends Cubit<StoreStates> {
  StoreCubit() : super(StoreInitialState());

  static StoreCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

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

  final ImagePickerPlatform _picker = ImagePickerPlatform.instance;
  PickedFile? pickedFile;
  Uint8List? photoBytes;

  Future pickImage(ImageSource source) async {
    await _picker
        .pickImage(
      source: source,
    )
        .then((value) async {
      pickedFile = value;
//! set photo bytes of selected image
      if (pickedFile != null)
        photoBytes = await File(pickedFile!.path).readAsBytes();


      emit(ImagePickerstate());
    }).catchError((error) {});
  }


  List searchp = [];

  void searchProduct({required String text}) {
    int num = int.parse(text);

    searchp = product
        .where((element) => int.parse(element['productCount']) <= num)
        .toList();
    emit(searchProductState());
  }

  List searchStoreViewProduct = [];

  void searchStoreView({required String text}) {
    searchp = product
        .where((element) => element['productName'].contains(text.toLowerCase()))
        .toList();
    emit(searchStoreViewstate());
  }

  late Database database;
  List<Map> product = [];

  void CreateDatabase() {
    openDatabase(
      'store.db',
      version: 1,
      onCreate: (database, version) {
        print("congratulation database is created");
        database
            .execute(
            'CREATE TABLE store(id INTEGER PRIMARY KEY,qrCode TEXT,productName TEXT,productDetails TEXT,productBuy TEXT,productSell TEXT,productCount TEXT,productDate TEXT)')
        // 'CREATE TABLE store(id INTEGER PRIMARY KEY,imageProduct BLOB,qrCode TEXT,productName TEXT,productDetails TEXT,productBuy TEXT,productSell TEXT,productCount TEXT,productDate TEXT)')
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
          'INSERT INTO store(qrCode,productName,productDetails,productBuy,productSell,productCount,productDate)VALUES("$qrCode","$productName","$productDetails","$productBuy","$productSell","$productCount","$productDate")')
      // 'INSERT INTO store(imageProduct,qrCode,productName,productDetails,productBuy,productSell,productCount,productDate)VALUES("$photoBytes","$qrCode","$productName","$productDetails","$productBuy","$productSell","$productCount","$productDate")')
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
    product = [];
    emit(StoreGetDatabaseLoadingState());

    database.rawQuery('SELECT * FROM store').then((value) {
      value.forEach((element) {

        product.add(element);
        print(product);
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

  void DeleteData(
    int id,
  ) async {
    database.rawDelete(
      'DELETE  FROM store WHERE id=?',
      [id],
    ).then((value) {
      getDatabase(database);
      emit(StoreDeleteDatabaseState());
    });
  }

  QRViewController? controller;
  String scannedText = '';

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    emit(controllerState());
    controller.scannedDataStream.listen((scanData) {
      scannedText = scanData.code!;
      emit(scaneQrCodeState());
    });
  }
}
