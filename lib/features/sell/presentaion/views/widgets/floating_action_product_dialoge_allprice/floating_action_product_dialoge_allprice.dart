import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/payment/dialog_buy.dart';
import 'package:cache_repo/features/sell/presentaion/views_models/managers/cubit/buy_cubit.dart';
import 'package:flutter/material.dart';

Widget floatingActionProductDialogeAllPrice(context) => InkWell(
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
                          text:
                              '${BuyCubit.get(context).countallPriceBuyFloatingActionButton}'),
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
                          text: '${BuyCubit.get(context).DarebaResult}'),
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
                          text:
                              '${BuyCubit.get(context).afterCalculateDarebaResult}'),
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
    );
