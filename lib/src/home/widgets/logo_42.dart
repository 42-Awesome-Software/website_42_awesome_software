import 'package:flutter/material.dart';
import 'package:website_42_awesome_software/src/animation/custom_42_animations.dart';
import 'package:website_42_awesome_software/src/theme/custom_42_theme.dart';

class Logo42 extends StatelessWidget {
  const Logo42({
    super.key,
    required this.animationsMap,
  });

  final Map<String, AnimationInfo> animationsMap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '4',
                style: Custom42Theme.of(context).displayLarge.override(
                      fontFamily: 'Lato',
                      color: const Color(0xFF121212),
                      fontWeight: FontWeight.w800,
                    ),
              ),
              Text(
                '2',
                style: Custom42Theme.of(context).displayLarge.override(
                      fontFamily: 'Lato',
                      color: const Color(0xFFFAFAFA),
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ],
          ).animateOnPageLoad(animationsMap['rowOnPageLoadAnimation']!),
        ),
        Text(
          'Awesome Software',
          style: Custom42Theme.of(context).headlineMedium.override(
                fontFamily: 'Lato',
                color: const Color(0xFF121212),
                fontWeight: FontWeight.w500,
              ),
        ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation']!),
      ],
    );
  }
}
