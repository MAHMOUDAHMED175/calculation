import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ShowDialogSell2 extends StatefulWidget {
  ShowDialogSell2({Key? key}) : super(key: key);

  @override
  State<ShowDialogSell2> createState() => _ShowDialogSell2State();
}

class _ShowDialogSell2State extends State<ShowDialogSell2> {
  List<String> options = ['دفع اجل', 'دفع كاش'];
  List<String> options2 = ['اضغط لتحديد مورد','دفعd اجل', 'دفdع كاش'];

  String? selectedOption;
  String? selectedOption2='اضغط لتحديد مورد';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'متابعه عمليه الشراء',
              style: Styles.textStyle20,
            ),
            Row(
              children: options
                  .map((option) => Expanded(
                        child: RadioListTile(
                          title: Text(
                            option,
                            style: TextStyle(fontSize: 12),
                          ),
                          value: option,
                          groupValue: selectedOption,
                          onChanged: (value) {
                            setState(() {
                              selectedOption = value;
                            });
                          },
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      backgroundColor: Colors.white,
                      textColor: Colors.teal,
                      text: '95.5 جنيه'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('الاجمالى '),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      backgroundColor: Colors.white,
                      textColor: Colors.teal,
                      text: '95.5 جنيه'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('مدفوع '),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      backgroundColor: Colors.white,
                      textColor: Colors.teal,
                      text: '95.5 جنيه'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('باقى '),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      backgroundColor: Colors.white,
                      textColor: Colors.teal,
                      onPressed: () {},
                      text: 'موردجديد'),
                ),
                SizedBox(
                  width: 4,
                ),
                Text('تسجيل فاتوره لحساب مورد'),
              ],
            ),
            DropdownButton(
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
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      backgroundColor: Colors.white,
                      textColor: Colors.teal,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'الغاء'),
                ),
                SizedBox(
                  width: 10,
                ),
                CustomButton(
                    backgroundColor: Colors.white,
                    textColor: Colors.teal,
                    onPressed: () {},
                    text: 'تسجيل عمليه الشراء'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
