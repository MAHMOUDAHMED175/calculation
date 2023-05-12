import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'supplires_state.dart';

class SuppliersCubit extends Cubit<SuppliersState> {
  SuppliersCubit() : super(SuppliersInitial());






  static SuppliersCubit get(context) => BlocProvider.of(context);



  ///search
  List searchSuppliersNamePhoneView = [];

  void searchSuppliersNamePhone({required String text}) {
    searchSuppliersNamePhoneView = suppliers
        .where((element) => element['suppliersName'].contains(text.toLowerCase()))
        .toList();
    emit(SuppliersSearchNamePhoneState());
  }

  List searchSuppliersNameMoneyView = [];

  void searchSuppliersNameMoney({required String text}) {
    searchSuppliersNameMoneyView = suppliers
        .where((element) => element['suppliersName'].contains(text.toLowerCase()))
        .toList();
    emit(SuppliersSearchNameMoneyState());
  }
  ///search
  ///
  ///
  ///
  ///
  ///
  ///

  ///database sqllite
  late Database database;
  List<Map> suppliers = [];

  void CreateDatabaseSuppliers() {
    openDatabase(
      'suppliersdb.db',
      version: 1,
      onCreate: (database, version) {
        print("congratulation database suppliers is created");
        database
            .execute(
            'CREATE TABLE suppliers(id INTEGER PRIMARY KEY,suppliersName TEXT,suppliersAddress TEXT,suppliersPhone TEXT,suppliersNote TEXT,money TEXT)')
            .then((value) {
          print('table suppliers is created');
        }).catchError((error) {
          print('error when create table');
        });
      },
      onOpen: (database) {
        getDatabaseSuppliers(database);
        print("congratulation database is opend");
      },
    ).then((value) {
      database = value;
      emit(SuppliersCreateDatabaseState());
    });
  }

  Future InsertDatabaseSuppliers({
    required String suppliersName,
    required String suppliersAddress,
    required String suppliersPhone,
    required String suppliersNote,
    required String money,
  }) async {
    return await database.transaction((txn) {
      return txn
          .rawInsert(
          'INSERT INTO suppliers(suppliersName,suppliersAddress,suppliersPhone,suppliersNote,money)VALUES("$suppliersName","$suppliersAddress","$suppliersPhone","$suppliersNote","$money")')
          .then((value) {
        emit(SuppliersInsertDatabaseState());
        print("values inserted successfully");
        print(value);
        getDatabaseSuppliers(database);
      }).catchError((error) {
        print(error);
      });
    });
  }

  void getDatabaseSuppliers(database) {
    suppliers = []; // إعادة تعيين القائمة عند كل استرداد للبيانات
    searchSuppliersNameMoneyView = []; // إعادة تعيين القائمة عند كل استرداد للبيانات
    searchSuppliersNamePhoneView = []; // إعادة تعيين القائمة عند كل استرداد للبيانات
    emit(SuppliersGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM suppliers').then((value) {
      value.forEach((element) {
        suppliers.add(element);
        searchSuppliersNameMoneyView.add(element);
        searchSuppliersNamePhoneView.add(element);
      });
      emit(SuppliersGetDatabaseState());
    });
  }

  void DeleteDataSuppliers({required String suplName, context}) async {
    await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM suppliers WHERE suppliersName = ?', [suplName]);
    }).then((value) {
      getDatabaseSuppliers(database);
      emit(SuppliersDeleteDatabaseState());
    });
  }

///database sqllite
//////ابقى نعملهم فى المستقبل
//   double d = 0;
//   void moneyStillSuppliers(context) {
//     for (int i = 0; i < suppliers.length; i++) {
//       if (double.parse(suppliers[i]['money']) >= 0) {
//         d += double.parse(suppliers[i]['money']);
//       }
//       emit(sdsd());
//       print('allllllllllllllllllllllllllllllaaaaaaaaaaaaaaahhhhhhhhhh');
//     }
//   }
//
//
//
//   void moneyStillSuppliersm() {
//
//   for (int i = 0; i < suppliers.length; i++) {
//       if (d<0) {
//         d=0;
//       }else{
//         d -= double.parse(suppliers[i]['money']);
//         emit(sdsdm());
//
//       }
//     }
//   }
//




}
