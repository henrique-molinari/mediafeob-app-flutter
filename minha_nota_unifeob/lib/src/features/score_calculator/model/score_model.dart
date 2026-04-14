class ScoreModel {
  // --- 1º Bimestre (B1) ---
  final double p1;
  final double aia1;
  final double atitudinal1;

  // --- 2º Bimestre (B2) ---
  final double p2;
  final double piValidacao;
  final double piApresentacao;
  final double piPresenca; // Novo campo: Presença na apresentação
  final double aia2;
  final double atitudinal2;

  ScoreModel({
    this.p1 = 0,
    this.aia1 = 0,
    this.atitudinal1 = 0,
    this.p2 = 0,
    this.piValidacao = 0,
    this.piApresentacao = 0,
    this.piPresenca = 0,
    this.aia2 = 0,
    this.atitudinal2 = 0,
  });

  // Cálculo do B1: Máximo 10.0
  double get totalB1 => p1 + aia1 + atitudinal1;
  
  // Cálculo do B2 Atualizado: 3.0 + 2.0 + 1.5 + 0.5 + 1.5 + 1.5 = 10.0
  double get totalB2 => 
      p2 + 
      piValidacao + 
      piApresentacao + 
      piPresenca + 
      aia2 + 
      atitudinal2;

  // Média Aritmética Simples
  double get average => (totalB1 + totalB2) / 2;

  // Critério de Aprovação da Instituição (Média 7.0)
  bool get isApproved => average >= 7.0;

  /// Calcula quantos pontos faltam no B2 para atingir a média 7.0.
  /// A fórmula deriva de: (B1 + B2) / 2 = 7.0  => B2 = 14.0 - B1.
  double quantoFaltaParaPassar() {
    double b2Necessario = 14.0 - totalB1;
    
    if (b2Necessario <= 0) return 0; // Já passou
    if (b2Necessario > 10) return b2Necessario; // Precisa de mais de 10 (Recuperação)
    
    return b2Necessario;
  }
}