import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/core/widgets/divider.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/view_product_widgets/app_bar_view_product_widget.dart';
import 'package:cache_repo/features/store/presentaion/views/widgets/view_product_widgets/dialoge_view.dart';
import 'package:flutter/material.dart';

class ViewProduct extends StatelessWidget {
  var searchController = TextEditingController();

//2
  //222
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBarViewProduct(
            moneyCount: 40,
          )),
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
                        hintText: 'اسم المنتج'),
                  ),
                  IconButton(
                      color: ColorsApp.buttonColor,
                      onPressed: () {},
                      icon: Icon(
                        Icons.qr_code_2,
                        size: 30,
                      )),
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
                          'الكميه ',
                          style: Styles.textStyle15,
                        )),
                    Expanded(
                        flex: 2,
                        child: Text('السعر', style: Styles.textStyle15)),
                    Expanded(
                        flex: 3,
                        child: Text('المنتج', style: Styles.textStyle15)),
                    Expanded(
                        flex: 1,
                        child: Text('صوره المنتج', style: Styles.textStyle15)),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) => ViewProductItem(),
                  separatorBuilder: (context, index) => myDivider(),
                  itemCount: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewProductItem extends StatelessWidget {
  var nameProductController = TextEditingController();
  var buyPriceProductController = TextEditingController();
  var countProductController = TextEditingController();
  var dateProductController = TextEditingController();
  var detailsProductController = TextEditingController();
  var parcodeProductController = TextEditingController();
  var sellPriceProductController = TextEditingController();

  var taxController = TextEditingController();
  var discountController = TextEditingController();
  var theTotalBeforeTaxController = TextEditingController();
  var theTotalAfterTaxController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //9
        //5
        //8

        ShowDialogUpdateProduct(
          context,
          discountController: discountController,
          taxController: taxController,
          theTotalAfterTaxController: theTotalAfterTaxController,
          theTotalBeforeTaxController: theTotalBeforeTaxController,
          nameProductController: nameProductController,
          buyProductController: buyPriceProductController,
          countProductController: countProductController,
          dateProductController: dateProductController,
          detailsController: detailsProductController,
          qrCodeProductController: parcodeProductController,
          sellProductController: sellPriceProductController,
        );
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
              flex: 3,
              child: CustomButton(
                backgroundColor: Colors.white,
                textColor: Colors.black,
                text: "999",
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Flexible(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: CustomButton(
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                  text: "999999",
                ),
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
                        'اسم dgsdf sdfsdfdf  f المنتج ',
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
