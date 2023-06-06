import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';

Widget monthExpensesItemList(int index, Map expenses, context) => Container(
  color: Colors.grey[200],
  height: 90,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            expenses['descriptionExpenses'],
            style: Styles.textStyle14,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.height*0.02,
        ),
        Flexible(
          flex: 2,
          child: Text(
            expenses['DateExpenses'],
            style: Styles.textStyle14,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.height*0.04,
        ),
        Flexible(
          flex: 2,
          child: Text(
            expenses['moneyExpenses'],
            style: Styles.textStyle16,
          ),
        ),
      ],
    ),
  ),
);
