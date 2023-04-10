import 'package:cache_repo/core/utils/app_route.dart';
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
      ],
    );
  }
}
