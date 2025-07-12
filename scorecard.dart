class Scorecard {
  final List<Hole> holes;

  Scorecard({required this.holes});
}

class Hole {
  final int par;
  final int strokes;

  Hole({required this.par, required this.strokes});
}