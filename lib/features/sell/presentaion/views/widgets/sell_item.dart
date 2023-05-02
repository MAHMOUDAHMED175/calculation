import 'dart:io';

import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/features/sell/presentaion/views_models/managers/cubit/sell_cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellItem extends StatelessWidget {
  SellItem({Key? key, required this.product, required this.index})
      : super(key: key);

  final Map product;
  int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreStates>(builder: (context, state) {
      File imageFile = File(StoreCubit.get(context).product[index]['image']);

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
                    height: 140,
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
                          child: Container(
                              child: StoreCubit.get(context).product[index]['image']==''? CircleAvatar(backgroundColor:Theme.of(context).scaffoldBackgroundColor,backgroundImage:
                              AssetImage('assets/images/no_image.png')):CircleAvatar(backgroundColor:Theme.of(context).scaffoldBackgroundColor,backgroundImage:FileImage(imageFile),
                              )


                          ),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      SellCubit.get(context).deleteItemSellProduct(
                          '${SellCubit.get(context).sellProduct[index]['productName']}');
                    },
                    icon: Icon(Icons.delete,color: Colors.red,size: 30,),),

                ],
              )));
    });
  }
}
