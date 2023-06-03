import 'package:cache_repo/core/utils/colors.dart';
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
                height: 10,
              ),
              Icon(
                 icon, size: MediaQuery.of(context).size.height*0.06, color:ColorsApp.defualtColor ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Center(
                  child: Text(title, style: TextStyle(
                    color: ColorsApp.defualtColor,
                    fontSize:  MediaQuery.of(context).size.height*0.02,
                  )),
                ),
              ),
            ]
        )
    );
  }

}
