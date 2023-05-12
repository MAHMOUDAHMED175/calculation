import 'package:cache_repo/confg/app_route.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/features/suppliers/presentaion/views_models/managers/cubit/supplires_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/colors.dart';
import 'dialoge_suppliers.dart';

class CardSuppliers extends StatelessWidget {
  CardSuppliers({Key? key}) : super(key: key);



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
                Icon(Icons.person_pin_outlined,size: 80,color: ColorsApp.defualtColor,),
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
                                GoRouter.of(context).push(AppRoute.newSuppliers);
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'اضافة مورد جديد',
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
                                GoRouter.of(context).push(AppRoute.moneySuppliers);

                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "المبالغ المتبقيه للموردين",
                                      textDirection: TextDirection.rtl,
                                      style: Styles.textStyle14.copyWith(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.monetization_on_outlined,
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
                                GoRouter.of(context).push(AppRoute.viewSuppliers);

                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'عرض الموردين الحاليين',
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
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                   SuppliersCubit cubit = SuppliersCubit.get(context);
                                    if (cubit.suppliers.isEmpty) {
                                      return AlertDialog(
                                        backgroundColor: Colors.teal[100],
                                        content: Text('لا يوجد موردين'),
                                      );
                                    } else {
                                      return AlertDialog(
                                        backgroundColor: Colors.teal[100],
                                        content: DialogeSuppliers(),
                                      );
                                    }
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                     "حذف مورد حالى",
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


