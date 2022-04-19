import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CustomAnimation extends StatefulWidget {
  const CustomAnimation({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ConfettiController controller;

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation> {
  bool isPlaying = false;
  final controller = ConfettiController();

  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        isPlaying = controller.state == ConfettiControllerState.playing;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ConfettiWidget(
          confettiController: widget.controller,
          shouldLoop: true,
          blastDirectionality: BlastDirectionality.explosive,
          emissionFrequency: 0.1,
          numberOfParticles: 50,
          minBlastForce: 10,
          maxBlastForce: 50,
        ),
      ],
    );
  }
}
