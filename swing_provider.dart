import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/ai_swing_service.dart';
import '../models/swing_result.dart';

class SwingState {
  final bool isAnalyzing;
  final SwingResult? result;

  SwingState({this.isAnalyzing = false, this.result});
}

class SwingNotifier extends StateNotifier<SwingState> {
  final AiSwingService _aiService;
  SwingNotifier(this._aiService) : super(SwingState());

  Future<void> analyzeSwing() async {
    state = SwingState(isAnalyzing: true);
    final result = await _aiService.analyzeSwing();
    state = SwingState(isAnalyzing: false, result: result);
  }
}

final swingProvider = StateNotifierProvider<SwingNotifier, SwingState>((ref) {
  return SwingNotifier(AiSwingService());
});