import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/calculator_view_model.dart';
import '../widgets/score_input_field.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Escutando as mudanças na ViewModel
    final viewModel = context.watch<CalculatorViewModel>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Fundo neutro e limpo
      appBar: AppBar(
        title: const Text(
          'Minha Nota UNIFEOB',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cabeçalho de Resultado Dinâmico
            _buildResultHeader(viewModel),

            const SizedBox(height: 10),

            // Seção 1º Bimestre
            _buildSectionTitle('1º Bimestre (B1)', Icons.looks_one, context),
            ScoreInputField(
              label: 'Prova 1 (P1) - Máx 7.0',
              onChanged: viewModel.updateP1,
            ),
            ScoreInputField(
              label: 'AIA 1 - Máx 1.5',
              onChanged: viewModel.updateAia1,
            ),
            ScoreInputField(
              label: 'Atitudinais 1 - Máx 1.5',
              onChanged: viewModel.updateAtitudinal1,
            ),

            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),

            // Seção 2º Bimestre
            _buildSectionTitle('2º Bimestre (B2)', Icons.looks_two, context),
            ScoreInputField(
              label: 'Prova 2 (P2) - Máx 4.0',
              onChanged: viewModel.updateP2,
            ),
            ScoreInputField(
              label: 'Validação PI - Máx 1.5',
              onChanged: viewModel.updatePiValidacao,
            ),
            ScoreInputField(
              label: 'Apresentação PI - Máx 1.5',
              onChanged: viewModel.updatePiApresentacao,
            ),
            ScoreInputField(
              label: 'AIA 2 - Máx 1.5',
              onChanged: viewModel.updateAia2,
            ),
            ScoreInputField(
              label: 'Atitudinais 2 - Máx 1.5',
              onChanged: viewModel.updateAtitudinal2,
            ),
            
            const SizedBox(height: 40), // Espaçamento extra para o scroll
          ],
        ),
      ),
    );
  }

  // Componente de Cabeçalho de Resultado
  Widget _buildResultHeader(CalculatorViewModel viewModel) {
    final b2Necessario = viewModel.score.quantoFaltaParaPassar();
    final isPossible = b2Necessario <= 10.0;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: viewModel.statusColor, width: 2),
      ),
      child: Column(
        children: [
          const Text(
            'MÉDIA ATUAL',
            style: TextStyle(color: Colors.white70, fontSize: 12, letterSpacing: 1.2),
          ),
          Text(
            viewModel.score.average.toStringAsFixed(1),
            style: const TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            viewModel.resultMessage.toUpperCase(),
            style: TextStyle(color: viewModel.statusColor, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(color: Colors.white24, indent: 40, endIndent: 40),
          ),
          Text(
            isPossible 
              ? 'VOCÊ PRECISA DE ${b2Necessario.toStringAsFixed(1)} NO B2'
              : 'SITUAÇÃO CRÍTICA: NECESSÁRIO > 10.0',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isPossible ? const Color(0xFFFFD700) : Colors.redAccent,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // Helper para títulos de seção
  Widget _buildSectionTitle(String title, IconData icon, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).primaryColor),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}