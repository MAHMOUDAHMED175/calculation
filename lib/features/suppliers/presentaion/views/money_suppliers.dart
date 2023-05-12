import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/divider.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/widgets/money_suppliers_widgets/app_bar_money_suppliers.dart';
import 'package:cache_repo/features/suppliers/presentaion/views_models/managers/cubit/supplires_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/money_suppliers_widgets/moneySuppliersItem.dart';

class MoneySuppliers extends StatelessWidget {
  var searchController = TextEditingController();

//2
  //222
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuppliersCubit, SuppliersState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: AppBarMoneySuppliers()),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: defaultFormField(
                            controller: searchController,
                            prefix: Icons.search,
                            type: TextInputType.text,
                            change: (value) {
                              SuppliersCubit.get(context).searchSuppliersNameMoney(text: value!);
                            },
                            submit: (value) {
                              SuppliersCubit.get(context).searchSuppliersNameMoney(text: value!);

                            },
                            hintText: 'ابحث عن اسم المورد'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  color: ColorsApp.defualtColor,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Text(
                              'المبلغ المتبقى',
                              style: Styles.textStyle15,
                            )),
                        Spacer(),
                        Flexible(
                            child:
                            Text('بيانات المورد', style: Styles.textStyle15)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          moneySuppliersItem(index: index,
                          suppliers: SuppliersCubit.get(context).searchSuppliersNameMoneyView.isEmpty?
                          SuppliersCubit.get(context).suppliers[index]
                              :  SuppliersCubit.get(context).searchSuppliersNameMoneyView[index],
                          ),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: SuppliersCubit.get(context).searchSuppliersNameMoneyView.isEmpty?
                      SuppliersCubit.get(context).suppliers.length
                          :  SuppliersCubit.get(context).searchSuppliersNameMoneyView.length,),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


