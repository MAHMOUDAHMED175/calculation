import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

Widget gridItem() => LayoutBuilder(
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

Widget gridSell() => LayoutBuilder(
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
        itemBuilder: (context, index) => gridItem(),
      ),
    );
  },
);

// Widget gridSell() => LayoutBuilder(
//   builder: (BuildContext context, BoxConstraints constraints) {
//     final crossAxisCount = (constraints.maxWidth / 150).floor();
//     return SizedBox(
// // Wrap the GridView inside a SizedBox with a defined height and width
//       height: double.infinity,
// // Set the height based on the aspect ratio of the grid items
//       width: constraints.maxWidth,
// // Set the width to the maximum available width
//       child: GridView.builder(
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: crossAxisCount,
//           crossAxisSpacing: 2.0,
//           mainAxisSpacing: 4.0,
//           childAspectRatio: .6,
//         ),
//         itemBuilder: (context, index) => ResponsiveGridItem(),
//       ),
//     );
//   },
// );
// class ResponsiveGridItem extends StatelessWidget {
//
//   ResponsiveGridItem();
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(4.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(width: 1, color: Colors.black),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               flex: 3,
//               child: Image(
//                 image: AssetImage('assets/images/money.jpg'),
//                 fit: BoxFit.cover,
//                 width: double.infinity,
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Text(
//                   'اسم الkjh  dfsd  hfgdjhfg fdgshdfk ljlhsdf gkjseh gjsh fgkjjhsdf kghsdf gjhsdkfj hksdjfh kjsf hdh منتج',
//                   textAlign: TextAlign.center,
//                   maxLines: 3,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Expanded(
//               flex: 2,
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: CustomButton(
//                   backgroundColor: ColorsApp.defualtColor,
//                   textColor: Colors.white,
//                   text: 'اضافه',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
