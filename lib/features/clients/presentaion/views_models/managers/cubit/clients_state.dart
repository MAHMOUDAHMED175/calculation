part of 'clients_cubit.dart';

@immutable
abstract class ClientsState {}

class ClientsInitial extends ClientsState {}
///database
class ClientsCreateDatabaseState extends ClientsState{}
class ClientsInsertDatabaseState extends ClientsState{}
class ClientsGetDatabaseLoadingState extends ClientsState{}
class ClientsGetDatabaseState extends ClientsState{}
class ClientsUpdateDatabaseState extends ClientsState{}
class ClientsDeleteDatabaseState extends ClientsState{}
///database




/// search
class ClientsSearchNamePhoneState extends ClientsState{}

class ClientsSearchNameMoneyState extends ClientsState{}

/// search




