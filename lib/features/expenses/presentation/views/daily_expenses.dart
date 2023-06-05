import 'package:cache_repo/features/expenses/presentation/views_models/managers/cubit/expenses_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/divider.dart';
import 'widgets/daily_expenses_widget/app_bar_daily_expenses.dart';
import 'widgets/daily_expenses_widget/daily_expenses_item_list_widget.dart';
import 'widgets/daily_expenses_widget/date_daily_expenses.dart';
import 'widgets/daily_expenses_widget/header_daily_expenses.dart';

class DailyExpenses extends StatelessWidget {
  DailyExpenses({Key? key}) : super(key: key);

  var dateDailyExpensesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExpensesCubit, ExpensesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              child: AppBarDailyExpenses(
                dailyMoneyExpenses: ExpensesCubit.get(context).sumExpenses,
              ),
              preferredSize: Size.fromHeight(60)),
          body: Column(
            children: [
              dateDailyExpenses(context, dateDailyExpensesController),
              headerDailyExpenses(),
              Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => dailyExpensesItemList(
                       index,
                        ExpensesCubit.get(context).dateOfDailyExpenses.isEmpty
                             ?ExpensesCubit.get(context).expensesListItem[index]
                             :ExpensesCubit.get(context).dateOfDailyExpenses[index],
                        context
                    ),
                    separatorBuilder: (context, index) => myDivider(),
                    itemCount:  ExpensesCubit.get(context).dateOfDailyExpenses.isEmpty
                        ?ExpensesCubit.get(context).expensesListItem.length
                        :ExpensesCubit.get(context).dateOfDailyExpenses.length,
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
