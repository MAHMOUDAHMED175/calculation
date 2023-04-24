import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/app_bar_sell.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/date_expire_sell.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/gird_sell.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/headerSell.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/searchSell.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/show_dialoge_sell_2.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<StoreCubit, StoreStates>(builder: (context, state) {
      var products = StoreCubit.get(context).sellProduct;

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
                        data: Theme.of(context)
                            .copyWith(dialogBackgroundColor: Colors.teal[100]),
                        child: ShowDialogSell2(),
                      );
                    },
                  );
                },
                label: Row(
                  children: [
                    Text(
                      '${StoreCubit.get(context).countallPriceSellFloatingActionButton} جنيه',
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
                  itemBuilder: (context, index) => SellItem(
                      product: StoreCubit.get(context)
                              .searchSellProductItem
                              .isEmpty
                          ? products[index]
                          : StoreCubit.get(context)
                              .searchSellProductItem[index],
                      index: index),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: StoreCubit.get(context).searchSellProductItem.isEmpty
                      ? products.length
                      : StoreCubit.get(context).searchSellProductItem.length,
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class SellItem extends StatelessWidget {
  SellItem({Key? key, required this.product, required this.index})
      : super(key: key);

  final Map product;
  int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreStates>(builder: (context, state) {
      return InkWell(
          onTap: () {
            // showDialog(
            //     context: context,
            //     builder: (context) {
            //   return ShowDialogCounterSell(products: product, index: index,);
            // });
          },
          child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [



                  SizedBox(
                    height: 120,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 4,
                          child: CustomButton(
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            text:
                            '${int.parse(product['productCount']) * int.parse(product['productSell'])}',
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.006,
                        ),
                        Flexible(
                          flex: 4,
                          child: CustomButton(
                            backgroundColor: Colors.white,
                            textColor: Colors.black,
                            text: '${product['productCount']}',
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.006,
                        ),
                        Flexible(
                          flex: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: CustomButton(
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              text: product['productSell'],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.006,
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
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    product['productName'],
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.006,
                        ),
                        Flexible(
                          flex: 2,
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width * 0.08,
                            backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width * 0.07,
                              backgroundImage: AssetImage(
                                'assets/images/money.jpg',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      StoreCubit.get(context).deleteItemSellProduct(
                          '${StoreCubit.get(context).sellProduct[index]['productName']}');
                    },
                    icon: Icon(Icons.delete,color: Colors.red,size: 30,),),

                ],
              )));
    });
  }
}
