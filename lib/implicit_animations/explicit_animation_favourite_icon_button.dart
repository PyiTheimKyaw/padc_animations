import 'package:flutter/material.dart';
import 'package:padc_animations/utils/constants.dart';

const kAnimationDurationForFavourite = const Duration(milliseconds: 1000);

class ExplitcitAnimationFavouriteIconButton extends StatefulWidget {
  const ExplitcitAnimationFavouriteIconButton({Key? key}) : super(key: key);

  @override
  State<ExplitcitAnimationFavouriteIconButton> createState() =>
      _ExplitcitAnimationFavouriteIconButtonState();
}

class _ExplitcitAnimationFavouriteIconButtonState
    extends State<ExplitcitAnimationFavouriteIconButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _sizeAnimation;
  bool isAnimationCompleted = false;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: kAnimationDurationForFavourite);
    _colorAnimation = ColorTween(begin: Colors.grey[500], end: Colors.red)
        .animate(_controller.view);
    _sizeAnimation = Tween<double>(begin: MARGIN_MEDIUM_3, end: MARGIN_MEDIUM_4)
        .animate(_controller.view);

    _controller.addStatusListener((status) {
      isAnimationCompleted = (status == AnimationStatus.completed);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller.view,
        builder: (context, _) => IconButton(
            onPressed: () {
              if (isAnimationCompleted) {
                _controller.reverse();
              } else {
                _controller.forward();
              }
              // _controller.repeat();
            },
            icon: Icon(
              Icons.favorite,
              size: _sizeAnimation.value,
              color: _colorAnimation.value,
            )));
  }
}
