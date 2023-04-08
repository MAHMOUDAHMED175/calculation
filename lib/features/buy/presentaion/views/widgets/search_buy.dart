


import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/text_from_field_widget.dart';
import 'package:flutter/material.dart';

class SearchBuy extends StatelessWidget {
   SearchBuy({Key? key}) : super(key: key);

  final searchBuyController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorsApp.defualtColor,
            borderRadius: BorderRadius.circular(50)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: defaultFormField(
                    controller: searchBuyController,
                    prefix: Icons.search,
                    type: TextInputType.text,
                    hintText: 'اسم عن المنتج او استخدم الكاميرا '),
              ),
              IconButton(
                  color: ColorsApp.buttonColor,
                  onPressed: () {},
                  icon: Icon(
                    Icons.qr_code_2,
                    size: 30,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
