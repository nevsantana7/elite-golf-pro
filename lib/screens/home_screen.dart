import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/user_provider.dart';
import 'course_map_screen.dart';
import 'scorecard_screen.dart';
import 'swing_analysis_screen.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    return Scaffold(
      appBar: AppBar(title: Text('EliteGolf Pro')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('Play Round'),
                subtitle: Text('Track your round with GPS and stats'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CourseMapScreen())),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Swing Analysis'),
                subtitle: Text('Analyze and improve your swing with AI'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SwingAnalysisScreen())),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Scorecard'),
                subtitle: Text('View and manage your rounds'),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ScorecardScreen())),
              ),
            ),
            // Stubs for other features
            Card(child: ListTile(title: Text('Virtual Golf'), subtitle: Text('Coming soon'))),
            Card(child: ListTile(title: Text('Tee Time Booking'), subtitle: Text('Coming soon'))),
          ],
        ),
      ),
    );
  }
}
