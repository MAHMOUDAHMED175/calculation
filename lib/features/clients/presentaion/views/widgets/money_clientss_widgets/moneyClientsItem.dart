import 'package:cache_repo/confg/app_route.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class moneyClientsItem extends StatelessWidget {
  moneyClientsItem({Key? key,required this.index,required this.clients}) : super(key: key);


  int index;
  Map clients;
  @override
  Widget build(BuildContext context) {
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
                  text: "${clients['money']}",
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
                     " ${clients['clientsName']}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Text(
                       " ${clients['clientsAddress']}",
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
  }
}
