import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/expenses/presentation/views_models/managers/cubit/expenses_cubit.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget dateDailyExpenses(BuildContext context,
    TextEditingController dateDailyExpensesController) {
  return BlocBuilder<ExpensesCubit, ExpensesState>(
    builder: (context, state) {
      return LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenWidth * 0.02,
            ),
            child: Row(
              children: [
                Expanded(
                  child: defaultFormField(
                    taped: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse("2230-12-12"),
                      ).then((value) {
                        dateDailyExpensesController.text = formatDate(
                            value!, [yyyy, '-', mm, '-', dd]);
                        ExpensesCubit.get(context).DateOfDailyExpenses(dateDailyExpensesController.text);
                      });
                    },
                    readOnly: true,
                    hintText: "اضغط لاختيار تاريخ محدد",
                    prefix: Icons.date_range,
                    controller: dateDailyExpensesController,
                    type: TextInputType.number,
                    fillsColor: ColorsApp.fillWhiteColorTextFormField,
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
