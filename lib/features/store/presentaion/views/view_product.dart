import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/core/widgets/divider.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/view_product_widgets/app_bar_view_product_widget.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/view_product_widgets/dialoge_view.dart';
import 'package:flutter/material.dart';

class ViewProduct extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        type: TextInputType.text,
                        hintText: 'اسم المنتج'),
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
                        flex: 3,
                        child: Text('المنتج', style: Styles.textStyle15)),
                    Expanded(
                        flex: 1,
                        child: Text('صوره المنتج', style: Styles.textStyle15)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => ViewProductItem(),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: 10),
            ),
          ],
        ),
      ),
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


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //9
        //5
        //8

      ShowDialogUpdateProduct(
          context,

          nameProductController: nameProductController,
          buyProductController: buyPriceProductController,
          countProductController: countProductController,
          dateProductController: dateProductController,
          detailsController: detailsProductController,
          qrCodeProductController: parcodeProductController,
          sellProductController: sellPriceProductController,
        );
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
                text: "999",
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
                  text: "999999",
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
                        'اسم dgsdf sdfsdfdf  f المنتج ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Flexible(
              flex: 2,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.08,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.07,
                  backgroundImage: AssetImage(
                    'assets/images/money.jpg',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                                controller: qrCodeProductController,
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
                                controller: detailsController,
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
                                controller: sellProductController,
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
                                controller: buyProductController,
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
                                onPressed: () {}, child: Text("الغاء"))),
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

