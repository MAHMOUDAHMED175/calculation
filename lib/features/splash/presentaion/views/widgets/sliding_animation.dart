import 'package:cache_repo/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SlidingAnimation extends StatelessWidget {
  const SlidingAnimation({Key? key,required  this.slidingAnimations}) : super(key: key);



 final Animation<Offset> slidingAnimations;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimations,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimations,
            child:  Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7)
              ),
              child: Text("The Financial Accountant",
                style: Styles.textStyle18.copyWith(
                  color: Colors.black
                ),
                textAlign: TextAlign.center,

              ),
            ),
          );
        }
    )
    ;
  }
}
