import 'package:flutter/foundation.dart';

class SiteProvider extends ChangeNotifier {
  String _activeNav = 'home';
  String _openDoor = 'apps';
  double _tiltX = 0;
  double _tiltY = 0;

  String get activeNav => _activeNav;
  String get openDoor => _openDoor;
  double get tiltX => _tiltX;
  double get tiltY => _tiltY;

  void setActiveNav(String key) {
    if (_activeNav != key) {
      _activeNav = key;
      notifyListeners();
    }
  }

  void setOpenDoor(String key) {
    if (_openDoor == key) {
      _openDoor = '';
    } else {
      _openDoor = key;
    }
    notifyListeners();
  }

  void openDoorOnly(String key) {
    if (_openDoor != key) {
      _openDoor = key;
      notifyListeners();
    }
  }

  void setTilt(double x, double y) {
    _tiltX = x;
    _tiltY = y;
    notifyListeners();
  }

  void resetTilt() {
    _tiltX = 0;
    _tiltY = 0;
    notifyListeners();
  }
}
