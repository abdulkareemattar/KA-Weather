import 'package:flutter/material.dart';

import '../generated/l10n.dart';
import '../models/onboard_model.dart';

List<Onboardmodel> onboard(BuildContext context) {
  return [
    Onboardmodel(
      lottie: 'assets/lottie/sun&cloud onboard.json',
      text: S.of(context).onboard1,
      color: Colors.purple,
      backbutton: false,
    ),
    Onboardmodel(
      lottie: 'assets/lottie/Animation - 1710808181781.json',
      text: S.of(context).onboard2,
      color: Colors.cyan
  ),
    Onboardmodel(
      lottie: 'assets/lottie/Animation - 1710808204624.json',
      text:S.of(context).onboard3,
      color:  Colors.amber,skipbutton: false
    )
  ];
}
