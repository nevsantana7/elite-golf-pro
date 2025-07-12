import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/scorecard_provider.dart';

class ScorecardScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scorecard = ref.watch(scorecardProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Scorecard')),
      body: ListView.builder(
        itemCount: scorecard.holes.length,
        itemBuilder: (context, index) {
          final hole = scorecard.holes[index];
          return ListTile(
            title: Text('Hole ${index + 1}'),
            subtitle: Text('Par: ${hole.par}, Strokes: ${hole.strokes}'),
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () => ref.read(scorecardProvider.notifier).addStroke(index),
            ),
          );
        },
      ),
    );
  }
}