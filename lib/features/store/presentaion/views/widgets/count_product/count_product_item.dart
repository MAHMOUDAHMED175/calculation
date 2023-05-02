import 'package:flutter/material.dart';

class CountProductItem extends StatelessWidget {
  CountProductItem({Key? key, required this.product, required this.place})
      : super(key: key);

  int place;

  Map product;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: place % 2 == 0 ? Colors.blue[100] : Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(product['productCount']),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(product['productName']),
              ),
            ],
          ),
        ));
  }
}
