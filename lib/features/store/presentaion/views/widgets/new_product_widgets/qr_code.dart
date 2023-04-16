import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QrCodes extends StatelessWidget {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  var keyForm=GlobalKey<FormState>();
  QrCodes({required this.parcodeController});
  TextEditingController  parcodeController;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit,StoreStates>(
      builder: (BuildContext context, state) {
        return  Scaffold(
          body: Form(
            key: keyForm,
            child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: StoreCubit.get(context).onQRViewCreated,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            StoreCubit.get(context).scannedText,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width*0.03),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: ColorsApp.defualtColor
                            ),
                            child: Text('Add',style: Styles.textStyle30.copyWith(
                                color: Colors.white
                            ),),
                            onPressed: () {
                              if (keyForm.currentState!.validate()) {
                                parcodeController.text = StoreCubit.get(context).scannedText;
                                Navigator.pop(context);
                              }
                            },
                          ),
                        ),

                      ],

                    ),
                  ),
                ),
              ],
            ),
          ),
        ) ;
      },
    );
  }



}


