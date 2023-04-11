import 'package:cache_repo/core/utils/assets.dart';
import 'package:cache_repo/features/splash/presentaion/views/widgets/sliding_animation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../confg/app_route.dart';
import '../../../../../core/utils/constants.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    slideAnimate();
    navigatToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:  BoxDecoration(
            image: DecorationImage(image: AssetImage(AssetsData.testImage),fit: BoxFit.cover)
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.monetization_on,size: 100,),
            const SizedBox(height: 8),
            SlidingAnimation(
              slidingAnimations: slidingAnimation,
            )
          ],
        ),
      ),
    );
  }

  void slideAnimate() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 8));

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }

  void navigatToHome() {
    Future.delayed(
      KtransationDuration,
      () {
        // Get.to(() => const HomePage(),
        //     duration: KtransationDuration, transition: Transition.fade);

       GoRouter.of(context).pushReplacement(AppRoute.homePage);


      },
    );
  }
}
