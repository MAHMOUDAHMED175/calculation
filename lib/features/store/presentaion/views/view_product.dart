import 'package:cache_repo/core/widgets/divider.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/view_product_widgets/app_bar_view_product_widget.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/view_product_widgets/header_view.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/view_product_widgets/search_view.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/view_product_widgets/view_product_item.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewProduct extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreCubit, StoreStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(80),
                child: AppBarViewProduct(
                  moneyCount: 40,
                )),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SearchView(context,searchController),
                  SizedBox(
                    height: 20.0,
                  ),

                  HeaderView(),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) => ViewProductItem(
                        index:index,
                        products: StoreCubit.get(context).searchStoreViewProduct.isEmpty
                            ? StoreCubit.get(context).product[index]
                            : StoreCubit.get(context).searchStoreViewProduct[index],
                      ),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: StoreCubit.get(context).searchStoreViewProduct.isEmpty
                          ? StoreCubit.get(context).product.length
                          : StoreCubit.get(context).searchStoreViewProduct.length,
                    ),
                  ),
                // Expanded(
                //   child: ConditionalBuilder(
                //     condition:  StoreCubit.get(context).modelProduct!=null,
                //     builder: (context) => Expanded(
                //       child: ListView.separated(
                //           scrollDirection: Axis.vertical,
                //           itemBuilder: (context, index) => ViewProductItem(
                //               index:index,
                //               units: StoreCubit.get(context).modelProduct!.data![2].product![1].units![1]
                //           ),
                //           separatorBuilder: (context, index) => myDivider(),
                //           itemCount: 40
                //       ),
                //     ),
                //     fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.green,strokeWidth: 10,)),
                //   ),
                // ),
                ],
              ),
            ),
          );
        },
      );
  }
}

