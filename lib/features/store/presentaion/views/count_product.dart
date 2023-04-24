import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/custom_app_par.dart';
import 'package:cache_repo/core/widgets/divider.dart';
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
              Padding(
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
              ),
              Container(
                color: ColorsApp.defualtColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          'الكميه',
                          style: Styles.textStyle15,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text('اسم المنتج', style: Styles.textStyle15),
                      ),
                    ],
                  ),
                ),
              ),
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

class CountProductItem extends StatelessWidget {
  CountProductItem({Key? key, required this.product, required this.place})
      : super(key: key);

  int place;

  Map product;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: place % 2 == 0 ? Colors.blue[100] : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(product['productCount']),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(product['productName']),
              ),
            ],
          ),
        ));
  }
}
