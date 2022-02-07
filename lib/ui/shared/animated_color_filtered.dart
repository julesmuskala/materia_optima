// import 'package:flutter/material.dart';

// class AnimatedColorFiltered extends AnimatedWidget {
//   const AnimatedColorFiltered({
//     Key? key,
//     required AnimationController controller,
//     required BlendMode blendMode,
//   }) : super(key: key, listenable: controller);

//   Animation<double> get _progress => listenable as Animation<double>;

//   @override
//   Widget build(BuildContext context) {
//     return ColorFiltered(
//       colorFilter: ColorFilter.mode(Color.lerp(a, b, t), blendMode),
//       ),
//   }
// }
