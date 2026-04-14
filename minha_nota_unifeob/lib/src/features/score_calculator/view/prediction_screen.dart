import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/calculator_view_model.dart';
import '../widgets/score_input_field.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CalculatorViewModel>();
    final distribuicao = viewModel.distribuicaoIdealB2;
    final faltaTotal = viewModel.score.quantoFaltaParaPassar();

    return Scaffold(
      appBar: AppBar(title: const Text('Plano de Aprovação')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Insira suas notas atuais do B1:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            ScoreInputField(label: 'P1', onChanged: viewModel.updateP1),
            ScoreInputField(label: 'AIA 1', onChanged: viewModel.updateAia1),
            ScoreInputField(label: 'Atitudinal 1', onChanged: viewModel.updateAtitudinal1),
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Divider(),
            ),

            if (faltaTotal > 0) ...[
               Text(
                'Para passar, você precisa de ${faltaTotal.toStringAsFixed(1)} no B2.',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
              const SizedBox(height: 10),
              const Text('Sugestão de distribuição equilibrada:'),
              const SizedBox(height: 15),
              
              // Gerando os cards de meta para cada nota
              ...distribuicao.entries.map((e) => Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: const Icon(Icons.star, color: Colors.amber),
                  title: Text(e.key),
                  trailing: Text(
                    e.value.toStringAsFixed(2),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              )).toList(),
            ] else if (viewModel.score.totalB1 > 0) ...[
              const Center(
                child: Text('🎉 Você já atingiu a pontuação necessária!', 
                style: TextStyle(color: Colors.green, fontSize: 18, fontWeight: FontWeight.bold)),
              )
            ],
          ],
        ),
      ),
    );
  }
}