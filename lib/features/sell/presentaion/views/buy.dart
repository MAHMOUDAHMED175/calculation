import 'package:cache_repo/features/sell/presentaion/views/widgets/BuyItem.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/app_bar_buy.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/floating_action_product_dialoge/floating_action_product_dialoge.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/floating_action_product_dialoge_allprice/floating_action_product_dialoge_allprice.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/header_buy.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/search_buy.dart';
import 'package:cache_repo/features/sell/presentaion/views_models/managers/cubit/buy_cubit.dart';
import 'package:cache_repo/features/sell/presentaion/views_models/managers/cubit/buy_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/divider.dart';

class Buy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyCubit, BuyState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60), child: AppBarBuy()),
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                floatingActionProductDialoge(context),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
                floatingActionProductDialogeAllPrice(context),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                ),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                    itemBuilder: (context, index) => BuyItem(
                      index: index,
                      product: BuyCubit.get(context)
                              .searchBuyProductItem
                              .isEmpty
                          ? BuyCubit.get(context).buyProduct[index]
                          : BuyCubit.get(context).searchBuyProductItem[index],
                    ),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount:
                        BuyCubit.get(context).searchBuyProductItem.isEmpty
                            ? BuyCubit.get(context).buyProduct.length
                            : BuyCubit.get(context).searchBuyProductItem.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
