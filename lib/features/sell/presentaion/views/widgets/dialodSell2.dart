// import 'package:cache_repo/core/utils/colors.dart';
// import 'package:cache_repo/core/utils/styles.dart';
// import 'package:cache_repo/core/widgets/custom_button.dart';
// import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
// import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
// import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class ShowDialogCounterSell extends StatelessWidget {
//   ShowDialogCounterSell({required this.products, required this.index});
//
//   Map products;
//   int index;
//
//   var counterController = TextEditingController();
//   var sellPriceController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<StoreCubit, StoreStates>(
//         builder: (context, state) {
//
//
//           // counterController.text=products['productCount'].toString();
//           // sellPriceController.text=products['productSell'].toString();
//           return AlertDialog(
//               contentPadding: EdgeInsets.all(0),
//               content: SizedBox(
//                 width: MediaQuery
//                     .of(context)
//                     .size
//                     .width * 0.6,
//                 height: MediaQuery
//                     .of(context)
//                     .size
//                     .height * 0.35,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(top: 16),
//                       child: Text(
//                         'تعديل بيانات المنتج',
//                         style: Styles.textStyle20.copyWith(color: Colors.teal),
//                       ),
//                     ),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: ColorsApp.defualtColor,
//                               ),
//                               onPressed: () {
//                                 StoreCubit.get(context).minusProductItem();
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   // Icon(Icoons.minimize),
//                                   Text('-', style: TextStyle(fontSize: 40)),
//                                 ],
//                               ),
//                             ),
//                             Flexible(
//                               flex: 2,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: defaultFormField(
//                                   border: BorderRadius.circular(20),
//                                   controller: counterController,
//                                   type: TextInputType.number,
//                                 ),
//                               ),
//                             ),
//                             ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: ColorsApp.defualtColor,
//                               ),
//                               onPressed: () {
//                                 StoreCubit.get(context).addProductItem();
//                               },
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   // Icon(Icoons.minimize),
//                                   Text('+', style: TextStyle(fontSize: 40)),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(vertical: 8),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Expanded(child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: defaultFormField(
//
//                                 border: BorderRadius.circular(20),
//
//                                 controller: sellPriceController,
//                                 type: TextInputType.number,
//
//                                 change: (value) {}
//
//
//                             ),
//                           )),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Text('سعر الوحده'),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Expanded(
//                           child: Padding(
//                             padding: EdgeInsets.all(8),
//                             child: CustomButton(
//                               onPressed: () {
//                                 StoreCubit.get(context).updateData(
//                                     products['qrCode'].toString(),
//                                 products['productName'].toString(),
//                                 products['productDetails'].toString(),
//                                 products['productBuy'].toString(),
//                                     sellPriceController.text,
//                                     counterController.text,
//                                 products['productDate'].toString(),
//                                     products['id']);
//                               },
//                               backgroundColor: ColorsApp.defualtColor,
//                               textColor: Colors.white,
//                               text: 'حفظ',
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Padding(
//                             padding: EdgeInsets.all(8),
//                             child: CustomButton(
//                               onPressed: () {
//                                 StoreCubit.get(context).deleteItem(
//                                     '${StoreCubit
//                                         .get(context)
//                                         .sellProduct[index]['productName']}');
//                               },
//                               backgroundColor: Colors.grey.withOpacity(0.2),
//                               textColor: Colors.red,
//                               text: 'حذف المنتج من القائمه',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ));
//         });
//   }
// }
//
//
