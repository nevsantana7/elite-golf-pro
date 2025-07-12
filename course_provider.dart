import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../services/gps_service.dart';

class CourseState {
  final Position position;
  final Set<Marker> markers;
  final Set<Polyline> polylines;
  final bool isLoading;
  final int currentHole;

  CourseState({
    required this.position,
    this.markers = const {},
    this.polylines = const {},
    this.isLoading = false,
    this.currentHole = 1,
  });
}

class CourseNotifier extends StateNotifier<CourseState> {
  final GpsService _gpsService;
  CourseNotifier(this._gpsService)
      : super(CourseState(position: Position(
          latitude: 0,
          longitude: 0,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0)));

  Future<void> loadCourse() async {
    state = CourseState(position: state.position, isLoading: true);
    final position = await _gpsService.getCurrentPosition();
    final markers = {
      Marker(
        markerId: MarkerId('pin'),
        position: LatLng(position.latitude, position.longitude),
      ),
    };
    state = CourseState(
      position: position,
      markers: markers,
      isLoading: false,
      currentHole: state.currentHole,
    );
  }

  void nextHole() {
    state = CourseState(
      position: state.position,
      markers: state.markers,
      polylines: state.polylines,
      isLoading: state.isLoading,
      currentHole: state.currentHole + 1,
    );
  }
}

final courseProvider = StateNotifierProvider<CourseNotifier, CourseState>((ref) {
  return CourseNotifier(GpsService());
});