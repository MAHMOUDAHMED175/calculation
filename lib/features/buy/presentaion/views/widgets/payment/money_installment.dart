import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/text_from_field_widget.dart';

class MoneyInstallment extends StatefulWidget {
  MoneyInstallment({Key? key}) : super(key: key);

  @override
  State<MoneyInstallment> createState() => _MoneyInstallmentState();
}

class _MoneyInstallmentState extends State<MoneyInstallment> {
  int selectedRadio = 0;
  int radioWeeksAndMonth = 0;

  List<String> options2 = ['اضغط لتحديدعميل', 'دفعd اجل', 'دفdع كاش'];
  String? selectedOption2 = 'اضغط لتحديدعميل';
  var partController = TextEditingController();
  var profitRatioController = TextEditingController();
  var financialInterestRateController = TextEditingController();
  var payController = TextEditingController();
  var numberOfMonthsController = TextEditingController();
  var numberOfWeeksController = TextEditingController();
  var dateController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
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
                  onPressed: () {},
                  text: 'عميل جديد'),
            ),
            SizedBox(
              width: 4,
            ),
            Text('اختيار اسم العميل'),
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
          height: 20,
        ),
        Row(
          children: [
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
                'نسبة الفائده بعد المقدم',
              ),
            ),
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
                'نسبة الفائده قبل المقدم',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
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
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: defaultFormField(
                  controller: partController,
                  hintText: '0',
                  fillsColor: Colors.white,
                  type: TextInputType.number),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 60,
              child: Text('مقدم '),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        selectedRadio == 0
            ? Row(
                children: [
                  Expanded(
                    child: defaultFormField(
                        controller: financialInterestRateController,
                        hintText: '0',
                        fillsColor: Colors.white,
                        type: TextInputType.number),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 60,
                    child: Text('نسبه الربح'),
                  )
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: defaultFormField(
                        controller: profitRatioController,
                        hintText: '0',
                        fillsColor: Colors.white,
                        type: TextInputType.number),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 60,
                    child: Text('نسبه الفائده'),
                  )
                ],
              ),

        SizedBox(
          height: 20,
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
            SizedBox(width: 60, child: Text('المتبقى ')),
          ],
        ),

        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Radio(
              value: 0,
              groupValue: radioWeeksAndMonth,
              onChanged: (value) {
                setState(() {
                  radioWeeksAndMonth = value!;
                });
              },
            ),
            Flexible(
              child: Text(
                'اسبوعى',
              ),
            ),
            Radio(
              value: 1,
              groupValue: radioWeeksAndMonth,
              onChanged: (value) {
                setState(() {
                  radioWeeksAndMonth = value!;
                });
              },
            ),
            Flexible(
              child: Text(
                "شهرى",
              ),
            ),
          ],
        ),

        SizedBox(
          height: 20,
        ),
        radioWeeksAndMonth == 1
            ? Row(
                children: [
                  Expanded(
                    child: defaultFormField(
                        controller: numberOfMonthsController,
                        hintText: '0',
                        fillsColor: Colors.white,
                        type: TextInputType.number),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 60,
                    child: Text('عدد الشهور'),
                  )
                ],
              )
            : Row(
                children: [
                  Expanded(
                    child: defaultFormField(
                        controller: numberOfWeeksController,
                        hintText: '0',
                        fillsColor: Colors.white,
                        type: TextInputType.number),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 60,
                    child: Text('عدد الاسابيع'),
                  )
                ],
              ),

        //months

        SizedBox(
          height: 20,
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
            SizedBox(width: 60, child: Text('قيمه القسط ')),
          ],
        ),

        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
                child: TextFormField(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.parse("2230-12-12"),
                ).then((value) {
                  dateController.text =
                      formatDate(value!, [yyyy, '-', mm, '-', dd]);
                });
              },
              decoration: InputDecoration(
                  fillColor: ColorsApp.whiteColor,
                  filled: true,
                  hintText: 'اضغط لتحديد التاريخ',
                  border: OutlineInputBorder()),
              controller: dateController,
              keyboardType: TextInputType.datetime,
            )),
            SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 90,
              height: 60,
              child: Text(
                'تاريخ استحقاق اول قسط',
                style: Styles.textStyle14,
                maxLines: 2,
              ),
            )
          ],
        ),

        //name
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: defaultFormField(
                  controller: nameController,
                  hintText: '0',
                  fillsColor: Colors.white,
                  type: TextInputType.number),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 60,
              child: Text('اسم الضامن'),
            )
          ],
        ),

        //phone
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: defaultFormField(
                  controller: phoneController,
                  hintText: '0',
                  fillsColor: Colors.white,
                  type: TextInputType.number),
            ),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 60,
              child: Text('تلفون الضامن'),
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),

        Row(
          children: [
            Expanded(
              child: CustomButton(
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  text: 'الغاء'),
            ),
            SizedBox(
              width: 10,
            ),
            CustomButton(
                backgroundColor: ColorsApp.defualtColor,
                textColor: Colors.white,
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
