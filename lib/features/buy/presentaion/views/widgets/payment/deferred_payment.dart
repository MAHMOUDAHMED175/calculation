import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/text_from_field_widget.dart';
import '../../../../../store/presentaion/views_models/managers/cubit/cubit.dart';
import '../../../../../store/presentaion/views_models/managers/cubit/states.dart';
import '../../../../../suppliers/presentaion/views_models/managers/cubit/supplires_cubit.dart';
import '../../../views_models/managers/cubit/sell_cubit.dart';

class DeferredPayment extends StatefulWidget {
  DeferredPayment({Key? key}) : super(key: key);

  @override
  State<DeferredPayment> createState() => _DeferredPaymentState();
}

class _DeferredPaymentState extends State<DeferredPayment> {
  List<Map>? listSuppliersName;
  String? suppliersName;
  var payController = TextEditingController();
  var discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit,StoreStates>(
      builder: (context,state){
        listSuppliersName = SuppliersCubit.get(context).suppliers;
        suppliersName =
        (listSuppliersName != null && listSuppliersName!.isNotEmpty)
            ? listSuppliersName![0]['suppliersName']
            : 'اضغط لاختيار مورد';
        return  Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      backgroundColor: Colors.white,
                      textColor: Colors.teal,
                      text: '${SellCubit.get(context).countallPriceSellFloatingActionButton}'),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(width: 60, child: Text('الاجمالى ')),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      backgroundColor: Colors.white,
                      textColor: Colors.teal,
                      text: '${SellCubit.get(context).DarebaResult}'),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 60,
                  child: Text('الضريبه '),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      backgroundColor: Colors.white,
                      textColor: Colors.teal,
                      text:  '${SellCubit.get(context).afterCalculateDarebaResult}'),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 60,
                  child: Text('الاجمالى بعد الضريبه '),
                )
              ],
            ),

            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: defaultFormField(
                      controller: discountController,
                      change: (value){
                        SellCubit.get(context).discountPaymentFloatingActionButton(value!);
                      },
                      submit:(value){
                        SellCubit.get(context).discountPaymentFloatingActionButton(value!);
                      },

                      fillsColor: Colors.red[100],
                      type: TextInputType.number),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 60,
                  child: Text('الخصم '),
                )
              ],
            ), SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: defaultFormField(
                      controller: payController,
                      change: (value){
                        SellCubit.get(context).remainingPaymentFloatingActionButton(value!);
                      },
                      submit:(value){
                        SellCubit.get(context).remainingPaymentFloatingActionButton(value!);
                      },

                      fillsColor: Colors.red[100],
                      type: TextInputType.number),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 60,
                  child: Text('مدفوع '),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      backgroundColor: Colors.white,
                      textColor: Colors.teal,
                      text: '${SellCubit.get(context).remainingPayment}'),
                ),
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 60,
                  child: Text('باقى '),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomButton(
                    backgroundColor: Colors.white,
                    textColor: Colors.teal,
                    onPressed: () {},
                    text: 'موردجديد'),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                    child: Text('تسجيل فاتوره لحساب مورد')),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: DropdownButton(
                  value: suppliersName,
                  items: listSuppliersName!.map((option2) {
                    return DropdownMenuItem(
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text("${option2['suppliersName']}")),
                      value: option2['suppliersName'],
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      suppliersName = value.toString();
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                      backgroundColor: Colors.white,
                      textColor: Colors.teal,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: 'الغاء'),
                ),
                SizedBox(
                  width: 10,
                ),
                CustomButton(
                    backgroundColor: Colors.white,
                    textColor: Colors.teal,
                    onPressed: () {

                      SellCubit.get(context).InsertDatabaseDeferred(
                          total: '${SellCubit.get(context).countallPriceSellFloatingActionButton}',
                          tax:  '${SellCubit
                              .get(context)
                              .DarebaResult}',
                          totalAfterTax:  '${SellCubit
                              .get(context)
                              .afterCalculateDarebaResult}',
                          discount:  '${SellCubit
                              .get(context)
                              .discountPayment}',
                          paid:   payController.text,
                          remaining:  '${SellCubit
                              .get(context)
                              .remainingPayment}',


                          supplier: suppliersName!);
                      Navigator.pop(context);
                    },
                    text: 'تسجيل عمليه الشراء'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ) ;
      },
    );
  }
}
