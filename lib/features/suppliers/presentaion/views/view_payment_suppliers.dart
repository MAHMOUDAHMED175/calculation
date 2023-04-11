import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/widgets/view_payment_suppliers/app_bar_view_suppliers_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/divider.dart';

class ViewPaymentSuppliers extends StatelessWidget {
  final TextEditingController  payMoneyController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), child: AppBarViewSuppliers()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        text: "اسم المورد"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomButton(
                      backgroundColor: Colors.white,
                      textColor: Colors.black,
                      text: "اجمالى المتبقى:55855525جنيه",
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('دفع مبلغ'),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    defaultFormField(
                                        controller: payMoneyController,
                                        type: TextInputType.number,
                                        fillsColor: Colors.grey[100],
                                        hintText: 'المبلغ',
                                      border: BorderRadius.circular(10)
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Expanded(
                                          child: CustomButton(
                                              backgroundColor: Colors
                                                  .grey[200]!,
                                              textColor: Colors.red,
                                              text: "الغاء"),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: CustomButton(
                                              backgroundColor: ColorsApp
                                                  .defualtColor,
                                              textColor: Colors.white,
                                              text: "دفع"),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: CustomButton(
                          backgroundColor: ColorsApp.defualtColor,
                          textColor: Colors.white,
                          text: "خصم مبلغ"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                color: ColorsApp.defualtColor,
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'باقى',
                          style: Styles.textStyle15,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'رقم الفاتوره',
                          style: Styles.textStyle15,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'تاريخ',
                          style: Styles.textStyle15,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'دفع',
                          style: Styles.textStyle15,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "العمليه",
                          style: Styles.textStyle15,
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                      ViewSuppliersItem(place: index),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewSuppliersItem extends StatelessWidget {
  ViewSuppliersItem({Key? key, required this.place}) : super(key: key);

  int place;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: place % 2 == 0 ? Colors.blue[100] : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                '545585555555555',
                style: TextStyle(color: Colors.red),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.03,
            ),
            Expanded(
              flex: 2,
              child: Text(
                "546545454",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.03,
            ),
            Expanded(
              flex: 2,
              child: Text(
                "12-12-2002",
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.03,
            ),
            Expanded(
              flex: 2,
              child: Text(
                "545224888",
                maxLines: 2,
                style: TextStyle(color: Colors.red),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.03,
            ),
            Expanded(
              flex: 2,
              child: Text(
                "خصم",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
