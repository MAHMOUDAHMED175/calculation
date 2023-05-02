import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:cache_repo/core/widgets/divider.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/count_product/count_header.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/count_product/count_product_item.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/count_product/search_count.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/text_from_field_widget.dart';

class CountProduct extends StatelessWidget {
  CountProduct({Key? key}) : super(key: key);

  var searchCountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: CustomAppBar(
                textAppBar: 'منتجات تنفذ قريبا من المخزن',
                elevationAppBar: 0.0,
                showenCenterText: true,
                actionsAppBar: []),
          ),
          body: Column(
            children: [

              SearchCount(context,searchCountController),
              headerCount(),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => CountProductItem(
                    product: StoreCubit.get(context).searchCount.isEmpty
                        ? StoreCubit.get(context).product[index]
                        : StoreCubit.get(context).searchCount[index],
                    place: index,
                  ),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: StoreCubit.get(context).searchCount.isEmpty
                      ? StoreCubit.get(context).product.length
                      : StoreCubit.get(context).searchCount.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

