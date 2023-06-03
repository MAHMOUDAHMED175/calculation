import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'supplires_state.dart';

class SuppliersCubit extends Cubit<SuppliersState> {
  SuppliersCubit() : super(SuppliersInitial());






  static SuppliersCubit get(context) => BlocProvider.of(context);



  ///linearSearch
  // List searchSuppliersNamePhoneView = [];
  //
  // void searchSuppliersNamePhone({required String text}) {
  //   searchSuppliersNamePhoneView = suppliers
  //       .where((element) => element['suppliersName'].contains(text.toLowerCase()))
  //       .toList();
  //   emit(SuppliersSearchNamePhoneState());
  // }




  List<Map<String, dynamic>> searchSuppliersNamePhoneView = [];

  void searchSuppliersNamePhone({required String text}) {
    // تحويل القائمة إلى بنية البيانات heap
    heapify(suppliers, suppliers.length);

    // فرز القائمة
    heapSort(suppliers);

    searchSuppliersNamePhoneView = binarySearch(suppliers, text.toLowerCase());
    emit(SuppliersSearchNamePhoneState());
  }
  List<Map<String, dynamic>> binarySearch(List<Map<String, dynamic>> list, String text) {
    List<Map<String, dynamic>> result = [];

    int low = 0;
    int high = list.length - 1;

    while (low <= high) {
      int mid = (low + high) ~/ 2;
      String suppliersName = list[mid]['suppliersName'].toString().toLowerCase();

      if (suppliersName.contains(text)) {
        // تم العثور على تطابق جزئي
        result.add(list[mid]);
        // التحقق من العناصر السابقة
        int prevIndex = mid - 1;
        while (prevIndex >= 0 && list[prevIndex]['suppliersName'].toString().toLowerCase().contains(text)) {
          result.add(list[prevIndex]);
          prevIndex--;
        }
        // التحقق من العناصر التالية
        int nextIndex = mid + 1;
        while (nextIndex < list.length && list[nextIndex]['suppliersName'].toString().toLowerCase().contains(text)) {
          result.add(list[nextIndex]);
          nextIndex++;
        }
        break;
      } else if (suppliersName.compareTo(text) < 0) {
        // القيمة المطلوبة أكبر من القيمة المتوسطة
        low = mid + 1;
      } else {
        // القيمة المطلوبة أصغر من القيمة المتوسطة
        high = mid - 1;
      }
    }

    return result;
  }


  ///heabSort
  void heapify(List<Map<String, dynamic>> list, int n) {
    for (int i = (n ~/ 2) - 1; i >= 0; i--) {
      heapifyUtil(list, n, i);
    }
  }

  void heapifyUtil(List<Map<String, dynamic>> list, int n, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    String suppliersName = list[largest]['suppliersName'].toString().toLowerCase();
    if (left < n && suppliersName.compareTo(list[left]['suppliersName'].toString().toLowerCase()) < 0) {
      largest = left;
    }

    if (right < n && suppliersName.compareTo(list[right]['suppliersName'].toString().toLowerCase()) < 0) {
      largest = right;
    }

    if (largest != i) {
      swap(list, i, largest);
      heapifyUtil(list, n, largest);
    }
  }

  void heapSort(List<Map<String, dynamic>> list) {
    int n = list.length;
    for (int i = n - 1; i >= 0; i--) {
      swap(list, 0, i);
      heapifyUtil(list, i, 0);
    }
  }

  void swap(List<Map<String, dynamic>> list, int i, int j) {
    Map<String, dynamic> temp = list[i];
    list[i] = list[j];
    list[j] = temp;
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
  List<Map<String,dynamic>> suppliers = [];

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
