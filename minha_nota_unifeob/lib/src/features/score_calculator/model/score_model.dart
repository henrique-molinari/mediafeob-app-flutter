class ScoreModel {
  // 1º Bimestre
  final double p1;
  final double aia1;
  final double atitudinal1;

  // 2º Bimestre
  final double p2;
  final double piValidacao;
  final double piApresentacao;
  final double aia2;
  final double atitudinal2;

  ScoreModel({
    this.p1 = 0, this.aia1 = 0, this.atitudinal1 = 0,
    this.p2 = 0, this.piValidacao = 0, this.piApresentacao = 0,
    this.aia2 = 0, this.atitudinal2 = 0,
  });

  double get totalB1 => p1 + aia1 + atitudinal1;
  
  double get totalB2 => p2 + piValidacao + piApresentacao + aia2 + atitudinal2;

  double get average => (totalB1 + totalB2) / 2;

  bool get isApproved => average >= 7.0;

  // A "Mágica" do quanto falta:
  double quantoFaltaParaPassar() {
    // Se (B1 + B2) / 2 = 7, então B2 precisa ser (14 - B1)
    double b2Necessario = 14.0 - totalB1;
    return b2Necessario > 0 ? b2Necessario : 0;
  }
}