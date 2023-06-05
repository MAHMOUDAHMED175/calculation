import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

Widget monthExpenses(BuildContext context, TextEditingController monthDailyExpensesController) {
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
                    monthDailyExpensesController.text = formatDate(
                        value!, [yyyy, '-', mm, '-', dd]);
                  });
                },
                readOnly: true,
                hintText: "اضغط لاختيار تاريخ محدد",
                prefix: Icons.date_range,
                controller: monthDailyExpensesController,
                type: TextInputType.number,
                fillsColor: ColorsApp.fillWhiteColorTextFormField,
              ),
            ),
          ],
        ),
      );
    },
  );
}
