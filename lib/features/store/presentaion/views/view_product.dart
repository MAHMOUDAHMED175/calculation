import 'dart:io';
import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/core/widgets/divider.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/view_product_widgets/app_bar_view_product_widget.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewProduct extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: AppBarViewProduct(
                moneyCount: 40,
              )),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: defaultFormField(
                            controller: searchController,
                            prefix: Icons.search,
                            submit: (textOfSearch) {
                              StoreCubit.get(context)
                                  .searchProductView(text: textOfSearch!);
                            },
                            change: (textOfSearch) {
                              StoreCubit.get(context)
                                  .searchProductView(text: textOfSearch!);
                            },
                            type: TextInputType.text,
                            hintText: 'ابحث باسم المنتج'),
                      ),
                      IconButton(
                          color: ColorsApp.buttonColor,
                          onPressed: () {},
                          icon: Icon(
                            Icons.qr_code_2,
                            size: 30,
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  color: ColorsApp.defualtColor,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              'الكميه ',
                              style: Styles.textStyle15,
                            )),
                        Expanded(
                            flex: 2,
                            child: Text('السعر', style: Styles.textStyle15)),
                        Expanded(
                            flex: 1,
                            child: Text('المنتج', style: Styles.textStyle15)),
                        Expanded(
                            flex: 1,
                            child:
                                Text('صوره المنتج', style: Styles.textStyle15)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => ViewProductItem(
                      index:index,
                      products: StoreCubit.get(context).searchStoreViewProduct.isEmpty
                          ? StoreCubit.get(context).product[index]
                          : StoreCubit.get(context).searchStoreViewProduct[index],
                    ),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount: StoreCubit.get(context).searchStoreViewProduct.isEmpty
                        ? StoreCubit.get(context).product.length
                        : StoreCubit.get(context).searchStoreViewProduct.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ViewProductItem extends StatelessWidget {
  var nameProductController = TextEditingController();
  var buyPriceProductController = TextEditingController();
  var countProductController = TextEditingController();
  var dateProductController = TextEditingController();
  var detailsProductController = TextEditingController();
  var parcodeProductController = TextEditingController();
  var sellPriceProductController = TextEditingController();

  ViewProductItem({required this.products,required this.index});

  Map products;
  int index;




  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreStates>(
      builder: (BuildContext context, state) {
        File imageFile = File(products['image']);

        nameProductController.text = products['productName'].toString();
        buyPriceProductController.text = products['productBuy'].toString();
        countProductController.text = products['productCount'].toString();
        dateProductController.text = products['productDate'].toString();
        detailsProductController.text = products['productDetails'].toString();
        parcodeProductController.text = products['qrCode'].toString();
        sellPriceProductController.text = products['productSell'].toString();

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
                                        StoreCubit.get(context)
                                            .DeleteData(id1:products['id']);
                                        Navigator.pop(context);
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
                                        products['id'],
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
                    text: "${products['productCount']}",
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
                      text: products['productSell'],
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
                            products['productName'],
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
                Flexible(
                  flex: 2,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.08,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,

                      child: products['image']!=null ? Image.file(imageFile):Image.asset('assets/images/no_image.png'),


                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
