import 'dart:io';

import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'ShowDialogUpdateRepresnetativ.dart';

class ViewRepresentativesItem extends StatelessWidget {
  ViewRepresentativesItem({Key? key,required this.index,required this.represent}) : super(key: key);

  int index;
  Map represent;
  @override
  Widget build(BuildContext context) {
    File imageFile = File(represent['image']);

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 5,
              child: CustomButton(
                backgroundColor: Colors.white,
                textColor: Colors.black,
                text: "${represent['representPhone']}",
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
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
                        "${represent['representName']}",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.14,
            ),
            Flexible(
              flex: 2,
              child: Container(
                  child: represent['image']==''? CircleAvatar(backgroundColor:Theme.of(context).scaffoldBackgroundColor,backgroundImage:
                  AssetImage('assets/images/no_image.png')):CircleAvatar(backgroundColor:Theme.of(context).scaffoldBackgroundColor,backgroundImage:FileImage(imageFile),
                  )


              ),
            )

          ],
        ),
      ),
    );
  }
}
