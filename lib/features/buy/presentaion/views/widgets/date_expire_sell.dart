import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

Widget dateExpireSell(BuildContext context, TextEditingController dateSellController) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double screenWidth = constraints.maxWidth;
      double labelWidth = screenWidth * 0.3 - 5;

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
                    dateSellController.text = formatDate(
                        value!, [yyyy, '-', mm, '-', dd]);
                  });
                },
                readOnly: true,
                prefix: Icons.date_range,
                controller: dateSellController,
                type: TextInputType.number,
                fillsColor: Colors.grey[300],
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: labelWidth,
              child: Text(
                'تاريخ فاتورة المشتريات',
                style: Styles.textStyle14,
              ),
            ),
          ],
        ),
      );
    },
  );
}
