import 'package:cache_repo/features/expenses/presentation/views/widgets/app_bar_expenses_widget/month_expenses_widget/app_bar_month_expenses.dart';
import 'package:cache_repo/features/expenses/presentation/views/widgets/app_bar_expenses_widget/month_expenses_widget/date_month_expenses.dart';
import 'package:cache_repo/features/expenses/presentation/views/widgets/app_bar_expenses_widget/month_expenses_widget/header_month_expenses.dart';
import 'package:cache_repo/features/expenses/presentation/views/widgets/app_bar_expenses_widget/month_expenses_widget/month_expenses_item_list_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/divider.dart';

class MonthExpenses extends StatelessWidget {
  MonthExpenses({Key? key}) : super(key: key);

  var dateMonthExpensesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBarMonthExpenses(
            monthMoneyExpenses: 20,
          ),
          preferredSize: Size.fromHeight(60)),
      body: Column(
        children: [
          monthExpenses(context, dateMonthExpensesController),
          headerMonthExpenses(),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => monthExpensesItemList(
                    // index:index,
                    // products:
                    // StoreCubit.get(context).searchStoreViewProduct.isEmpty
                    //     ? StoreCubit.get(context).product[index]
                    //     : StoreCubit.get(context).searchStoreViewProduct[index],
                    ),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: 22
                // StoreCubit.get(context).searchStoreViewProduct.isEmpty
                //     ? StoreCubit.get(context).product.length
                //     : StoreCubit.get(context).searchStoreViewProduct.length,
                ),
          ),
        ],
      ),
    );
  }
}
