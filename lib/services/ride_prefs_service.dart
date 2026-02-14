import 'package:blablacar/model/user/user.dart';

import '../dummy_data/dummy_data.dart';
import '../model/ride_pref/ride_pref.dart';

////
///   This service handles:
///   - History of the last ride preferences        (to allow users to re-use their last preferences)
///   - Curent selected ride preferences.
///
class RidePrefService {
  ///
  /// List of past entered ride prefs. LIFO (most recents first)
  ///
  static List<RidePref> ridePrefsHistory =
      fakeRidePrefs; // TODO for now fake data

  static RidePref? currentRidePref;

  static bool get hasCurrentRidePref => currentRidePref != null;
  final List<RidePrefListener> _listener = [];

  void addListener(RidePrefListener listener) {
    _listener.add(listener);
  }

  void selectedPref(RidePref newRidePref) {
    if (newRidePref != currentRidePref) {
      currentRidePref = newRidePref;
      notifyListener();
    }
  }

  void notifyListener() {
    for (RidePrefListener l in _listener) {
      l.onPrefSelected(currentRidePref!);
    }
  }
}

abstract class RidePrefListener {
  void onPrefSelected(RidePref selectedPref);
}

class NotifyUser extends RidePrefListener {
  @override
  void onPrefSelected(RidePref selectedPref) {
    print("the new preference has been selected");
  }
}

void main() {
  RidePrefService myPref = RidePrefService();

  NotifyUser notifyUser = NotifyUser();

  myPref.addListener(notifyUser);

  myPref.selectedPref(fakeRidePrefs[0]);
}


