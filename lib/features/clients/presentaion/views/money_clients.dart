

import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/divider.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/clients/presentaion/views/widgets/money_clientss_widgets/app_bar_money_clients.dart';
import 'package:cache_repo/features/clients/presentaion/views/widgets/money_clientss_widgets/moneyClientsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../views_models/managers/cubit/clients_cubit.dart';

class MoneyClients extends StatelessWidget {
  var searchController = TextEditingController();

//2
  //222
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClientsCubit, ClientsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: AppBarMoneyClients(moneyCount: 20,)),
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
                              ClientsCubit.get(context).searchClientsNameMoney(text: value!);
                            },
                            submit: (value) {
                              ClientsCubit.get(context).searchClientsNameMoney(text: value!);

                            },
                            hintText: 'ابحث عن اسم العميل'),
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
                            Text('بيانات العميل', style: Styles.textStyle15)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                          moneyClientsItem(index: index,
                          clients: ClientsCubit.get(context).searchClientsNameMoneyView.isEmpty?
                          ClientsCubit.get(context).clients[index]
                              :  ClientsCubit.get(context).searchClientsNameMoneyView[index],
                          ),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: ClientsCubit.get(context).searchClientsNameMoneyView.isEmpty?
                      ClientsCubit.get(context).clients.length
                          :  ClientsCubit.get(context).searchClientsNameMoneyView.length,),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


