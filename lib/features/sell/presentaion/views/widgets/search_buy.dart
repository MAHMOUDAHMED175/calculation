import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/sell/presentaion/views_models/managers/cubit/buy_cubit.dart';
import 'package:cache_repo/features/sell/presentaion/views_models/managers/cubit/buy_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBuy extends StatelessWidget {
  SearchBuy({Key? key}) : super(key: key);

  final searchBuyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyCubit, BuyState>(builder: (context, state) {
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
                    controller: searchBuyController,
                    prefix: Icons.search,
                    type: TextInputType.text,
                    hintText: 'ابحث عن اسم المنتج',
                    submit: (textOfSearch) {
                      BuyCubit.get(context)
                          .searchBuyProduct(text: textOfSearch!);
                    },
                    change: (textOfSearch) {
                      BuyCubit.get(context)
                          .searchBuyProduct(text: textOfSearch!);
                    },
                  ),
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
