import 'package:cache_repo/core/utils/app_route.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/colors.dart';

class CardStore extends StatelessWidget {
  CardStore({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Icon(Icons.home, size: 50.0, color: ColorsApp.defualtColor),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: ColorsApp.buttonColor),
                            onPressed: () {},
                            child: InkWell(
                              onTap: () {
                                GoRouter.of(context).push(AppRoute.newProduct);
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'اضافة منتج جديد',
                                      textDirection: TextDirection.rtl,
                                      style: Styles.textStyle20.copyWith(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: ColorsApp.buttonColor),
                            onPressed: () {},
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>NewProduct()));
                                GoRouter.of(context).push(AppRoute.viewProduct);

                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'عرض المنتجات',
                                      textDirection: TextDirection.rtl,
                                      style: Styles.textStyle20.copyWith(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.event_note_outlined,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: ColorsApp.buttonColor),
                            onPressed: () {},
                            child: InkWell(
                              onTap: () {
                                GoRouter.of(context)
                                    .push(AppRoute.countProduct);
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'جرد المخزن بالكميه',
                                      textDirection: TextDirection.rtl,
                                      style: Styles.textStyle20.copyWith(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.countertops_outlined,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
              ],
            ),
          ),
        ));
  }
}

