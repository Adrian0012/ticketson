import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WorkInProgress extends StatefulWidget {
  const WorkInProgress({super.key});

  @override
  State<WorkInProgress> createState() => _WorkInProgressState();
}

class _WorkInProgressState extends State<WorkInProgress>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Lottie.asset(
          height: size.height / 2.5,
          width: size.width,
          fit: BoxFit.fill,
          'assets/lottie/wip.json',
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..repeat();
          },
        ),
      ),
    );
  }
}
