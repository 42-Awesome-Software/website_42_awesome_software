import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_42_awesome_software/src/animation/custom_42_animations.dart';
import 'package:website_42_awesome_software/src/home/widgets/widgets.dart';
import 'package:website_42_awesome_software/src/theme/custom_42_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const routeName = '/home_page';

  @override
  Widget build(BuildContext context) {
    final animationsMap = {
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.bounceOut,
            delay: 0.ms,
            duration: 2000.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 420.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 420.ms,
            duration: 2000.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'buttonOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 900.ms),
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 900.ms,
            duration: 1200.ms,
            begin: const Offset(-0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
      'buttonOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effects: [
          VisibilityEffect(duration: 1210.ms),
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 1210.ms,
            duration: 1200.ms,
            begin: const Offset(-0.0, 100.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    };

    return Title(
      title: '42 Awesome Software',
      color: Custom42Theme.of(context).primary,
      child: Scaffold(
        backgroundColor: const Color(0xFFFBCF03),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Logo42(animationsMap: animationsMap),
              const SizedBox(
                height: 42.0,
              ),
              CustomIconButton(
                iconPath: 'assets/icons/linkedin-logo.png',
                label: 'Linkedin',
                options: CustomButtonOptions(
                  width: 274,
                  height: 40,
                  color: const Color(0xFFFBCF03),
                  textStyle: Custom42Theme.of(context).titleSmall.override(
                        fontFamily: 'Lato',
                        color: const Color(0xFF121212),
                        fontSize: 16,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  hoverColor: const Color(0xFFFBCF03),
                  hoverTextColor: Custom42Theme.of(context).primaryText,
                  hoverElevation: 1.0,
                ),
                onPressed: () async {
                  final url = Uri.parse(
                      'https://www.linkedin.com/company/42awesomesoftware/');
                  await launchUrl(url);
                },
              ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation1']!),
              const SizedBox(
                height: 21.0,
              ),
              CustomIconButton(
                onPressed: () async {
                  final url =
                      Uri.parse('https://github.com/42-Awesome-Software');
                  await launchUrl(url);
                },
                options: CustomButtonOptions(
                  width: 274,
                  height: 40,
                  color: const Color(0xFFFBCF03),
                  textStyle: Custom42Theme.of(context).titleSmall.override(
                        fontFamily: 'Lato',
                        color: const Color(0xFF121212),
                        fontSize: 16,
                      ),
                  elevation: 3.0,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                  hoverColor: const Color(0xFFFBCF03),
                  hoverTextColor: Custom42Theme.of(context).primaryText,
                  hoverElevation: 1.0,
                ),
                iconPath: 'assets/icons/github-mark.png',
                label: 'GitHub',
              ).animateOnPageLoad(animationsMap['buttonOnPageLoadAnimation2']!),
            ],
          ),
        ),
      ),
    );
  }
}
