
import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/ride_pref.dart';
import 'package:week_3_blabla_project/repository/ride_preferences_repository.dart';

class RidePrefProivder extends ChangeNotifier{

  RidePreference? _currentPreference;
  List<RidePreference> _pastPreferences = [];

  // Constructor
  final RidePreferencesRepository ridePreferencesRepository;

  RidePrefProivder({required this.ridePreferencesRepository}) {
    _pastPreferences = ridePreferencesRepository.getPastPreferences();
  }

  // get current preference

  RidePreference? get currentPreference => _currentPreference;

  // Set the current preference

  void setCurrentPreference(RidePreference ridePreference) {
    if(ridePreference == _currentPreference) {
      return;
    } else {
      _currentPreference = ridePreference;
      _addPreference(ridePreference);
      notifyListeners();
    }
  }

  void _addPreference(RidePreference ridePreference) {
    if(_pastPreferences.contains(ridePreference)) {
      return;
    } else {
      _pastPreferences.add(ridePreference);
      notifyListeners();
    }
  }

  // Get the list of past preference newest to oldest
  List<RidePreference> get pastPreferences => _pastPreferences.reversed.toList();

}
