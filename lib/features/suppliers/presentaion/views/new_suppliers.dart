import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/suppliers/presentaion/views/widgets/new_suppliers_widgets/app_bar_New_suppliers.dart';
import 'package:cache_repo/features/suppliers/presentaion/views_models/managers/cubit/supplires_cubit.dart';
import 'package:flutter/material.dart';

class NewSuppliers extends StatelessWidget {
  NewSuppliers({Key? key}) : super(key: key);

  var nameSuppliersController = TextEditingController();
  var AddressController = TextEditingController();
  var addressPriceController = TextEditingController();
  var phoneController = TextEditingController();
  var moneyController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarNewSuppliers()),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,

          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Icon(Icons.person_add_alt_1_sharp, size: 80,
                color: ColorsApp.defualtColor,),

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
                        controller: nameSuppliersController,
                        type: TextInputType.text,
                        hintText: "محمد على عبدالله",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Add Name';
                          }
                        }
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
                        type: TextInputType.text,
                        hintText: "اطفيح - الجيزه",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Add Address';
                          }
                        }
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
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Add Phone';
                          }
                        }
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "المبلغ الباقى للمورد",
                      style: Styles.textStyle18,
                    ),
                    defaultFormField(
                        controller: moneyController,
                        type: TextInputType.number,
                        hintText: "0",
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'Add Money';
                          }
                        }
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
                        controller: AddressController,
                        decoration: InputDecoration.collapsed(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: 'ملاحظات على المورد',
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
                                if (formKey.currentState!.validate()) {
                                  SuppliersCubit.get(context)
                                      .InsertDatabaseSuppliers(
                                      suppliersName: nameSuppliersController.text,
                                      suppliersAddress: addressPriceController.text,
                                      suppliersPhone: phoneController.text,
                                      suppliersNote: AddressController.text,
                                      money: moneyController.text,
                                  );
                                  Navigator.pop(context);

                                }
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: ColorsApp.defualtColor),
                              child: Text(
                                "حفظ بيانات المورد",
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
      ),
    );
  }
}
