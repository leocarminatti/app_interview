import 'package:app_interview/core/routes/app_router.gr.dart';
import 'package:app_interview/core/theme/app_colors.dart';
import 'package:app_interview/core/theme/app_icons.dart';
import 'package:app_interview/core/theme/app_textstyle.dart';
import 'package:app_interview/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> myTween;

  @override
  void initState() {
    super.initState();
    _initAnimation();
    Future.delayed(const Duration(seconds: 3), () {
      getInstance.get<AppRouter>().replace(MainRoute());
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future _initAnimation() async {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    myTween = Tween<double>(begin: 0, end: 1).animate(_animationController);
    await Future<void>.delayed(const Duration(seconds: 1));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              AppColor.darkBlue,
              AppColor.secondGradientActivate,
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * .4,
              child: SizeTransition(
                axisAlignment: -1,
                sizeFactor: myTween,
                child: SvgPicture.asset(AppIcons.logo),
              ),
            ),
            Positioned(
              bottom: 46,
              left: 0,
              right: 0,
              child: Column(
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.appTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.h5().copyWith(color: AppColor.white),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    AppLocalizations.of(context)!.createdBy,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.h6().copyWith(color: AppColor.white),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
