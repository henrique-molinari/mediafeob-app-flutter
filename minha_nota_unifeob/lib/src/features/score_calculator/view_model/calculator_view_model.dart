import 'package:flutter/material.dart';
import '../model/score_model.dart';

class CalculatorViewModel extends ChangeNotifier {
  // Estado interno para o 1º Bimestre
  double _p1 = 0;
  double _aia1 = 0;
  double _atitudinal1 = 0;

  // Estado interno para o 2º Bimestre
  double _p2 = 0;
  double _piValidacao = 0;
  double _piApresentacao = 0;
  double _aia2 = 0;
  double _atitudinal2 = 0;

  // Getters para a View ler os dados processados pelo Model
  ScoreModel get score => ScoreModel(
        p1: _p1,
        aia1: _aia1,
        atitudinal1: _atitudinal1,
        p2: _p2,
        piValidacao: _piValidacao,
        piApresentacao: _piApresentacao,
        aia2: _aia2,
        atitudinal2: _atitudinal2,
      );

  // --- Lógica de Projeção Equitativa ---
  
  /// Calcula a sugestão de notas para o B2 baseada na necessidade do aluno.
  /// Divide o esforço proporcionalmente entre os pesos de cada atividade.
  Map<String, double> get distribuicaoIdealB2 {
    double falta = score.quantoFaltaParaPassar();
    
    // Se o aluno já passou ou precisa de 0, retornamos tudo zerado
    if (falta <= 0) return {};

    // O B2 total vale 10.0 pontos. Calculamos a razão de esforço (0.0 a 1.0).
    // Se falta 7.0, a razão é 0.7 (ele precisa de 70% de cada nota).
    double razao = falta / 10.0;

    return {
      'Prova (P2)': 4.0 * razao,
      'Validação PI': 1.5 * razao,
      'Apresentação PI': 1.5 * razao,
      'AIA 2': 1.5 * razao,
      'Atitudinal 2': 1.5 * razao,
    };
  }

  // --- Métodos de Atualização (Setters) ---

  void updateP1(String value) {
    _p1 = _parseValue(value);
    notifyListeners();
  }

  void updateAia1(String value) {
    _aia1 = _parseValue(value);
    notifyListeners();
  }

  void updateAtitudinal1(String value) {
    _atitudinal1 = _parseValue(value);
    notifyListeners();
  }

  void updateP2(String value) {
    _p2 = _parseValue(value);
    notifyListeners();
  }

  void updatePiValidacao(String value) {
    _piValidacao = _parseValue(value);
    notifyListeners();
  }

  void updatePiApresentacao(String value) {
    _piApresentacao = _parseValue(value);
    notifyListeners();
  }

  void updateAia2(String value) {
    _aia2 = _parseValue(value);
    notifyListeners();
  }

  void updateAtitudinal2(String value) {
    _atitudinal2 = _parseValue(value);
    notifyListeners();
  }

  // Helper para tratar a entrada de texto e evitar crashes
  double _parseValue(String value) {
    return double.tryParse(value.replaceAll(',', '.')) ?? 0.0;
  }

  // Helpers de UI para cores e mensagens
  String get resultMessage => score.isApproved 
      ? "Você está Aprovado! 🎉" 
      : "Você está de Recuperação. 📝";

  Color get statusColor => score.isApproved ? Colors.green : Colors.red;
}