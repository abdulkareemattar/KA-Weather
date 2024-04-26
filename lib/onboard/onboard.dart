import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weatherapp/Providers/Onboard_Provider.dart';
import 'package:weatherapp/data/list_of_onboard_pages.dart';

import '../Providers/language_Provider.dart';
import '../Providers/theme_Provider.dart';
import '../catgeory/onboard_button.dart';
import '../catgeory/onboard_catgeory.dart'; // Assuming this is the correct path
import '../generated/l10n.dart';
import '../pages/home_screen.dart';

class Onboard extends StatelessWidget {
   Onboard({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Brightness theme = Provider.of<ThemeProvider>(context).thememode;
     int currentPage=Provider.of<OnboardProvider>(context).currentPage;
    Map<String, String> languageMap = {
      'English': 'en',
      'Arabic': 'ar',
      'Español': 'es',
      'Deutsch': 'de',
      'Français': 'fr',
      'Hindī': 'hi',
      'Italiano': 'it',
      'Japanese': 'ja',
      'Korean': 'ko',
      'Russian': 'ru',
      'Chinese': 'zh',
    };

    return Scaffold(
      backgroundColor:  (theme == Brightness.light)
          ? lightpurple
          : darkpurple ,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: DropdownButton<String>(
          value: languageMap.keys.firstWhere((key) =>
          languageMap[key] ==
              Provider.of<LanguageProvider>(context, listen: false)
                  .selectedLanguage),
          icon: const Icon(Icons.language),
          onChanged: (String? newValue) {
            Provider.of<LanguageProvider>(context, listen: false)
                .setLanguage(languageMap[newValue]!);
          },
          items: languageMap.keys.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
      body: Container(padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: AlignmentDirectional.topCenter,
                colors: [
                  Colors.purple[500]!,
                  Colors.purple[300]!,
                  Colors.purple[100]!
                ])),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                height: 390.h,
                child: PageView.builder(
                  itemBuilder: (context, index) =>
                      onboardcatgeory(context, onboard(context)[index]),
                  itemCount: onboard(context).length,
                  controller: pageController,
                  onPageChanged: (int i) {
                    Provider.of<OnboardProvider>(context,listen: false).setCurPage(i);
                  },
                ),
              ),

            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: SmoothPageIndicator(
                controller: pageController,
                count: onboard(context).length,
                effect: const JumpingDotEffect(
                  activeDotColor: Colors.amber,
                  dotColor: Colors.grey,
                  paintStyle: PaintingStyle.fill,
                ),
                onDotClicked: (index) => pageController.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.linear),
              ),
            ),
            Button(
                onpressed: () {
                  (currentPage == onboard(context).length - 1)
                      ? Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => const HomeScreen(),
                      transitionDuration: const Duration(seconds: 1),
                      transitionsBuilder: (context, animation, animationTime, child) {
                        animation = CurvedAnimation(parent: animation, curve: Curves.easeInOutQuad);
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  )
                      : pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut);
                },

                txt: S.of(context).next,
                clr: Colors.orange),
            (currentPage!=0)?
            Button(
                onpressed: () => pageController.previousPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastEaseInToSlowEaseOut),
                txt: S.of(context).back,
                clr: Colors.blueAccent):SizedBox.shrink(),
            (currentPage!=2)?
            Button(
                onpressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) => const HomeScreen(),
                      transitionDuration: const Duration(seconds: 1),
                      transitionsBuilder: (context, animation, animationTime, child) {
                        animation = CurvedAnimation(parent: animation, curve: Curves.easeInOutQuad);
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                        (route) => false),
                txt: S.of(context).skip,
                clr: Colors.purpleAccent):SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
