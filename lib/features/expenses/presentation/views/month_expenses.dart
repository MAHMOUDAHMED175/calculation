import 'package:cache_repo/features/expenses/presentation/views/widgets/app_bar_expenses_widget/month_expenses_widget/app_bar_month_expenses.dart';
import 'package:cache_repo/features/expenses/presentation/views/widgets/app_bar_expenses_widget/month_expenses_widget/date_month_expenses.dart';
import 'package:cache_repo/features/expenses/presentation/views/widgets/app_bar_expenses_widget/month_expenses_widget/header_month_expenses.dart';
import 'package:cache_repo/features/expenses/presentation/views/widgets/app_bar_expenses_widget/month_expenses_widget/month_expenses_item_list_widget.dart';
import 'package:cache_repo/features/expenses/presentation/views/widgets/month_expenses_widget/date_month_expenses.dart';
import 'package:cache_repo/features/expenses/presentation/views_models/managers/cubit/expenses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/divider.dart';
import 'widgets/daily_expenses_widget/app_bar_daily_expenses.dart';
import 'widgets/daily_expenses_widget/daily_expenses_item_list_widget.dart';
import 'widgets/daily_expenses_widget/date_daily_expenses.dart';
import 'widgets/daily_expenses_widget/header_daily_expenses.dart';

class MonthExpenses extends StatelessWidget {
  MonthExpenses({Key? key}) : super(key: key);

  var dateMonthExpensesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpensesCubit, ExpensesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              child: AppBarMonthExpenses(
                monthMoneyExpenses: ExpensesCubit.get(context).sumMonthExpenses,
              ),
              preferredSize: Size.fromHeight(60)),
          body: Column(
            children: [
              dateMonthExpenses(context, dateMonthExpensesController),
              headerMonthExpenses(),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => dailyExpensesItemList(
                    index,
                    ExpensesCubit.get(context).daysOfMonth.isEmpty
                        ? ExpensesCubit.get(context).expensesListItem[index]
                        : ExpensesCubit.get(context).daysOfMonth[index],
                    context,
                  ),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: ExpensesCubit.get(context).daysOfMonth.isEmpty
                      ? ExpensesCubit.get(context).expensesListItem.length
                      : ExpensesCubit.get(context).daysOfMonth.length,
                ),
              ),


          ],
          ),
        );
      },
    );
  }
}
