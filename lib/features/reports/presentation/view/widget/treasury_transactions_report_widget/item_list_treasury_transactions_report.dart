import 'package:flutter/material.dart';

class ItemListTreasuryTransactionsReport extends StatelessWidget {
  const ItemListTreasuryTransactionsReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 4,
            child: Text(
              "ارجاع الصنف للمورد:تيشرت 2 فى واحد لبنى برتقالى",
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.001,
          ),
          Flexible(
            flex: 3,
            child: Text(
              '02-04-2023',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
          Flexible(
            flex: 4,
            child: Text(
              '4512',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.003,
          ),
          Flexible(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '1758 جنيه',textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.003,
          ),
          Flexible(
            flex: 2,
            child: Text(
              'اضافه',
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.003,
          ),
        ],
      ),
    );
  }
}
