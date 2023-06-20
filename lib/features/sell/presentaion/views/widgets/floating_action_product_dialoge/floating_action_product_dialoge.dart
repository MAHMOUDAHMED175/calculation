import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/features/sell/presentaion/views/widgets/floating_action_product_dialoge/gird_buy.dart';
import 'package:flutter/material.dart';

Widget floatingActionProductDialoge(context) => Expanded(
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
                  return AlertDialog(
                    contentPadding: EdgeInsets.symmetric(horizontal: 1),
                    content: Padding(
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
                          gridBuy(),
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
    );
