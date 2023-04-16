import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/store/presentaion/views/view_product.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/new_product_widgets/app_bar_New_product_widget.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/new_product_widgets/scane_photo.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/new_product_widgets/qr_code.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewProduct extends StatelessWidget {
  NewProduct({Key? key}) : super(key: key);

  var parcodeController = TextEditingController();
  var nameProductController = TextEditingController();
  var detailsController = TextEditingController();
  var sellPriceController = TextEditingController();
  var buyPriceController = TextEditingController();
  var countController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit,StoreStates>(
        builder: (context, state) {
          StoreCubit cubit = StoreCubit.get(context);
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
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageScreen()));
                      },
                      child:  Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Theme
                                .of(context)
                                .scaffoldBackgroundColor,
                            child: Center(
                              child: StoreCubit.get(context).photoBytes == null ? Text('لم يتم اختيار صور بعد') : Image
                                  .memory(StoreCubit.get(context).photoBytes!),
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Theme
                                .of(context)
                                .scaffoldBackgroundColor,
                            child: Icon(Icons.camera_alt_outlined),
                          ),

                        ],)
                  ),
                  //content NewProduct for textformfield
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
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
                                    type: TextInputType.text,
                                    hintText: 'الباركود',
                                    validate: (value) {
                                      if (value!.isEmpty) {
                                        return ' Add Qr_code';
                                      }
                                    }),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                onPressed: () {
                                  // اضافة كود مسح الباركود هنا
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>QrCodes(parcodeController:parcodeController)));
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
                              type:  TextInputType.text,
                              hintText: 'اسم المنتج تفصيلى',
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return ' Add ProductDetails';
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'ملاحظات على المنتج',
                            style: Styles.textStyle18,
                          ),
                          defaultFormField(
                            controller: detailsController,
                            type:  TextInputType.text,
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
                              type:  TextInputType.text,
                              hintText: "سعر الشراء",
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return ' Add ProductBuy';
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "سعر البيع",
                            style: Styles.textStyle18,
                          ),
                          defaultFormField(
                              controller: buyPriceController,
                              type:  TextInputType.text,
                              hintText: "سعر البيع",
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return ' Add ProductSell';
                                }
                              }),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "الكميه",
                            style: Styles.textStyle18,
                          ),
                          defaultFormField(
                              controller: countController,
                              type:  TextInputType.text,
                              hintText: "الكميه فى المخزن",
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return ' Add ProductCount';
                                }
                              }),
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
                                    dateController.text = formatDate(
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return ' Add ProudctDate';
                                  }
                                },
                              )),
                              SizedBox(
                                width: 4,
                              ),
                              Text(
                                'تاريخ انتهاء الصلاحيه',
                                style: Styles.textStyle16
                                    .copyWith(color: Colors.teal),
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
                                      backgroundColor:
                                          ColorsApp.defualtColor),
                                  child: Text(
                                    'طباعة الكود',
                                    style: Styles.textStyle18.copyWith(
                                        color: ColorsApp.whiteColor),
                                  )),
                              Spacer(),
                              TextButton(
                                  onPressed: () {
                                    //after validate
                                    if (formKey.currentState!.validate()) {
                                      cubit.InsertDatabase(
                                          qrCode: parcodeController.text,
                                          productName:
                                          nameProductController.text,
                                          productDetails:
                                          detailsController.text,
                                          productBuy: buyPriceController.text,
                                          productSell: sellPriceController.text,
                                          productCount: countController.text,
                                          productDate: dateController.text,
                                      );
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ViewProduct()));
                                    }

                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor:
                                          ColorsApp.defualtColor),
                                  child: Text(
                                    'تسجيل منتج جديد',
                                    style: Styles.textStyle18.copyWith(
                                        color: ColorsApp.whiteColor),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
