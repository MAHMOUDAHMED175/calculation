import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:flutter/material.dart';

Widget SearchView(context,searchController) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Row(
        children: [
          Expanded(
            child: defaultFormField(
                controller: searchController,
                prefix: Icons.search,
                submit: (textOfSearch) {
                  StoreCubit.get(context)
                      .searchProductView(text: textOfSearch!);
                },
                change: (textOfSearch) {
                  StoreCubit.get(context)
                      .searchProductView(text: textOfSearch!);
                },
                type: TextInputType.text,
                hintText: 'ابحث باسم المنتج'),
          ),
          IconButton(
              color: ColorsApp.buttonColor,
              onPressed: () {},
              icon: Icon(
                Icons.qr_code_2,
                size: 30,
              )),
        ],
      ),
    );
