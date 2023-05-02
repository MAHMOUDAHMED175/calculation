import 'dart:io';

import 'package:cache_repo/features/store/data/Units.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/text_from_field_widget.dart';
import '../../../views_models/managers/cubit/cubit.dart';
import '../../../views_models/managers/cubit/states.dart';

class ViewProductItem extends StatelessWidget {
  var nameProductController = TextEditingController();
  var buyPriceProductController = TextEditingController();
  var countProductController = TextEditingController();
  var dateProductController = TextEditingController();
  var detailsProductController = TextEditingController();
  var parcodeProductController = TextEditingController();
  var sellPriceProductController = TextEditingController();

  ViewProductItem({/*required this.products*/ required this.units,required this.index});

  Units units;
  // Map products;
  int index;




  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreStates>(
      builder: (BuildContext context, state) {
        // File imageFile = File(products['image']);
        //
        // nameProductController.text = products['productName'].toString();
        // buyPriceProductController.text = products['productBuy'].toString();
        // countProductController.text = products['productCount'].toString();
        // dateProductController.text = products['productDate'].toString();
        // detailsProductController.text = products['productDetails'].toString();
        // parcodeProductController.text = products['qrCode'].toString();
        // sellPriceProductController.text = products['productSell'].toString();

        return InkWell(
          onTap: () {
            //9
            //5
            //8

            showDialog(
                context: context,
                builder: (
                    context,
                    ) {
                  return Dialog(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                        controller: parcodeProductController,
                                        type: TextInputType.number,
                                        fillsColor: Colors.grey[200]),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
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
                                        type: TextInputType.text,
                                        fillsColor: Colors.grey[200]),
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: ColorsApp.whiteColor),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text('اسم المنتج '),
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
                                        controller: detailsProductController,
                                        type: TextInputType.text,
                                        fillsColor: Colors.grey[200]),
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: ColorsApp.whiteColor),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text('الوصف'),
                                    )),
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
                                        controller: sellPriceProductController,
                                        type: TextInputType.number,
                                        fillsColor: Colors.grey[200]),
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: ColorsApp.whiteColor),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text('سعر البيع'),
                                    )),
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
                                        controller: buyPriceProductController,
                                        type: TextInputType.number,
                                        fillsColor: Colors.grey[200]),
                                  ),
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: ColorsApp.whiteColor),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text('سعر الشراء'),
                                    )),
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
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text('الكميه'),
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            //تاريخ انتهاء الصلاحيه
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
                                            lastDate:
                                            DateTime.parse("2230-12-12"),
                                          ).then((value) {
                                            dateProductController.text =
                                                formatDate(value!,
                                                    [yyyy, '-', mm, '-', dd]);
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
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text('انتهاء الصلاحيه '),
                                    )),
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
                                        },
                                        child: Text("الغاء"))),
                                SizedBox(
                                  width: 2,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: CustomButton(
                                      onPressed: () {
                                        // StoreCubit.get(context)
                                        //     .DeleteData(id1:products['id']);
                                        // Navigator.pop(context);
                                      },
                                      backgroundColor: Colors.red,
                                      textColor: ColorsApp.whiteColor,
                                      text: 'حذف المنتج'),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                CustomButton(
                                    onPressed: () {
                                      StoreCubit.get(context).updateData(
                                        parcodeProductController.text,
                                        nameProductController.text,
                                        detailsProductController.text,
                                        buyPriceProductController.text,
                                        sellPriceProductController.text,
                                        countProductController.text,
                                        dateProductController.text,
                                        // products['id'],
                                         2
                                      );
                                      Navigator.pop(context);
                                    },
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
          },
          child: Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: CustomButton(
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    text:  '${units.id}',
                    // text: "${products['productCount']}",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: CustomButton(
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      // text: products['productSell'],
                      text:  '${units.conversationFactory}',
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),
                Flexible(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '${units.conversationFactory}',
                            // products['productName'],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.003,
                ),
                // Flexible(
                //   flex: 2,
                //   child: Container(
                //       child: products['image']==''? CircleAvatar(backgroundColor:Theme.of(context).scaffoldBackgroundColor,backgroundImage:
                //       AssetImage('assets/images/no_image.png')):CircleAvatar(backgroundColor:Theme.of(context).scaffoldBackgroundColor,backgroundImage:FileImage(imageFile),
                //       )
                //
                //
                //   ),
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
