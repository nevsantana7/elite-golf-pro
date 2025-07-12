import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../providers/course_provider.dart';

class CourseMapScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courseState = ref.watch(courseProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Course Map')),
      body: courseState.isLoading
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(courseState.position.latitude, courseState.position.longitude),
                zoom: 15,
              ),
              markers: courseState.markers,
              polylines: courseState.polylines,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(courseProvider.notifier).nextHole(),
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}