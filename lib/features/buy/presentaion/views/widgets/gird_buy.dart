import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

Widget gridItemBuy() => LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Image(
                image: AssetImage('assets/images/money.jpg'),
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'تيشيؤت 2**99*8*71',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: CustomButton(
                  backgroundColor: ColorsApp.defualtColor,
                  textColor: Colors.white,
                  text: 'اضافه',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  },
);

Widget gridBuy() => LayoutBuilder(
  builder: (BuildContext context, BoxConstraints constraints) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.8,
      width:double.infinity,// اجعل الارتفاع يساوي نصف ارتفاع الشاشة
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2.0,
          mainAxisSpacing: 4.0,
          childAspectRatio: .6,
        ),
        itemBuilder: (context, index) => gridItemBuy(),
      ),
    );
  },
);

