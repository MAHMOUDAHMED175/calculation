import 'package:cache_repo/confg/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'card.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 2.0,
      mainAxisSpacing: 4.0,
      childAspectRatio: .6,
      children: [
        InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.store);
            },
            child: SelectCard(
              icon: Icons.home,
              title: 'المخزن',
            )),
        InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.sell);
            },
            child: Center(
              child: SelectCard(
                icon: Icons.monetization_on_outlined,
                title: 'فاتورة الشراء',
              ),
            )),
        InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.buy);
            },
            child: SelectCard(
              icon: Icons.monetization_on,
              title: 'فاتورة البيع',
            )),
        InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.Representatives);
            },
            child: SelectCard(
              icon: Icons.person,
              title: 'المندوب',
            )),
        InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.Supplier);
            },
            child: SelectCard(
              icon: Icons.person_pin_sharp,
              title: 'الموردين',
            )),
        InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.Client);
            },
            child: SelectCard(
              icon: Icons.supervisor_account,
              title: "العملاء",
            )),
        InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.homePage);
            },
            child: SelectCard(
              icon: Icons.call_to_action_sharp,
              title: "السندات",
            )),
        InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.expenses);
            },
            child: SelectCard(
              icon: Icons.money,
              title: "المصروفات",
            )),
        InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.homePage);
            },
            child: SelectCard(
              icon: Icons.store,
              title: "القيود",
            )), InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.homePage);
            },
            child: SelectCard(
              icon: Icons.settings,
              title: "الصيانه",
            )), InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.homePage);
            },
            child: SelectCard(
              icon: Icons.reset_tv_rounded,
              title: "تخزين واسترجاع البيانات",
            )), InkWell(
            onTap: () {
              GoRouter.of(context).push(AppRoute.reports);
            },
            child: SelectCard(
              icon: Icons.data_thresholding_rounded,
              title: "الاستعلامات والتقارير",
            )),
      ],
    );
  }
}
