import 'package:flutter/foundation.dart';

class SplashScreenViewModel with ChangeNotifier {
  double _opacityOfBottomText = 0.0;

  set opacityOfBottomText(double newOpacity) {
    _opacityOfBottomText = newOpacity;
    notifyListeners();
  }

  get opacityOfBottomText => _opacityOfBottomText;
}
