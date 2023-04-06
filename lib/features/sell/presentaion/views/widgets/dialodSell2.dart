import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

Future ShowDialogCounterSell(
  context,
) =>
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.all(0),
        content: SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.height * 0.35,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'تعديل بيانات المنتج',
                  style: Styles.textStyle20.copyWith(color: Colors.teal),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsApp.defualtColor,
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(Icoons.minimize),
                            Text('-', style: TextStyle(fontSize: 40)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: CustomButton(
                            backgroundColor: Colors.white,
                            textColor: Colors.red,
                            text: '5',
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsApp.defualtColor,
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(Icoons.minimize),
                            Text('+', style: TextStyle(fontSize: 40)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButton(
                      backgroundColor: Colors.white,
                      textColor: Colors.teal,
                      text: '548',
                    ),
                    Text('سعر الوحده'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: CustomButton(
                        backgroundColor: ColorsApp.defualtColor,
                        textColor: Colors.white,
                        text: 'حفظ',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: CustomButton(
                        backgroundColor: Colors.grey.withOpacity(0.2),
                        textColor: Colors.red,
                        text: 'حذف المنتج من القائمه',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
