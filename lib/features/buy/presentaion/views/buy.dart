import 'package:cache_repo/features/buy/presentaion/views/widgets/app_bar_buy.dart';
import 'package:cache_repo/features/buy/presentaion/views/widgets/dialod_buy2.dart';
import 'package:cache_repo/features/buy/presentaion/views/widgets/dialog_buy.dart';
import 'package:cache_repo/features/buy/presentaion/views/widgets/gird_buy.dart';
import 'package:cache_repo/features/buy/presentaion/views/widgets/header_buy.dart';
import 'package:cache_repo/features/buy/presentaion/views/widgets/search_buy.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/divider.dart';

class Buy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:
          PreferredSize(preferredSize: Size.fromHeight(60), child: AppBarBuy()),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: FloatingActionButton(
                    backgroundColor: ColorsApp.defualtColor,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.symmetric(horizontal: 1),
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    'جميع المنتجات',
                                    style: Styles.textStyle18,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  gridBuy(),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Icon(
                      Icons.add_box,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Theme(
                        data: Theme.of(context)
                            .copyWith(dialogBackgroundColor: Colors.teal[100]),
                        child: ShowDialogBuy2());
                  },
                );
              },
              child: Container(
                color: Colors.white,
                height: 150,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                            SizedBox(width: 60, child: Text('الاجمالى')),
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
                            Text('المبلغ الكلى '),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                  backgroundColor: ColorsApp.defualtColor,
                                  textColor: Colors.white,
                                  text: 'حاسب'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            SearchBuy(),
            SizedBox(
              height: 5,
            ),
            headerBuy(),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => BuyItem(),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}

class BuyItem extends StatelessWidget {
  BuyItem({Key? key}) : super(key: key);

  var nameBuyController = TextEditingController();
  var detailsBuyController = TextEditingController();
  var parcodeBuyController = TextEditingController();
  var dateBuyController = TextEditingController();
  var sellPriceBuyController = TextEditingController();
  var buyPriceBuyController = TextEditingController();
  var countBuyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          ShowDialogCounterBuy(context);
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
                  flex: 2,
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
                  flex: 2,
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
                      text: "99999",
                    ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'اسم المنتج ',
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
            )));
  }
}
