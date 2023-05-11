import 'package:cache_repo/confg/app_route.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/features/representatives/presentaion/views_models/managers/representatives_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'dialoge_representative.dart';

class CardRepresentatives extends StatelessWidget {
  CardRepresentatives({Key? key}) : super(key: key);



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
            Container(
            decoration: BoxDecoration(
            color: ColorsApp.defualtColor,
                borderRadius: BorderRadius.circular(30.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage('assets/images/money.jpg'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                     "${RepresentativesCubit.get(context).represent[0]['representName']??'حدد مندوب حالى'}",
                      style: Styles.textStyle18.copyWith(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
                SizedBox(
                  height: 30.0,
                ),
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
                                GoRouter.of(context).push(AppRoute.newRepresentatives);
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'اضافة مندوب جديد',
                                      textDirection: TextDirection.rtl,
                                      style: Styles.textStyle18.copyWith(
                                          fontSize: 16, color: Colors.white),
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
                                GoRouter.of(context).push(AppRoute.viewRepresentatives);

                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'عرض المندوبين الحاليين',
                                      textDirection: TextDirection.rtl,
                                      style: Styles.textStyle14.copyWith(
                                          fontSize: 16, color: Colors.white),
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
                                showDialog(context: context, builder: (context){
                                  return AlertDialog(
                                    backgroundColor: Colors.teal[100],
                                    content: DialogeRepresentatives(),
                                  ) ;
                                });

                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                     "حذف مندوب حالى",
                                      textDirection: TextDirection.rtl,
                                      style: Styles.textStyle20.copyWith(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.delete,
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


