import 'package:flutter/material.dart';

enum ColorType { red, blue }

extension ColorTypeX on ColorType {
  Color get color {
    switch (this) {
      case ColorType.red:
        return Colors.red;
      case ColorType.blue:
        return Colors.blue;
    }
  }

  String get label {
    switch (this) {
      case ColorType.red:
        return 'red';
      case ColorType.blue:
        return 'blue';
    }
  }
}

class ColorService extends ChangeNotifier {
  int currentIndex = 0;

  final Map<ColorType, int> _tapCounts = {
    for (final type in ColorType.values) type: 0,
  };

  Map<ColorType, int> get tapCounts => _tapCounts;

  void increment(ColorType type) {
    _tapCounts[type] = (_tapCounts[type] ?? 0) + 1;
    notifyListeners();
  }

  void setTab(int index) {
    currentIndex = index;
    notifyListeners();
  }
}

final colorService = ColorService();
