import 'package:flutter/material.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../../buy/presentaion/views/widgets/payment/deferred_payment.dart';
import '../../../../../buy/presentaion/views/widgets/payment/pay_cache.dart';

class ShowDialogSell2 extends StatefulWidget {
  @override
  _ShowDialogSell2State createState() => _ShowDialogSell2State();
}

class _ShowDialogSell2State extends State<ShowDialogSell2> {
  int selectedRadio = 1;
  List<String> options2 = ['اضغط لتحديد مورد', 'دفعd اجل', 'دفdع كاش'];

  String? selectedOption;
  String? selectedOption2 = 'اضغط لتحديد مورد';

  var payController = TextEditingController(text: '0');

  Widget buildWidget(int selectedRadio) {
     if (selectedRadio == 1) {
      return DeferredPayment();
    } else if (selectedRadio == 0) {
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
                    value: 0,
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
