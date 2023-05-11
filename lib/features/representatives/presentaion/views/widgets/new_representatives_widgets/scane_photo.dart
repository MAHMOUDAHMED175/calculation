import 'package:cache_repo/core/utils/colors.dart';
import 'package:cache_repo/core/widgets/custom_button.dart';
import 'package:cache_repo/features/representatives/presentaion/views_models/managers/representatives_cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/cubit.dart';
import 'package:cache_repo/features/store/presentaion/views_models/managers/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/utils/styles.dart';


class AlertDialogeTakeImageRepresentative extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  RepresentativesCubit.get(context).takeImageCameraRepresentative(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.2),
                    color: Colors.teal,

                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                         "استخدام الكاميرا",
                          textDirection: TextDirection.rtl,
                          style: Styles.textStyle20.copyWith(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: (){
                  RepresentativesCubit.get(context).takeImageGellaryRepresentative(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.2),
                    color: Colors.teal,

                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "فتح معرض الصور",
                          textDirection: TextDirection.rtl,
                          style: Styles.textStyle20.copyWith(
                              fontSize: 20, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.camera,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
