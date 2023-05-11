import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:sqflite/sqflite.dart';

part 'representatives_state.dart';

class RepresentativesCubit extends Cubit<RepresentativesState> {
  RepresentativesCubit() : super(RepresentativesInitial());

  static RepresentativesCubit get(context) => BlocProvider.of(context);

  ///TakePhoto
  File? imagesFileRepresentative;
  String? savePathImageRepresentative;

  Future<void> takeImageGellaryRepresentative(context) async {
    final XFile? imageFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile == null) {
      return;
    }
    imagesFileRepresentative = File(imageFile.path);

    emit(RepresentativestakeImageGellaryState());

    final apDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imagesFileRepresentative!.path);
    final saveImagepath =
        await imagesFileRepresentative!.copy('${apDir.path}/$fileName');

    addImagePlaceRepresentative(saveImagepath);
    Navigator.pop(context);

  }

  Future<void> takeImageCameraRepresentative(context) async {
    final XFile? imageFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (imageFile == null) {
      return;
    }
    imagesFileRepresentative = File(imageFile.path);

    emit(RepresentativestakeImageCameraState());

    final apDir = await syspath.getApplicationDocumentsDirectory();
    final fileName = path.basename(imagesFileRepresentative!.path);
    final saveImagepath =
        await imagesFileRepresentative!.copy('${apDir.path}/$fileName');
    addImagePlaceRepresentative(saveImagepath);
    Navigator.pop(context);
  }

  void addImagePlaceRepresentative(File image) {
    savePathImageRepresentative = image.path;
    emit(RepresentativestakeSaveImageState());
    print(image.path);
  }

  ///TakePhoto
  ///
  ///
  ///



  List searchRepresentativeNameView = [];

  void searchRepresentativesView({required String text}) {
    searchRepresentativeNameView = represent
        .where((element) => element['representName'].contains(text.toLowerCase()))
        .toList();
    emit(RepresentativestakeSearchNameState());
  }
  ///
  ///
  ///
  ///
  ///
  ///

  ///database sqllite
  late Database database;
  List<Map> represent = [];

  void CreateDatabaseRepresent() {
    openDatabase(
      'representdb.db',
      version: 1,
      onCreate: (database, version) {
        print("congratulation database represent is created");
        database
            .execute(
                'CREATE TABLE represent(id INTEGER PRIMARY KEY,image TEXT,representName TEXT,representDetails TEXT,representPhone TEXT,representNote TEXT)')
            .then((value) {
          print('table represent is created');
        }).catchError((error) {
          print('error when create table');
        });
      },
      onOpen: (database) {
        getDatabaseRepresent(database);
        print("congratulation database is opend");
      },
    ).then((value) {
      database = value;
      emit(RepresentativesCreateDatabaseState());
    });
  }

  Future InsertDatabaseRepresent({
    String? image,
    required String representName,
    required String representDetails,
    required String representPhone,
    required String representNote,
  }) async {
    return await database.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO represent(image,representName,representDetails,representPhone,representNote)VALUES("$image","$representName","$representDetails","$representPhone","$representNote")')
          .then((value) {
        emit(RepresentativesInsertDatabaseState());
        print("values inserted successfully");
        print(value);
        getDatabaseRepresent(database);
      }).catchError((error) {
        print(error);
      });
    });
  }

  void getDatabaseRepresent(database) {
    represent = []; // إعادة تعيين القائمة عند كل استرداد للبيانات
    emit(RepresentativesGetDatabaseLoadingState());
    database.rawQuery('SELECT * FROM represent').then((value) {
      value.forEach((element) {
        represent.add(element);
      });
      emit(RepresentativesGetDatabaseState());
    });
  }

  void DeleteDataRepresent({required String repName, context}) async {
    await database.transaction((txn) async {
      await txn.rawDelete('DELETE FROM represent WHERE representName = ?', [repName]);
    }).then((value) {
      getDatabaseRepresent(database);
      emit(RepresentativesDeleteDatabaseState());
    });
  }

  ///database sqllite
}
