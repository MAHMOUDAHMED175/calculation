import 'package:cache_repo/confg/app_route.dart';
import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/store/presentaion/views/view_product.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/new_product_widgets/app_bar_New_product_widget.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/new_product_widgets/photo_NewProduct_widget.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewProduct extends StatelessWidget {
  NewProduct({Key? key}) : super(key: key);

  var parcodeController = TextEditingController();
  var nameProductController = TextEditingController();
  var detailsController = TextEditingController();
  var sellPriceController = TextEditingController();
  var buyPriceController = TextEditingController();
  var countController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarNewProduct()),
      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(
              height: 20,
            ),
            PhotoProduct(),
            //content NewProuduct for textformfield
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: defaultFormField(
                          controller: parcodeController,
                          type: TextInputType.number,
                          hintText: 'الباركود',
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        onPressed: () {
                          // اضافة كود مسح الباركود هنا
                        },
                        icon: Icon(Icons.qr_code_2),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'اسم المنتج بالمواصفات تفصيلى',
                    style: Styles.textStyle18,
                  ),
                  defaultFormField(
                    controller: nameProductController,
                    type: TextInputType.number,
                    hintText: 'اسم المنتج تفصيلى',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'ملاحظات على المنتج',
                    style: Styles.textStyle18,
                  ),
                  defaultFormField(
                    controller: detailsController,
                    type: TextInputType.number,
                    hintText: 'ملاحظات على المنتج',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'سعر الشراء',
                    style: Styles.textStyle18,
                  ),
                  defaultFormField(
                    controller: sellPriceController,
                    type: TextInputType.number,
                    hintText: "سعر الشراء",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "سعر البيع",
                    style: Styles.textStyle18,
                  ),
                  defaultFormField(
                    controller: buyPriceController,
                    type: TextInputType.number,
                    hintText: "سعر البيع",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "الكميه",
                    style: Styles.textStyle18,
                  ),
                  defaultFormField(
                    controller: countController,
                    type: TextInputType.number,
                    hintText: "الكميه فى المخزن",
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
                                    formatDate(
                                        value!, [yyyy, '-', mm, '-', dd]);
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
                        width: 4,
                      ),
                      Text(
                        'تاريخ انتهاء الصلاحيه',
                        style: Styles.textStyle16.copyWith(color: Colors.teal),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              backgroundColor: ColorsApp.defualtColor),
                          child: Text(
                            'طباعة الكود',
                            style: Styles.textStyle18
                                .copyWith(color: ColorsApp.whiteColor),
                          )),
                      Spacer(),
                      TextButton(
                          onPressed: () {
                            //after validate
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>ViewProduct(
                                )));
                          },
                          style: TextButton.styleFrom(
                              backgroundColor: ColorsApp.defualtColor),
                          child: Text(
                            'تسجيل منتج جديد',
                            style: Styles.textStyle18
                                .copyWith(color: ColorsApp.whiteColor),
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




