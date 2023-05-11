import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

Future ShowDialogUpdateRepresnetativ(
    context,
    ) =>
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                  backgroundColor: ColorsApp.defualtColor,
                  textColor: Colors.white,
                  text: 'تحديده الكاشير الحالى'),
            ),
          );
        });
