import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/swing_provider.dart';

class SwingAnalysisScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swingState = ref.watch(swingProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Swing Analysis')),
      body: Column(
        children: [
          swingState.isAnalyzing
              ? Center(child: CircularProgressIndicator())
              : swingState.result != null
                  ? Column(
                      children: [
                        Text('Swing Speed: ${swingState.result!.speed} mph'),
                        Text('Swing Angle: ${swingState.result!.angle}°'),
                        Text('Feedback: ${swingState.result!.feedback}'),
                      ],
                    )
                  : Text('No analysis available'),
          ElevatedButton(
            onPressed: () => ref.read(swingProvider.notifier).analyzeSwing(),
            child: Text('Analyze Swing'),
          ),
        ],
      ),
    );
  }
}