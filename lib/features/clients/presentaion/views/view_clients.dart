

import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/divider.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/clients/presentaion/views/widgets/view_clients_widgets/app_bar_view_clients.dart';
import 'package:cache_repo/features/clients/presentaion/views/widgets/view_clients_widgets/viewClientsItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../views_models/managers/cubit/clients_cubit.dart';

class ViewClients extends StatelessWidget {
  var searchController = TextEditingController();

//2
  //222
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientsCubit, ClientsState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child:AppBarVieClients()),
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
                        change: (value){
                          ClientsCubit.get(context).searchClientsNamePhone(text: value!);
                        },
                        submit: (value){
                          ClientsCubit.get(context).searchClientsNamePhone(text: value!);
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
                          'رقم الهاتف',
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
                  itemBuilder: (context, index) => viewClientsItem(
                      index: index,
                      clientsData:ClientsCubit.get(context).searchClientsNamePhoneView.isEmpty?
                      ClientsCubit.get(context).clients[index]
                          :ClientsCubit.get(context).searchClientsNamePhoneView[index]
                  ),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: ClientsCubit.get(context).searchClientsNamePhoneView.isEmpty?
                  ClientsCubit.get(context).clients.length
                      :ClientsCubit.get(context).searchClientsNamePhoneView.length),
            ),
          ],
        ),
      ),
    );
  },
);
  }
}


