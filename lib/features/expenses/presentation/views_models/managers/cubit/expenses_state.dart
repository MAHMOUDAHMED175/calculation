part of 'expenses_cubit.dart';

@immutable
abstract class ExpensesState {}

class ExpensesInitial extends ExpensesState {}


///database
class ExpensesCreateDatabaseState extends ExpensesState{}
class ExpensesInsertDatabaseState extends ExpensesState{}
class ExpensesGetDatabaseLoadingState extends ExpensesState{}
class ExpensesGetDatabaseLoadedState extends ExpensesState{}
class ExpensesUpdateDatabaseState extends ExpensesState{}
class ExpensesDeleteDatabaseState extends ExpensesState{}
///database


class collectAllExpensesState extends ExpensesState{}


class dateOfDailyExpensesState extends ExpensesState{}
class dateOfMonthlyExpensesState extends ExpensesState{}
