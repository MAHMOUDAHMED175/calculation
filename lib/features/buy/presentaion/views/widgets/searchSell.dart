import 'package:cache_repo/features/buy/presentaion/views_models/managers/cubit/sell_cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/text_from_field_widget.dart';

class searchSell extends StatelessWidget {
  const searchSell({Key? key, required this.searchSellController})
      : super(key: key);

  final TextEditingController searchSellController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreStates>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
              color: ColorsApp.defualtColor,
              borderRadius: BorderRadius.circular(50)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: defaultFormField(
                      controller: searchSellController,
                      prefix: Icons.search,
                      submit: (textOfSearch) {
                        SellCubit.get(context)
                            .searchSellProduct(text: textOfSearch!);
                      },
                      change: (textOfSearch) {
                        SellCubit.get(context)
                            .searchSellProduct(text: textOfSearch!);
                      },
                      type: TextInputType.text,
                      hintText: 'اسم عن المنتج'),
                ),
                IconButton(
                    color: ColorsApp.buttonColor,
                    onPressed: () {},
                    icon: Icon(
                      Icons.qr_code_2,
                      size: 30,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      );
    });
  }
}
