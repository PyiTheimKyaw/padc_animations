import 'package:flutter/material.dart';
import 'package:padc_animations/implicit_animations/explicit_animation_favourite_icon_button.dart';
import 'package:padc_animations/utils/constants.dart';

const kAnimationDuration = Duration(milliseconds: 500);
const kAnimationdurationForScreenFadeIn = Duration(milliseconds: 1000);

class ImplicitAnimations extends StatefulWidget {
  const ImplicitAnimations({Key? key}) : super(key: key);

  @override
  State<ImplicitAnimations> createState() => _ImplicitAnimationsState();
}

class _ImplicitAnimationsState extends State<ImplicitAnimations> {
  bool isNewDimensions = false;
  bool isChangeBackgroundColor = false;
  bool isDescriptionShown = true;
  bool isChangedButtonLayout = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TweenAnimationBuilder(
            duration: kAnimationdurationForScreenFadeIn,
            tween: Tween<double>(begin: 0, end: 1),
            builder: (BuildContext context, double value, Widget? child) =>
                Opacity(
              opacity: value,
              child: child,
            ),
            child: AnimatedContainer(
              duration: kAnimationDuration,
              color: (isChangeBackgroundColor) ? Colors.black : Colors.white,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        AnimatedContainer(
                          width: (isNewDimensions) ? 350 : 260,
                          height: (isNewDimensions) ? 300 : 250,
                          duration: kAnimationDuration,
                          curve: Curves.easeInCubic,
                          child: Image.asset(
                            "assets/flutter_logo.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                       const Positioned(
                            top: 0,
                            right: 0,
                            child: ExplitcitAnimationFavouriteIconButton()),
                      ],
                    ),
                    AnimatedSize(
                      duration: kAnimationDuration,
                      child: Container(
                        height: (isDescriptionShown) ? null : 0.0,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: MARGIN_MEDIUM_2,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: MARGIN_MEDIUM_2),
                              child: Text(
                                "In Flutter, everything is a widget, which is the core concept of this framework. Widget in the Flutter is basically a user interface component that affects and controls the view and interface of the app. ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: (isChangeBackgroundColor)
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: MARGIN_MEDIUM_3,
                    ),
                    AnimatedSize(
                      duration: kAnimationDuration,
                      child: AnimatedSwitcher(
                        duration: kAnimationDuration,
                        child: (isChangedButtonLayout)
                            ? PrimaryButtonsInWrap(
                                onPressedDimension: () {
                                  setState(() {
                                    isNewDimensions = !isNewDimensions;
                                  });
                                },
                                onPressedShowDescription: () {
                                  setState(() {
                                    isDescriptionShown = !isDescriptionShown;
                                  });
                                },
                                onPressedChangeTheme: () {
                                  setState(() {
                                    isChangeBackgroundColor =
                                        !isChangeBackgroundColor;
                                  });
                                },
                              )
                            : PrimaryButtonsInColumn(
                                onPressedDimension: () {
                                  setState(() {
                                    isNewDimensions = !isNewDimensions;
                                  });
                                },
                                onPressedShowDescription: () {
                                  setState(() {
                                    isDescriptionShown = !isDescriptionShown;
                                  });
                                },
                                onPressedChangeTheme: () {
                                  setState(() {
                                    isChangeBackgroundColor =
                                        !isChangeBackgroundColor;
                                  });
                                },
                              ),
                      ),
                    ),
                    PrimaryButton(
                      text: "Change Button layout",
                      onPressed: () {
                        setState(() {
                          isChangedButtonLayout = !isChangedButtonLayout;
                        });
                      },
                      color: Colors.red,
                    )
                  ],
                ),
              ),
            ),
          ),
          TweenAnimationBuilder(
            child: Text(
              "PADC Animations",
              style: TextStyle(
                  color:
                      (isChangeBackgroundColor) ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: MARGIN_MEDIUM_2 + 8),
            ),
            tween: Tween<double>(begin: 0, end: 1),
            duration: kAnimationdurationForScreenFadeIn,
            builder: (context, double _value, child) => Opacity(
              opacity: _value,
              child: Padding(
                padding: EdgeInsets.only(
                    top: _value * MARGIN_LARGE, left: MARGIN_MEDIUM_2),
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PrimaryButtonsInWrap extends StatelessWidget {
  final Function onPressedDimension;
  final Function onPressedShowDescription;
  final Function onPressedChangeTheme;

  PrimaryButtonsInWrap(
      {required this.onPressedDimension,
      required this.onPressedShowDescription,
      required this.onPressedChangeTheme});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
              onPressed: onPressedDimension,
              text: "Change Dimensions",
            ),
            SizedBox(
              width: MARGIN_MEDIUM_2,
            ),
            PrimaryButton(
              onPressed: onPressedShowDescription,
              text: "Show Description",
            ),
          ],
        ),
        PrimaryButton(
          onPressed: onPressedChangeTheme,
          text: "Change Theme",
        ),
      ],
    );
  }
}

class PrimaryButtonsInColumn extends StatelessWidget {
  final Function onPressedDimension;
  final Function onPressedShowDescription;
  final Function onPressedChangeTheme;

  PrimaryButtonsInColumn(
      {required this.onPressedDimension,
      required this.onPressedShowDescription,
      required this.onPressedChangeTheme});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          onPressed: onPressedDimension,
          text: "Change Dimensions",
        ),
        PrimaryButton(
          onPressed: onPressedShowDescription,
          text: "Show Description",
        ),
        PrimaryButton(
          onPressed: onPressedChangeTheme,
          text: "Change Theme",
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color color;

  PrimaryButton(
      {required this.text,
      required this.onPressed,
      this.color = Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        onPressed();
      },
      child: Text(text),
      textColor: Colors.white,
      color: color,
    );
  }
}
