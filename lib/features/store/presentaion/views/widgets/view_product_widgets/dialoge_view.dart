import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

Future ShowDialogUpdateProduct(
  context, {
  required nameProductController,
  required detailsController,
  required sellProductController,
  required buyProductController,
  required countProductController,
  required dateProductController,
  required qrCodeProductController,

}) =>
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //qr code
                    Text(
                      'تعديل بيانات المنتج',
                      style: Styles.textStyle20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.whiteColor),
                            child: defaultFormField(
                                controller: qrCodeProductController,
                                type: TextInputType.number,
                                fillsColor: Colors.grey[200]),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.defualtColor),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.qr_code_2,
                                  color: Colors.white,
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //name product
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.whiteColor),
                            child: defaultFormField(
                                controller: nameProductController,
                                type: TextInputType.number,
                                fillsColor: Colors.grey[200]),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.whiteColor),
                            child: SizedBox(
                              width: 80,
                              child: TextButton(
                                onPressed: () {},
                                child: Text('اسم المنتج '),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //details
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.whiteColor),
                            child: defaultFormField(
                                controller: detailsController,
                                type: TextInputType.number,
                                fillsColor: Colors.grey[200]),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.whiteColor),
                            child: SizedBox(
                                width: 80,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text('الوصف'),
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //sell price
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.whiteColor),
                            child: defaultFormField(
                                controller: sellProductController,
                                type: TextInputType.number,
                                fillsColor: Colors.grey[200]),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.whiteColor),
                            child: SizedBox(
                                width: 80,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text('سعر البيع'),
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //buy price
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.whiteColor),
                            child: defaultFormField(
                                controller: buyProductController,
                                type: TextInputType.number,
                                fillsColor: Colors.grey[200]),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.whiteColor),
                            child: SizedBox(
                                width: 80,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text('سعر الشراء'),
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    //count
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.whiteColor),
                            child: defaultFormField(
                                controller: countProductController,
                                type: TextInputType.number,
                                fillsColor: Colors.grey[200]),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.whiteColor),
                            child: SizedBox(
                                width: 80,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text('الكميه'),
                                ))),
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.whiteColor),
                            child: defaultFormField(
                                taped: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse("2230-12-12"),
                                  ).then((value) {
                                    dateProductController.text = formatDate(
                                        value!, [yyyy, '-', mm, '-', dd]);
                                  });
                                },
                                controller: dateProductController,
                                type: TextInputType.number,
                                fillsColor: Colors.grey[200]),
                          ),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ColorsApp.whiteColor),
                            child: SizedBox(
                                width: 120,
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text('انتهاء الصلاحيه '),
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text("الغاء"))),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: CustomButton(
                              backgroundColor: Colors.red,
                              textColor: ColorsApp.whiteColor,
                              text: 'حذف المنتج'),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        CustomButton(
                            backgroundColor: ColorsApp.defualtColor,
                            textColor: Colors.white,
                            text: 'تعديل البيانات'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
