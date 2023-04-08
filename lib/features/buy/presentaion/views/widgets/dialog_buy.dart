import 'package:cache_repo/features/buy/presentaion/views/widgets/pay_cache.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'deferred_payment.dart';
import 'money_installment.dart';

class ShowDialogBuy2 extends StatefulWidget {
  @override
  _ShowDialogBuy2State createState() => _ShowDialogBuy2State();
}

class _ShowDialogBuy2State extends State<ShowDialogBuy2> {
  int selectedRadio = 0;
  List<String> options2 = ['اضغط لتحديد مورد', 'دفعd اجل', 'دفdع كاش'];
  String? selectedOption;
  String? selectedOption2 = 'اضغط لتحديد مورد';


  Widget buildWidget(int selectedRadio) {
    if (selectedRadio == 0) {
      return MoneyInstallment();
    } else if (selectedRadio == 1) {
      return DeferredPayment();
    } else if (selectedRadio == 2) {
      return PayCache();
    }

    return Container();
  }



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 500,
      child: AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'متابعه عمليه الشراء',
                style: Styles.textStyle20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Radio(
                      value: 0,
                      groupValue: selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          selectedRadio = value!;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'قسط',
                    ),
                  ),
                  Radio(
                    value: 1,
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = value!;
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      'دفع اجل',
                    ),
                  ),
                  Radio(
                    value: 2,
                    groupValue: selectedRadio,
                    onChanged: (value) {
                      setState(() {
                        selectedRadio = value!;
                      });
                    },
                  ),
                  Flexible(
                    child: Text(
                      'دفع كاش',
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenWidth > 600 ? 16.0 : 8.0),
              buildWidget(selectedRadio),
            ],
          ),
        ),
      ),
    );
  }



















}
