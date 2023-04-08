import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class PayCache extends StatefulWidget {
  const PayCache({Key? key}) : super(key: key);

  @override
  State<PayCache> createState() => _PayCacheState();
}

class _PayCacheState extends State<PayCache> {

  int selectedRadio = 0;

  List<String> options2 = ['اضغط لتحديد مورد', 'دفعd اجل', 'دفdع كاش'];

  String? selectedOption;

  String? selectedOption2 = 'اضغط لتحديد مورد';
  @override
  Widget build(BuildContext context) {
    return  Column(
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
}
