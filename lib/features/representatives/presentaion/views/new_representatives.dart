import 'package:cache_repo/confg/app_route.dart';
import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/representatives/presentaion/views/widgets/new_representatives_widgets/app_bar_New_product_widget.dart';
import 'package:cache_repo/features/representatives/presentaion/views/widgets/new_representatives_widgets/scane_photo.dart';
import 'package:cache_repo/features/representatives/presentaion/views_models/managers/representatives_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class NewRepresentatives extends StatelessWidget {
  NewRepresentatives({Key? key}) : super(key: key);

  var nameRepresentativesController = TextEditingController();
  var detailsController = TextEditingController();
  var addressPriceController = TextEditingController();
  var phoneController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RepresentativesCubit, RepresentativesState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              content: AlertDialogeTakeImageRepresentative(),
                            );
                          });
                    },
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor:
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          child: Center(
                            child: RepresentativesCubit
                                .get(context)
                                .imagesFileRepresentative == null
                                ? Text('لم يتم اختيار صور بعد')
                                : CircleAvatar(
                                radius: 50,
                                backgroundImage: FileImage(
                                  RepresentativesCubit
                                      .get(context)
                                      .imagesFileRepresentative!,
                                )),
                          ),
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor:
                          Theme
                              .of(context)
                              .scaffoldBackgroundColor,
                          child: Icon(Icons.camera_alt_outlined),
                        ),
                      ],
                    )),

                //content NewProuduct for textformfield
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
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
                            validate: (value) {
                              if (value!.isEmpty) {
                                return ' Add Name';
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
                                return ' Add Address';
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
                                return ' Add Phone';
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
                            controller: detailsController,
                            decoration: InputDecoration.collapsed(
                              hintText: 'أضف ملاحظتك هنا...',
                              hintStyle: TextStyle(color: Colors.grey),
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
                                    if (formkey.currentState!.validate()) {
                                      RepresentativesCubit.get(context)
                                          .InsertDatabaseRepresent(
                                          representName: nameRepresentativesController.text,
                                          representDetails: addressPriceController.text,
                                          representPhone: phoneController.text,
                                          representNote: detailsController.text,
                                        image: RepresentativesCubit.get(context).savePathImageRepresentative
                                      );
                                      Navigator.pop(context);
                                    }
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
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
