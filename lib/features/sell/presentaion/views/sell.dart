import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/app_bar_sell.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/date_expire_sell.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/dialodSell2.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/gird_sell.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/headerSell.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/searchSell.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/show_dialoge_sell_2.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/divider.dart';

class Sell extends StatelessWidget {
  Sell({
    Key? key,
  }) : super(key: key);

  var searchSellController = TextEditingController();
  final dateSellController = TextEditingController(
      text: formatDate(DateTime.now(), [yyyy, '-', mm, '-', dd]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), child: AppBarSell()),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.width * 0.03),
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
                          return Dialog(
                            child: Padding(
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
                                  gridSell(),
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
            FloatingActionButton.extended(
              backgroundColor: Colors.grey[200],
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Theme(
                      data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.teal[100]),
                      child:  ShowDialogSell2(),
                    );
                  },
                );

              },
              label: Row(
                children: [
                  Text(
                    '20.0 جنيه',
                    style: Styles.textStyle14.copyWith(color: Colors.red),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      decoration: BoxDecoration(
                        color: ColorsApp.defualtColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('ادفع'),
                      )),
                ],
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
            dateExpireSell(context, dateSellController),
            searchSell(searchSellController: searchSellController),
            SizedBox(
              height: 5,
            ),
            headerSell(),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => SellItem(),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }
}

class SellItem extends StatelessWidget {
  SellItem({Key? key}) : super(key: key);

  var nameSellController = TextEditingController();
  var detailsSellController = TextEditingController();
  var parcodeSellController = TextEditingController();
  var dateSellController = TextEditingController();
  var sellPriceSellController = TextEditingController();
  var buyPriceSellController = TextEditingController();
  var countSellController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          ShowDialogCounterSell(context);
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
