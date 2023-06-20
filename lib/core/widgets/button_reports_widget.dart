import 'package:cache_repo/core/utils/colors.dart';
import 'package:flutter/material.dart';

import '../utils/styles.dart';

Widget buttonsReports({required String text,required Function() function}) =>
    TextButton(
      style: TextButton.styleFrom(
          backgroundColor: ColorsApp.buttonColor),
      onPressed: function,
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              textDirection: TextDirection.rtl,
              style: Styles.textStyle15
                  .copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.event_note_outlined,
              color: Colors.white,
              size: 25,
            ),
          ),
        ],
      ),
    );