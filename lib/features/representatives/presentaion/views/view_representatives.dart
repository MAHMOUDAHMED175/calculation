import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/core/widgets/divider.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/representatives/presentaion/views/widgets/view_product_widgets/app_bar_view_representative_widget.dart';
import 'package:flutter/material.dart';

class ViewRepresentatives extends StatelessWidget {
  var searchController = TextEditingController();

//2
  //222
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarViewRepresentatives()),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: defaultFormField(
                        controller: searchController,
                        prefix: Icons.search,
                        type: TextInputType.text,
                        hintText: 'ابحث عن اسم الكاشير'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              color: ColorsApp.defualtColor,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text(
                          'رقم الهاتف ',
                          style: Styles.textStyle15,
                        )),
                    Expanded(
                        flex: 2,
                        child:
                            Text('بيانات الكاشير', style: Styles.textStyle15)),
                    Expanded(
                        flex: 1,
                        child: Text('صوره الكاشير', style: Styles.textStyle15)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => ViewRepresentativesItem(),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewRepresentativesItem extends StatelessWidget {
  ViewRepresentativesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //9
        //5
        ShowDialogUpdateRepresnetativ(context);
        //8
      },
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: CustomButton(
                backgroundColor: Colors.white,
                textColor: Colors.black,
                text: "01125345129",
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Flexible(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "اسم الكاشير",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Flexible(
              flex: 2,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.08,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.07,
                  backgroundImage: AssetImage(
                    'assets/images/money.jpg',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future ShowDialogUpdateRepresnetativ(
  context,
) =>
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(
                  backgroundColor: ColorsApp.defualtColor,
                  textColor: Colors.white,
                  text: 'تحديده الكاشير الحالى'),
            ),
          );
        });
