import 'dart:io';

import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/features/sell/presentaion/views_models/managers/cubit/sell_cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  GridItem({Key? key, required this.product, required this.index})
      : super(key: key);

  Map product;
  int index;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        File imageFile = File(StoreCubit.get(context).product[index]['image']);

        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1, color: Colors.black),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Container(
                      child: product['image'] == ''
                          ? CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              minRadius: 80,
                              backgroundImage:
                                  AssetImage('assets/images/no_image.png'))
                          : CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              minRadius: 80,
                              backgroundImage: FileImage(imageFile),
                            )),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      product['productName'],
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CustomButton(
                      onPressed: () {
                        SellCubit.get(context).addProductToSell(index, context);
                        SellCubit.get(context)
                            .allPriceSellFloatingActionButton();
                      },
                      backgroundColor: ColorsApp.defualtColor,
                      textColor: Colors.white,
                      text: 'اضافه',
                    ),
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
