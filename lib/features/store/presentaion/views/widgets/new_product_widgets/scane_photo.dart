

import 'package:cache_repo/features/store/presentaion/views/widgets/new_product_widgets/photo_NewProduct_widget.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit,StoreStates>(
      builder: (BuildContext context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomButton(
                      SizeButton: 80,
                      text: 'اضغط لاختيار صوره المنتج',
                      backgroundColor: ColorsApp.defualtColor,
                      textColor: Colors.white,
                      onPressed: () {
                        StoreCubit.get(context).pickImage(ImageSource.gallery);
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery
                        .of(context)
                        .size
                        .width * 1.3,
                    child: Center(
                      child: StoreCubit.get(context).photoBytes == null ? Text('لم يتم اختيار صور بعد') : Image
                          .memory(StoreCubit.get(context).photoBytes!),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CustomButton(
                      fontSize: 30,
                      SizeButton: 60,
                      borderRadius: BorderRadius.circular(10),
                      text: "اضافه",
                      backgroundColor: ColorsApp.defualtColor,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ) ;
      },
    );
  }
}




//
//
//

//
//
// class ImageScreen extends StatefulWidget {
//   @override
//   _ImageScreenState createState() => _ImageScreenState();
// }
//
// class _ImageScreenState extends State<ImageScreen> {
//   File? _imageFile;
//   String? _imagePath;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Screen'),
//       ),
//       body:
//       Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: CustomButton(
//                   SizeButton: 80,
//                   text: 'اضغط لاختيار صوره المنتج',
//                   backgroundColor: ColorsApp.defualtColor,
//                   textColor: Colors.white,
//                   onPressed: () {
//                     _pickImage;
//
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: MediaQuery.of(context).size.width*1.3,
//               child: Center(
//                 child: _imagePath == null ? Text('لم يتم اختيار صور بعد') : Image.memory(
//                   _imagePath!.isNotEmpty ? base64Decode(_imagePath!) : Uint8List(0),
//                   fit: BoxFit.cover,
//                 )
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: CustomButton(
//                 fontSize: 30,
//                 SizeButton: 60,
//                 borderRadius: BorderRadius.circular(10),
//                 text:"اضافه",
//                 backgroundColor: ColorsApp.defualtColor,
//                 textColor: Colors.white,
//                 onPressed: () {
//                   _pickImage();
//
//                 },
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _createTable(Database db) async {
//     await db.execute('CREATE TABLE images (id INTEGER PRIMARY KEY, data BLOB)');
//   }
//
//   Future<void> _saveImage(String base64Image) async {
//     final directory = await getTemporaryDirectory();
//     final path = '${directory.path}/image.db';
//
//     final db = await openDatabase(path, version: 1, onOpen: (database) {
//       // create table if it doesn't exist
//       _createTable(database);
//     });
//
//     await db.transaction((txn) async {
//       await txn.rawInsert('INSERT INTO images (data) VALUES (?)', [base64Image]);
//     });
//
//     await db.close();
//   }
//
//   Future<Object?> _loadImage() async {
//     final directory = await getTemporaryDirectory();
//     final path = '${directory.path}/image.db';
//
//     final db = await openDatabase(path, version: 1, onOpen: (database) {});
//
//     final rows = await db.rawQuery('SELECT data FROM images');
//     final base64Image = rows[0]['data'];
//
//     await db.close();
//
//     return base64Image;
//   }
//
//   void _pickImage() async {
//     final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
//
//     if (myfile == null) return;
//
//     setState(() {
//       _imageFile = File(myfile.path);
//     });
//
//     final bytes = await _imageFile!.readAsBytes();
//     final base64Image = base64Encode(bytes);
//
//     await _saveImage(base64Image);
//     final imagePath = await _loadImage();
//     setState(() {
//       _imagePath = imagePath as String?;
//     });
//   }
// }
