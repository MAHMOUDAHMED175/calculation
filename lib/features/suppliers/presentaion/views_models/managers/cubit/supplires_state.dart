part of 'supplires_cubit.dart';

@immutable
abstract class SuppliersState {}

class SuppliersInitial extends SuppliersState {}
///database
class SuppliersCreateDatabaseState extends SuppliersState{}
class SuppliersInsertDatabaseState extends SuppliersState{}
class SuppliersGetDatabaseLoadingState extends SuppliersState{}
class SuppliersGetDatabaseState extends SuppliersState{}
class SuppliersUpdateDatabaseState extends SuppliersState{}
class SuppliersDeleteDatabaseState extends SuppliersState{}
///database




/// search
class SuppliersSearchNamePhoneState extends SuppliersState{}

class SuppliersSearchNameMoneyState extends SuppliersState{}
/// search




