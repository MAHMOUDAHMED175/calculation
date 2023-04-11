import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/clients/presentaion/views/widgets/new_clients_widgets/app_bar_New_clients.dart';
import 'package:flutter/material.dart';

class NewClients extends StatelessWidget {
  NewClients({Key? key}) : super(key: key);

  var nameClientsController = TextEditingController();
  var detailsController = TextEditingController();
  var addressPriceController = TextEditingController();
  var phoneController = TextEditingController();
  var moneyController = TextEditingController();
  var maxmoneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarNewClients()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Icon(Icons.person_add_alt_1_sharp,size: 80,color: ColorsApp.defualtColor,),

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
                    controller: nameClientsController,
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
                    "المبلغ الى عليه",
                    style: Styles.textStyle18,
                  ),
                  defaultFormField(
                    controller: moneyController,
                    type: TextInputType.number,
                    hintText: "0",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "حد اقصى للمديونيه",
                    style: Styles.textStyle18,
                  ),
                  defaultFormField(
                    controller: maxmoneyController,
                    type: TextInputType.number,
                    hintText:  "حد اقصى للمديونيه",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "ملاحظات",
                    style: Styles.textStyle18,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    margin: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      controller: detailsController,
                      decoration: InputDecoration.collapsed(
                        hintStyle: TextStyle(color: Colors.grey), hintText: '',
                      ),
                      maxLines: 5,
                    ),
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

                            },
                            style: TextButton.styleFrom(
                                backgroundColor: ColorsApp.defualtColor),
                            child: Text(
                              "حفظ بيانات العميل",
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
