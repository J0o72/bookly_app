import 'package:bookly/Features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationControll;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    textSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationControll.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        // Second Solution To starting Animation (AnimatedBuilder)
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void textSlidingAnimation() {
    animationControll = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(-1, 0),
      end: Offset.zero,
    ).animate(animationControll);

    // First Solution To Start Animation
    // slidingAnimation.addListener(() {
    //   setState(() {});
    // });

    animationControll.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const HomeView(),
      //   ),
      // );

      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }
}
