import 'package:cache_repo/core/utils/app_route.dart';
import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/representatives/presentaion/views/widgets/new_product_widgets/app_bar_New_product_widget.dart';
import 'package:cache_repo/features/representatives/presentaion/views/widgets/new_product_widgets/photo_NewProduct_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewRepresentatives extends StatelessWidget {
  NewRepresentatives({Key? key}) : super(key: key);

  var nameRepresentativesController = TextEditingController();
  var detailsController = TextEditingController();
  var addressPriceController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarNewRepresentatives()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            PhotoRepresentatives(),
            //content NewProuduct for textformfield
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "الاسم بالكامل",
                    style: Styles.textStyle18,
                  ),
                  defaultFormField(
                    controller: nameRepresentativesController,
                    type: TextInputType.text,
                    hintText: "محمد على عبدالله",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "العنوان",
                    style: Styles.textStyle18,
                  ),
                  defaultFormField(
                    controller: addressPriceController,
                    type: TextInputType.number,
                    hintText: "اطفيح - الجيزه",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "رقم الهاتف",
                    style: Styles.textStyle18,
                  ),
                  defaultFormField(
                    controller: phoneController,
                    type: TextInputType.number,
                    hintText: "011253....129",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "ملاحظات",
                    style: Styles.textStyle18,
                  ),
                  defaultFormField(
                    controller: detailsController,
                    type: TextInputType.number,
                    hintText: "سعر البيع",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                            onPressed: () {
                              //after validate
                              GoRouter.of(context)
                                  .push(AppRoute.viewRepresentatives);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: ColorsApp.defualtColor),
                            child: Text(
                              "حفظ بيانات الكاشير",
                              style: Styles.textStyle18
                                  .copyWith(color: ColorsApp.whiteColor),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
