



import 'package:flutter/material.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class DialogeRepresentatives extends StatefulWidget {
  const DialogeRepresentatives({Key? key}) : super(key: key);

  @override
  State<DialogeRepresentatives> createState() => _DialogeRepresentativesState();
}

class _DialogeRepresentativesState extends State<DialogeRepresentatives> {

  List<String> options2 = ['اضغط لتحديد مندوب', 'دفعd اجل', 'دفdع كاش'];
  String? selectedOption2 = 'اضغط لتحديد مندوب';

  @override
  Widget build(BuildContext context) {
    return
       Padding(
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
                  "رجاء اختيار اسم",
                  style: Styles.textStyle16,
                ),
                SizedBox(
                  height: 10,
                ),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(color: Colors.grey, width: 2,style: BorderStyle.solid)

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: DropdownButton(
                      value: selectedOption2,
                      items: options2.map((option2) {
                        return DropdownMenuItem(
                          child: Text(option2),
                          value: option2,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedOption2 = value.toString();
                        });
                      },
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
                          text: 'حذف'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}
