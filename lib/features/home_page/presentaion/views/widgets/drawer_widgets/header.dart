import 'package:cache_repo/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/styles.dart';

Widget headerDrawer(BuildContext context) =>
    SizedBox(
      height: 450,
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white10,
                Colors.teal,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * 0.1,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/images/money.jpg'),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'المحاسب الالكترونى',
                          style: Styles.textStyle20.copyWith(
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton.icon(
                  label: Text(
                    'محمود مؤمن',
                    style: Styles.textStyle16.copyWith(color: Colors.grey),
                  ),
                  icon: Icon(
                    Icons.monetization_on,
                    color: Colors.yellow,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,                          color: ColorsApp.AppBarColor,

                          size: MediaQuery.of(context).size.width * 0.12,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          '33333 مورد',
                          style: Styles.textStyle18.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'عدد الموردين',
                          style: Styles.textStyle16.copyWith(color: Colors.grey[300]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,                          color: ColorsApp.AppBarColor,

                          size: MediaQuery.of(context).size.width * 0.12,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          '3333 عميل',
                          style: Styles.textStyle18.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'عدد العملاء',
                          style: Styles.textStyle16.copyWith(color: Colors.grey[300]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      children: [
                        Icon(
                          Icons.monetization_on,
                          color: ColorsApp.AppBarColor,
                          size: MediaQuery.of(context).size.width * 0.12,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          '2533333334.5 جنيه ',
                          style: Styles.textStyle18.copyWith(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'اجمالى المبلغ فى الخزينه',
                          style: Styles.textStyle16.copyWith(color: Colors.grey[300]),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

            ]
            ,
          )
      ),
    );