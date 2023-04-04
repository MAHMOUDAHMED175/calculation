import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';


class SelectCard extends StatelessWidget {
  const SelectCard({ Key? key, required this.icon, required this.title, }) : super(key: key);

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Icon(
                 icon, size: 50.0, color:ColorsApp.defualtColor ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(title, style: Styles.textStyle18.copyWith(
                  color: ColorsApp.defualtColor
                )),
              ),
            ]
        )
    );
  }

}
