import 'package:cache_repo/confg/app_route.dart';
import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ItemListBuyingBillReport extends StatelessWidget {
  const ItemListBuyingBillReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

        GoRouter.of(context).push(AppRoute.detailsBillReportBuying);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 8,
              decoration: BoxDecoration(
                  color: Colors.red,
                borderRadius: BorderRadius.circular(20.0)
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Text(
                                  '123456789123',
                                  style: Styles.textStyle15
                                      .copyWith(color: ColorsApp.blackText),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  " مورد 3",
                                  style: Styles.textStyle15
                                      .copyWith(color: ColorsApp.blackText),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: Text(
                                  "5455559 جنيه",
                                  style: Styles.textStyle15
                                      .copyWith(color: Colors.red),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "04-06-2023",
                                  style: Styles.textStyle15
                                      .copyWith(color: ColorsApp.blackText),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
