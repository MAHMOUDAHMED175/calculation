import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// class ImageScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<StoreCubit, StoreStates>(
//       builder: (BuildContext context, state) {
//         return Scaffold(
//           body: SafeArea(
//             child: Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: CustomButton(
//                       SizeButton: 80,
//                       text: 'اضغط لاختيار صوره المنتج',
//                       backgroundColor: ColorsApp.defualtColor,
//                       textColor: Colors.white,
//                       onPressed: () {
//                         StoreCubit.get(context).pickImage(ImageSource.gallery);
//                       },
//                     ),
//                   ),
//                   SizedBox(
//                     height: MediaQuery.of(context).size.width * 1.3,
//                     child: Center(
//                       child: StoreCubit.get(context).photoBytes == null
//                           ? Text('لم يتم اختيار صور بعد')
//                           : Image.memory(StoreCubit.get(context).photoBytes!),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: CustomButton(
//                       fontSize: 30,
//                       SizeButton: 60,
//                       borderRadius: BorderRadius.circular(10),
//                       text: "اضافه",
//                       backgroundColor: ColorsApp.defualtColor,
//                       textColor: Colors.white,
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
//
//
//
//




































































class Images extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit,StoreStates>(
        builder:(context,state){
          return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.deepOrange,
                      ),
                    ),
                    child: StoreCubit.get(context).imagesFile != null
                        ? Image.file(
                      StoreCubit.get(context).imagesFile!,
                      fit: BoxFit.cover,
                    )
                        : Text('ccccccccccccccccccccccccccccccccccccccccc'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomButton(
                    fontSize: 30,
                    SizeButton: 60,
                    borderRadius: BorderRadius.circular(10),
                    text: "اضافه صوره من التلفون",
                    backgroundColor: ColorsApp.defualtColor,
                    textColor: Colors.white,
                    onPressed: () {
                      StoreCubit.get(context).takeImageGellary();
                    },
                  ),
                ),
                TextButton.icon(
                    onPressed: () {
                      StoreCubit.get(context).takeImageCamera();
                    },
                    icon: Icon(Icons.add),
                    label: Text('add photo from camera')),
              ],
            ),
          );
        }
    );
  }}
