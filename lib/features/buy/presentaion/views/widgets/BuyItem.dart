import 'dart:io';

import 'package:cache_repo/features/buy/presentaion/views_models/managers/cubit/buy_cubit.dart';
import 'package:cache_repo/features/buy/presentaion/views_models/managers/cubit/buy_state.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_button.dart';

class BuyItem extends StatelessWidget {
  BuyItem({Key? key, required this.product, required this.index})
      : super(key: key);
  final Map product;
  int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreStates>(builder: (context, state) {
      File imageFile = File(StoreCubit.get(context).product[index]['image']);

      return InkWell(
          onTap: () {
            // ShowDialogCounterBuy(context);
          },
          child: Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(alignment: Alignment.topLeft, children: [
              SizedBox(
                height: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 2,
                      child: CustomButton(
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        text:
                            '${int.parse(product['productCount']) * int.parse(product['productBuy'])}',
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
                        text: '${product['productCount']}',
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
                          text: product['productBuy'],
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
                      width: MediaQuery.of(context).size.width * 0.03,
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                          child: StoreCubit.get(context).product[index]
                                      ['image'] ==
                                  ''
                              ? CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  backgroundImage:
                                      AssetImage('assets/images/no_image.png'))
                              : CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  backgroundImage: FileImage(imageFile),
                                )),
                    )
                  ],
                ),
              ),
              BlocBuilder<BuyCubit, BuyState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      BuyCubit.get(context).deleteItemBuyProduct(
                          '${BuyCubit.get(context).buyProduct[index]['productName']}');
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                  );
                },
              ),
            ]),
          ));
    });
  }
}
