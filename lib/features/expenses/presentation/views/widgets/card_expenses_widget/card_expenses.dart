import 'package:cache_repo/confg/app_route.dart';
import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/expenses/presentation/views_models/managers/cubit/expenses_cubit.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CardExpenses extends StatelessWidget {
  CardExpenses({Key? key}) : super(key: key);
  var moneyController = TextEditingController();
  var descriptionController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpensesCubit, ExpensesState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: ColorsApp.whiteCard,
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 10.0),
                BoxShadow(color: Colors.grey, blurRadius: 10.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.payments_outlined,
                    size: MediaQuery.of(context).size.height * 0.1,
                    color: ColorsApp.defualtColor,
                  ),
                  Text(
                    'تسجيل مصروف جديد',
                    style: Styles.textStyle20.copyWith(
                      color: ColorsApp.defualtColor,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'المبلغ',
                        style: Styles.textStyle16,
                      ),
                      defaultFormField(
                          controller: moneyController,
                          type: TextInputType.number,
                          fillsColor: ColorsApp.fillWhiteColorTextFormField,
                          hintText: 'المبلغ',
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'اضف المبلغ';
                            }
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'ملاحظات على المبلغ',
                        style: Styles.textStyle16,
                      ),
                      defaultFormField(
                        controller: descriptionController,
                        fillsColor: ColorsApp.fillWhiteColorTextFormField,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'اضف ملاحظات المبلغ';
                          }
                        },
                        hintText: 'مثل فاتورة الكهرباء,مرتب احمد',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                          onTap: () {
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse("2230-12-12"),
                            ).then((value) {
                              dateController.text =
                                  formatDate(value!, [yyyy, '-', mm, '-', dd]);
                            });
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'اضف تاريخ دفع المبلغ';
                            }
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorsApp.defualtColor,

                            hintText: 'اضغط لتحديد التاريخ',
                            hintStyle: TextStyle(color: ColorsApp.whiteColor),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 2, horizontal: 0),
                            // أضف هذا الخاصية لمحاذاة النص في الوسط
                            // يمكنك تعديل قيمة الارتفاع وفقًا لاحتياجاتك
                          ),
                          textAlign: TextAlign.center,
                          // يضمن محاذاة النص في الوسط
                          controller: dateController,
                          style: TextStyle(
                            color: Colors
                                .white, // يمكنك تعيين اللون الذي ترغب فيه هنا
                          ),
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.1,
                      ),
                      Text(
                        'التاريخ',
                        style: Styles.textStyle16.copyWith(color: Colors.teal),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        ExpensesCubit.get(context).InsertDatabase(
                            moneyExpenses: moneyController.text,
                            descriptionExpenses: descriptionController.text,
                            DateExpenses: dateController.text
                        );
                        GoRouter.of(context).push(AppRoute.dailyExpenses);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: ColorsApp.defualtColor),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'حفظ',
                            style: Styles.textStyle20.copyWith(
                              color: ColorsApp.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
