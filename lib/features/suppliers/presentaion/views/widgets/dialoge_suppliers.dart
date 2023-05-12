



import 'package:cache_repo/features/suppliers/presentaion/views_models/managers/cubit/supplires_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';
//
// class DialogeSuppliers extends StatefulWidget {
//   const DialogeSuppliers({Key? key}) : super(key: key);
//
//   @override
//   State<DialogeSuppliers> createState() => _DialogeSuppliersState();
// }
//
// class _DialogeSuppliersState extends State<DialogeSuppliers> {
//
//   List<String> options2 = ['اضغط لتحديد مورد', 'دفعd اجل', 'دفdع كاش'];
//   String? selectedOption2 = 'اضغط لتحديد مورد';
//
//   @override
//   Widget build(BuildContext context) {
//     return
//        Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 //qr code
//                 Text(
//                   "حذف",
//                   style: Styles.textStyle30,
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   "رجاء اختيار اسم",
//                   style: Styles.textStyle16,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//
//                 Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(30.0),
//                     border: Border.all(color: Colors.grey, width: 2,style: BorderStyle.solid)
//
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: DropdownButton(
//                       value: selectedOption2,
//                       items: options2.map((option2) {
//                         return DropdownMenuItem(
//                           child: Text(option2),
//                           value: option2,
//                         );
//                       }).toList(),
//                       onChanged: (value) {
//                         setState(() {
//                           selectedOption2 = value.toString();
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: CustomButton(
//                             backgroundColor: ColorsApp.defualtColor,
//                             textColor: Colors.white,
//                             text: 'الغاء'),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Expanded(
//                       child: CustomButton(
//                           backgroundColor: Colors.red,
//                           textColor: ColorsApp.whiteColor,
//                           text: 'حذف'),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//   }
// }

class DialogeSuppliers extends StatefulWidget {
  @override
  _DialogeSuppliersState createState() => _DialogeSuppliersState();
}

class _DialogeSuppliersState extends State<DialogeSuppliers> {
  late List<Map> listSuppliersName;
  late String suppliersName;

  @override
  void initState() {
    super.initState();
    listSuppliersName = SuppliersCubit.get(context).suppliers;
    suppliersName = listSuppliersName[0]['suppliersName'];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //qr code
            Text(
              "حذف",
              style: Styles.textStyle30,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "رجاء اختيار اسم مندوب لحذفه",
              style: Styles.textStyle16,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  child: DropdownButton(
                    value: suppliersName,
                    items: listSuppliersName.map((option2) {
                      return DropdownMenuItem(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text("${option2['suppliersName']}")),
                        value: option2['suppliersName'],
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        suppliersName = value.toString();
                      });
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CustomButton(
                        backgroundColor: ColorsApp.defualtColor,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: 'الغاء'),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: CustomButton(
                    backgroundColor: Colors.red,
                    textColor: ColorsApp.whiteColor,
                    text: 'حذف',
                    onPressed: () {
                      SuppliersCubit.get(context)
                          .DeleteDataSuppliers(suplName: suppliersName);
                      // SuppliersCubit.get(context)
                      //     .moneyStillSuppliersm();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
