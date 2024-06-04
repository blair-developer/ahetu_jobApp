import 'package:ahetu/controllers/onboarding_provider.dart';
import 'package:ahetu/views/common/app_style.dart';
import 'package:ahetu/views/common/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ahetu/constants/app_constants.dart';
import 'package:ahetu/views/screens/onboarding/widget/PageOne.dart';
import 'package:ahetu/views/screens/onboarding/widget/PageThree.dart';
import 'package:ahetu/views/screens/onboarding/widget/PageTwo.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController( );

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnBoardNotifier>(
        builder: (context, OnBoardNotifier, child){
          print(OnBoardNotifier.isLastPage);
           return Stack(
        children: [
          PageView(
            controller: pageController,
            physics: OnBoardNotifier.isLastPage? const NeverScrollableScrollPhysics():const AlwaysScrollableScrollPhysics(),
            onPageChanged: (page){
               OnBoardNotifier.isLastPage = page == 2;
            },
            children: const [PageOne(), PageTwo(), PageThree()],
          ),
         OnBoardNotifier.isLastPage ? const SizedBox.shrink() : Positioned(
            bottom: hieght*0.03,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: WormEffect(
                  dotColor: Color(kLight.value),
                  activeDotColor: Color(kOrange.value),
                  dotHeight: 12,
                  dotWidth: 12,
                  spacing: 10
                ),
              ),
            )),
        OnBoardNotifier.isLastPage ? const SizedBox.shrink() : Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(padding: EdgeInsets.symmetric(
                 horizontal: 20,
                 vertical: 30
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  GestureDetector(
                    onTap: () {
                      pageController.jumpToPage(2);
                    },
                    child: ReusableText(text: 'Skip', style: TextStyle(color: const Color.fromARGB(255, 242, 244, 246), fontWeight: FontWeight.normal, fontSize: 16))),
                  GestureDetector(
                    onTap: (){
                      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                    },
                    child: ReusableText(text: 'Next', style: TextStyle(color: const Color.fromARGB(255, 247, 248, 249), fontWeight: FontWeight.normal, fontSize: 16)))
                ],
              ),
              ),
          ))
        ],
      );
        }
        )
    );
  }
}
