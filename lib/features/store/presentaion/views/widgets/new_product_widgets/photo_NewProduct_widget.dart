import 'dart:io';

import 'package:cache_repo/features/store/presentaion/views/widgets/new_product_widgets/scane_photo.dart';
import 'package:flutter/material.dart';

class PhotoProduct extends StatelessWidget {
   PhotoProduct({Key? key, required this.photo}) : super(key: key);
  File photo;
  @override
  Widget build(BuildContext context) {
    return            InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ImageScreen()));
      },
      child:  Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Theme
              .of(context)
              .scaffoldBackgroundColor,
          child: CircleAvatar(
            radius: 45,
            backgroundImage: FileImage(photo),
          ),
        ),
        CircleAvatar(
            radius: 20,
            backgroundColor: Theme
                .of(context)
                .scaffoldBackgroundColor,
            child: Icon(Icons.camera_alt_outlined),
          ),

      ],)
    );
  }
}
