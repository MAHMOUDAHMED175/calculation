import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/core/widgets/divider.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/clients/presentaion/views/widgets/money_clients_widgets/app_bar_money_clients.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../confg/app_route.dart';

class MoneyClients extends StatelessWidget {
  var searchController = TextEditingController();

//2
  //222
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarMoneyClients(
            moneyCount: 455488,
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
                        hintText: 'ابحث عن اسم العميل'),
                  ),
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Text(
                     "اقصى مديونيه",
                      style: Styles.textStyle15,
                    )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Flexible(
                        child: Text(
                      'المبلغ المتبقى',
                      style: Styles.textStyle15,
                    )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Flexible(
                        child:
                            Text('بيانات العميل', style: Styles.textStyle15)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) =>
                      moneyClientsItem(place: index),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class moneyClientsItem extends StatelessWidget {
  moneyClientsItem({Key? key, required this.place}) : super(key: key);

  int place;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //9
        //5
        //8
        GoRouter.of(context).push(AppRoute.viewPaymentClients);
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: place % 2 == 0 ? Colors.blue[100] : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: CustomButton(
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  text: "541685456465465555555555555",
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.003,
              ),
              Flexible(
                child: CustomButton(
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  text: "5416876161",
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.003,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "اسم العميل",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Text(
                        "الكريمات",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
