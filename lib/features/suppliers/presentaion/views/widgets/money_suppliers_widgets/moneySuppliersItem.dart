import 'package:cache_repo/confg/app_route.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class moneySuppliersItem extends StatelessWidget {
  moneySuppliersItem({Key? key,required this.index,required this.suppliers}) : super(key: key);


  int index;
  Map suppliers;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //9
        //5
        //8
        GoRouter.of(context).push(AppRoute.viewPaymentSuppliers);
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
                  text: "${suppliers['suppliersPhone']}",
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
                     " ${suppliers['suppliersName']}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Opacity(
                      opacity: 0.6,
                      child: Text(
                       " ${suppliers['suppliersAddress']}",
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
