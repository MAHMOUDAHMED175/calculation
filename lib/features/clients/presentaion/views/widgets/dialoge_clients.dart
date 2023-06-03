



import 'package:flutter/material.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../views_models/managers/cubit/clients_cubit.dart';

//
// class DialogeClients extends StatefulWidget {
//   const DialogeClients({Key? key}) : super(key: key);
//
//   @override
//   State<DialogeClients> createState() => _DialogeClientsState();
// }
//
// class _DialogeClientsState extends State<DialogeClients> {
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

class DialogeClients extends StatefulWidget {
  @override
  _DialogeClientsState createState() => _DialogeClientsState();
}

class _DialogeClientsState extends State<DialogeClients> {
  late List<Map> listClientsName;
  late String clientsName;

  @override
  void initState() {
    super.initState();
    listClientsName = ClientsCubit.get(context).clients;
    clientsName = listClientsName[0]['clientsName'];
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
              "رجاء اختيار اسم عميل لحذفه",
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
                    value: clientsName,
                    items: listClientsName.map((option2) {
                      return DropdownMenuItem(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text("${option2['clientsName']}")),
                        value: option2['clientsName'],
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        clientsName = value.toString();
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
                      ClientsCubit.get(context)
                          .DeleteDataClients(suplName: clientsName);
                      // ClientsCubit.get(context)
                      //     .moneyStillClientsm();
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
