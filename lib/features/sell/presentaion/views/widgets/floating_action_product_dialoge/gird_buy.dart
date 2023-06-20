import 'package:cache_repo/features/sell/presentaion/views/widgets/floating_action_product_dialoge/grid_item.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class gridBuy extends StatelessWidget {
  const gridBuy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreStates>(
        builder: (BuildContext context, state) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var product = StoreCubit.get(context).product;
          double screenHeight = MediaQuery.of(context).size.height;
          return SizedBox(
            height: screenHeight * 0.8,
            width: double.infinity, // اجعل الارتفاع يساوي نصف ارتفاع الشاشة
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: .6,
              ),
              itemBuilder: (context, index) =>
                  GridItemBuy(product: product[index], index: index),
              itemCount: StoreCubit.get(context).product.length,
            ),
          );
        },
      );
    });
  }
}
