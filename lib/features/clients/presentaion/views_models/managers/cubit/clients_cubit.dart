import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'clients_state.dart';

class ClientsCubit extends Cubit<ClientsState> {
  ClientsCubit() : super(ClientsInitial());






  static ClientsCubit get(context) => BlocProvider.of(context);



  ///linearSearch
  // List searchClientsNamePhoneView = [];
  //
  // void searchClientsNamePhone({required String text}) {
  //   searchClientsNamePhoneView = clients
  //       .where((element) => element['clientsName'].contains(text.toLowerCase()))
  //       .toList();
  //   emit(ClientsSearchNamePhoneState());
  // }




  List<Map<String, dynamic>> searchClientsNamePhoneView = [];

  void searchClientsNamePhone({required String text}) {
    // تحويل القائمة إلى بنية البيانات heap
    heapify(clients, clients.length);

    // فرز القائمة
    heapSort(clients);

    searchClientsNamePhoneView = binarySearch(clients, text.toLowerCase());
    emit(ClientsSearchNamePhoneState());
  }
  List<Map<String, dynamic>> binarySearch(List<Map<String, dynamic>> list, String text) {
    List<Map<String, dynamic>> result = [];

    int low = 0;
    int high = list.length - 1;

    while (low <= high) {
      int mid = (low + high) ~/ 2;
      String clientsName = list[mid]['clientsName'].toString().toLowerCase();

      if (clientsName.contains(text)) {
        // تم العثور على تطابق جزئي
        result.add(list[mid]);
        // التحقق من العناصر السابقة
        int prevIndex = mid - 1;
        while (prevIndex >= 0 && list[prevIndex]['clientsName'].toString().toLowerCase().contains(text)) {
          result.add(list[prevIndex]);
          prevIndex--;
        }
        // التحقق من العناصر التالية
        int nextIndex = mid + 1;
        while (nextIndex < list.length && list[nextIndex]['clientsName'].toString().toLowerCase().contains(text)) {
          result.add(list[nextIndex]);
          nextIndex++;
        }
        break;
      } else if (clientsName.compareTo(text) < 0) {
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

    String clientsName = list[largest]['clientsName'].toString().toLowerCase();
    if (left < n && clientsName.compareTo(list[left]['clientsName'].toString().toLowerCase()) < 0) {
      largest = left;
    }

    if (right < n && clientsName.compareTo(list[right]['clientsName'].toString().toLowerCase()) < 0) {
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













  List searchClientsNameMoneyView = [];

  void searchClientsNameMoney({required String text}) {
    searchClientsNameMoneyView = clients
        .where((element) => element['clientsName'].contains(text.toLowerCase()))
        .toList();
    emit(ClientsSearchNameMoneyState());
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
  List<Map<String,dynamic>> clients = [];

  void CreateDatabaseClients() {
    openDatabase(
      'clientssdb.db',
      version: 1,
      onCreate: (database, version) {
        print("congratulation database clients is created");
        database
            .execute(
            'CREATE TABLE clients(id INTEGER PRIMARY KEY,clientsName TEXT,clientsAddress TEXT,clientsPhone TEXT,clientsNote TEXT,money TEXT)')
            .then((value) {
          print('table clients is created');
        }).catchError((error) {
          print('error when create table');
        });
      },
      onOpen: (database) {
        getDatabaseClients(database);
        print("congratulation database is opend");
      },
    ).then((value) {
      database = value;
      emit(ClientsCreateDatabaseState());
    });
  }

  Future InsertDatabaseClients({
    required String clientsName,
    required String clientsAddress,
    required String clientsPhone,
    required String clientsNote,
    required String money,
  }) async {
    return await database.transaction((txn) {
      return txn
          .rawInsert(
          'INSERT INTO clients(clientsName,clientsAddress,clientsPhone,clientsNote,money)VALUES("$clientsName","$clientsAddress","$clientsPhone","$clientsNote","$money")')
          .then((value) {
        emit(ClientsInsertDatabaseState());
        print("values inserted successfully");
        print(value);
        getDatabaseClients(database);
      }).catchError((error) {
        print(error);
      });
    });
  }

  void getDatabaseClients(database) {
    clients = []; // إعادة تعيين القائمة عند كل استرداد للبيانات
    searchClientsNameMoneyView = []; // إعادة تعيين القائمة عند كل استرداد للبيانات
    searchClientsNamePhoneView = []; // إعادة تعيين القائمة عند كل استرداد للبيانات
    emit(ClientsGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM clients').then((value) {
      value.forEach((element) {
        clients.add(element);
        searchClientsNameMoneyView.add(element);
        searchClientsNamePhoneView.add(element);
      });
      emit(ClientsGetDatabaseState());
    });
  }

  void DeleteDataClients({required String suplName, context}) async {
    await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM clients WHERE clientsName = ?', [suplName]);
    }).then((value) {
      getDatabaseClients(database);
      emit(ClientsDeleteDatabaseState());
    });
  }

///database sqllite
//////ابقى نعملهم فى المستقبل
//   double d = 0;
//   void moneyStillClients(context) {
//     for (int i = 0; i < clients.length; i++) {
//       if (double.parse(clients[i]['money']) >= 0) {
//         d += double.parse(clients[i]['money']);
//       }
//       emit(sdsd());
//       print('allllllllllllllllllllllllllllllaaaaaaaaaaaaaaahhhhhhhhhh');
//     }
//   }
//
//
//
//   void moneyStillClientsm() {
//
//   for (int i = 0; i < clients.length; i++) {
//       if (d<0) {
//         d=0;
//       }else{
//         d -= double.parse(clients[i]['money']);
//         emit(sdsdm());
//
//       }
//     }
//   }
//




}
