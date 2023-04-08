import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/text_from_field_widget.dart';

class DeferredPayment extends StatefulWidget {
   DeferredPayment({Key? key}) : super(key: key);

  @override
  State<DeferredPayment> createState() => _DeferredPaymentState();
}

class _DeferredPaymentState extends State<DeferredPayment> {
  int selectedRadio = 0;

  List<String> options2 = ['اضغط لتحديد مورد', 'دفعd اجل', 'دفdع كاش'];

  String? selectedOption;

  String? selectedOption2 = 'اضغط لتحديد مورد';
  var payController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
}
