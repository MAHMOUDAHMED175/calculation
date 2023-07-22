import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/features/representatives/presentaion/views_models/managers/representatives_cubit.dart';
import 'package:flutter/material.dart';

Future ShowDialogUpdateRepresnetativ(
    context,index
    ) =>
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                onPressed: (){
                  Navigator.pop(context);
                  RepresentativesCubit.get(context).chooseRepresent(index);
                },
                  backgroundColor: ColorsApp.defualtColor,
                  textColor: Colors.white,
                  text: 'تحديده الكاشير الحالى'),
            ),
          );
        });
