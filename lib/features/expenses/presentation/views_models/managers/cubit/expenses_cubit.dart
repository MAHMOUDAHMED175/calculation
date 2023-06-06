import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';

part 'expenses_state.dart';

class ExpensesCubit extends Cubit<ExpensesState> {
  ExpensesCubit() : super(ExpensesInitial());

  static ExpensesCubit get(context) => BlocProvider.of(context);

  ///database sqllite
  late Database database;
  List<Map> expensesListItem = [];

  void CreateDatabase() {
    openDatabase(
      'Expenses.db',
      version: 1,
      onCreate: (database, version) {
        print("congratulation database is created");
        database
            .execute(
                'CREATE TABLE expenses(id INTEGER PRIMARY KEY,moneyExpenses TEXT,descriptionExpenses TEXT,DateExpenses TEXT)')
            .then((value) {
          print('table is created');
        }).catchError((error) {
          print('error when create table');
        });
      },
      onOpen: (database) {
        getDatabase(database);
        print("congratulation database is opend");
      },
    ).then((value) {
      database = value;
      emit(ExpensesCreateDatabaseState());
    });
  }

  Future InsertDatabase({
    required String moneyExpenses,
    required String descriptionExpenses,
    required String DateExpenses,
  }) async {
    return await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO expenses(moneyExpenses,descriptionExpenses,DateExpenses)VALUES("$moneyExpenses","$descriptionExpenses","$DateExpenses")')
          .then((value) {
        emit(ExpensesInsertDatabaseState());
        print("values inserted successfully");
        print(value);
        getDatabase(database);
      }).catchError((error) {
        print(error);
      });
    });
  }

  void getDatabase(database) {
    expensesListItem = []; // إعادة تعيين القائمة عند كل استرداد للبيانات
    emit(ExpensesGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM expenses').then((value) {
      value.forEach((element) {
        expensesListItem.add(element);
        print(element.toString());
      });
      collectAllDailyExpenses();

      emit(ExpensesGetDatabaseLoadedState());
    });
  }

  double sumDailyExpenses = 0.0;

  void collectAllDailyExpenses() {
    sumDailyExpenses = 0.0;
    for (int i = 0; i <= expensesListItem.length; i++) {
      sumDailyExpenses =
          sumDailyExpenses + double.parse(expensesListItem[i]['moneyExpenses']);
      emit(collectAllExpensesState());
      print('${sumDailyExpenses} ');
    }
  }

  List<Map> dateOfDailyExpenses = [];

  void DateOfDailyExpenses(String date) {
    dateOfDailyExpenses.clear(); // Clear the list before populating it again

    bool isDateFound = false;

    for (int i = 0; i < expensesListItem.length; i++) {
      if (expensesListItem[i]['DateExpenses'].contains(date.toLowerCase())) {
        dateOfDailyExpenses.add(expensesListItem[i]);

        isDateFound = true;
      }
    }

    if (!isDateFound) {
      print('No expenses found for the specified date.');
      // or you can assign a specific word or message to a variable
      // and use it according to your needs
      dateOfDailyExpenses.clear();
      print('cleeeeeeeeeeeeeeaaaaaaarrrrrr');
    }

    emit(dateOfDailyExpensesState());
  }

  List daysOfMonth = [];
  double sumMonthExpenses = 0.0;

  void getDaysOfMonth(String selectedMonth) {
    daysOfMonth.clear(); // مسح القائمة قبل ملئها من جديد

    bool isMonthFound = false;
    sumMonthExpenses = 0.0; // إعادة تعيين قيمة المجموع للصفر

    for (int i = 0; i < expensesListItem.length; i++) {
      String expenseDate = expensesListItem[i]['DateExpenses'];

      if (expenseDate.substring(0, 7) == selectedMonth.substring(0, 7)) {
        daysOfMonth.add(expensesListItem[i]);
        sumMonthExpenses += double.parse(expensesListItem[i]['moneyExpenses']);
        isMonthFound = true;
      }
    }

    if (!isMonthFound) {
      print('لم يتم العثور على مصاريف للشهر المحدد.');
      daysOfMonth.clear();
      print('تم مسح القائمة');
      sumMonthExpenses = 0.0; // إعادة تعيين قيمة المجموع للصفر
    }

    emit(dateOfMonthlyExpensesState());
  }

// void DeleteData({required int id1, context}) async {
//   await database.transaction((txn) async {
//     await txn.rawDelete('DELETE FROM expenses WHERE id = ?', [id1]);
//   }).then((value) {
//     getDatabase(database);
//     // Check if product[index] was removed from product list
//     if (!SellCubit.get(context).sellProduct.contains(product)) {
//       SellCubit.get(context).sellProduct = product;
//     }
//     emit(ExpensesDeleteDatabaseState());
//   });
//   // final db=await  databaseImages();
//   // db.transaction((txn) async {
//   //   await txn.rawDelete('DELETE FROM user_images WHERE id = ?', [id2]);
//   // }).then((value) {
//   //   getImages(db);
//   //   emit(deletImagesstate());
//   // });
// }

  ///database sqllite
}
