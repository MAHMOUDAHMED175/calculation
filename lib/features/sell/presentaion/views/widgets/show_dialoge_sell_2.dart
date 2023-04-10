import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

class ShowDialogSell2 extends StatefulWidget {
  @override
  _ShowDialogSell2State createState() => _ShowDialogSell2State();
}

class _ShowDialogSell2State extends State<ShowDialogSell2> {
  int selectedRadio = 1;
  List<String> options2 = ['اضغط لتحديد مورد', 'دفعd اجل', 'دفdع كاش'];

  String? selectedOption;
  String? selectedOption2 = 'اضغط لتحديد مورد';

  var payController = TextEditingController();

  Widget buildWidget(int selectedRadio) {
     if (selectedRadio == 1) {
      return deferredPayment();
    } else if (selectedRadio == 0) {
      return payCash();
    }

    return Container();
  }


  Widget deferredPayment() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
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
            SizedBox(width: 60, child: Text('الاجمالى ')),
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
            SizedBox(
              width: 60,
              child: Text('الضريبه '),
            )
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
            SizedBox(
              width: 60,
              child: Text('الاجمالى بعد الضريبه '),
            )
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
            SizedBox(
              width: 60,
              child: Text('الخصم '),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Expanded(
              child: defaultFormField(
                  controller: payController,
                  hintText: '0',

                  fillsColor: Colors.red[100],
                  type: TextInputType.number),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 60,
              child: Text('مدفوع '),
            )
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
            SizedBox(
              width: 60,
              child: Text('باقى '),
            )
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
    );
  }

  Widget payCash() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
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
            SizedBox(width: 60, child: Text('الاجمالى ')),
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
            SizedBox(
              width: 60,
              child: Text('الضريبه '),
            )
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
            SizedBox(
              width: 60,
              child: Text('الاجمالى بعد الضريبه '),
            )
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
            SizedBox(
              width: 60,
              child: Text('الخصم '),
            )
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
            SizedBox(
              width: 60,
              child: Text('مدفوع '),
            )
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
            SizedBox(
              width: 60,
              child: Text('باقى '),
            )
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 500,
      child: AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'متابعه عمليه الشراء',
                style: Styles.textStyle20,
              ),
              Row(
                children: [

                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = value!;
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      'دفع اجل',
                    ),
                  ),
                  Radio(
                    value: 0,
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = value!;
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      'دفع كاش',
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth > 600 ? 16.0 : 8.0),
              buildWidget(selectedRadio),
            ],
          ),
        ),
      ),
    );
  }
}
