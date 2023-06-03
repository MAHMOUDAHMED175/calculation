import 'package:cache_repo/confg/app_route.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../views_models/managers/cubit/clients_cubit.dart';

class viewClientsItem extends StatelessWidget {
  viewClientsItem({Key? key,required this.index,required this.clientsData}) : super(key: key);

  int index;
  Map clientsData;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ClientsCubit, ClientsState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return InkWell(
      onTap: () {
        //9
        //5
        //8
        GoRouter.of(context).push(AppRoute.viewPaymentClients);
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: index % 2 == 0 ? Colors.blue[100] : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: CustomButton(
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  text: "${clientsData['clientsPhone']}",
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.003,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${clientsData['clientsName']}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Text(
                        "${clientsData['clientsAddress']}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
