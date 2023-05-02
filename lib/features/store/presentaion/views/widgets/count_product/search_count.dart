import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:flutter/material.dart';

Widget SearchCount(context,searchCountController)=>    Padding(
  padding: const EdgeInsets.all(20.0),
  child: defaultFormField(
      controller: searchCountController,
      type: TextInputType.number,
      submit: (textOfSearch) {
        StoreCubit.get(context)
            .searchProductCount(text: textOfSearch!);
      },
      change: (textOfSearch) {
        StoreCubit.get(context)
            .searchProductCount(text: textOfSearch!);
      },
      hintText: 'اضغط لتحديد الكميه'),
);