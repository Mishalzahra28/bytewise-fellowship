import 'package:flutter/material.dart';

class TweenAnimate extends StatefulWidget {
  const TweenAnimate({super.key});

  @override
  State<TweenAnimate> createState() => _TweenAnimateState();
}

class _TweenAnimateState extends State<TweenAnimate>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late Animation colorAnimation;
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = Tween(begin: 0.0, end: 200.0).animate(animationController);
    colorAnimation =
        ColorTween(begin: Colors.indigo.shade200, end: Colors.red.shade200)
            .animate(animationController);
    animationController.addListener(() {
      print(animation.value);
      print(colorAnimation.value);
      setState(() {});
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
            width: animation.value,
            height: animation.value,
            color: colorAnimation.value,
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Tween Animation',
              style: TextStyle(
                  color: Colors.indigo,
                  height: 2,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
