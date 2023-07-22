import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../confg/app_route.dart';
import '../../../../../../core/utils/styles.dart';

Widget contextDrawer(context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              // Navigation
            },
            child: InkWell(
              onTap: (){
                GoRouter.of(context)
                    .push(AppRoute.sellingBillReport);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.dangerous),
                  Text('ارجاع فاتوره مبيعات', style: Styles.textStyle16)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              // Navigation
              GoRouter.of(context)
                  .push(AppRoute.buyingBillReport);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.dangerous),
                Text('ارجاع فاتوره مشتريات', style: Styles.textStyle16)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              // Navigation
              GoRouter.of(context)
                  .push(AppRoute.sellingBillReport);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.security_update_warning_sharp),
                Text('عرض فواتير البيع', style: Styles.textStyle16)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              // Navigation
               GoRouter.of(context)
                                .push(AppRoute.buyingBillReport);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.security_update_warning_sharp),
                Text("عرض فواتير الشراء", style: Styles.textStyle16)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              // Navigation
              GoRouter.of(context).push(AppRoute.reportCompany);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.analytics),
                Text("عرض حركه المتجر اليوميه", style: Styles.textStyle16)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              // Navigation
              GoRouter.of(context)
                  .push(AppRoute.treasuryTransactionsReport);     },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.monetization_on),
                Text("تقرير بتعاملات الخزينه", style: Styles.textStyle16)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              // Navigation
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.developer_mode),
                Text("مطور البرنامج", style: Styles.textStyle16)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              // Navigation
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.settings),
                Text("الاعدادات", style: Styles.textStyle16)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),

          InkWell(
            onTap: () {
              // Navigation
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.share),
                Text("مشاركه البرنامج", style: Styles.textStyle16)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              // Navigation
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.comment),
                Text("ارسال تعليقك لتطوير البرنامج", style: Styles.textStyle16)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              // Navigation
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.update),
                Text('2023-12-08'),
                Text("اخر تحديث", style: Styles.textStyle16)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
