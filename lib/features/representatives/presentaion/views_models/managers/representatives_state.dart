part of 'representatives_cubit.dart';

abstract class RepresentativesState {
  const RepresentativesState();
}

class RepresentativesInitial extends RepresentativesState {}

class RepresentativestakeImageGellaryState extends RepresentativesState {}

class RepresentativestakeImageCameraState extends RepresentativesState {}
class RepresentativestakeSaveImageState extends RepresentativesState {}



///search
class RepresentativestakeSearchNameState extends RepresentativesState {}







class RepresentativesChooseRepresentState extends RepresentativesState {}


///database
class RepresentativesCreateDatabaseState extends RepresentativesState{}
class RepresentativesInsertDatabaseState extends RepresentativesState{}
class RepresentativesGetDatabaseLoadingState extends RepresentativesState{}
class RepresentativesGetDatabaseState extends RepresentativesState{}
class RepresentativesUpdateDatabaseState extends RepresentativesState{}
class RepresentativesDeleteDatabaseState extends RepresentativesState{}
///database

