import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/scorecard.dart';

class ScorecardNotifier extends StateNotifier<Scorecard> {
  ScorecardNotifier() : super(Scorecard(holes: List.generate(18, (_) => Hole(par: 4, strokes: 0))));

  void addStroke(int holeIndex) {
    final newHoles = List<Hole>.from(state.holes);
    newHoles[holeIndex] = Hole(par: newHoles[holeIndex].par, strokes: newHoles[holeIndex].strokes + 1);
    state = Scorecard(holes: newHoles);
  }
}

final scorecardProvider = StateNotifierProvider<ScorecardNotifier, Scorecard>((ref) {
  return ScorecardNotifier();
});