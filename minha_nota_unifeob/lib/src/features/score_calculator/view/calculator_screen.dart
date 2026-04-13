import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/calculator_view_model.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CalculatorViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Minha Nota UNIFEOB')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle('1º Bimestre (B1)', context),
            _buildInputField('P1 (Máx 7.0)', viewModel.updateP1),
            _buildInputField('AIA 1 (Máx 1.5)', viewModel.updateAia1),
            _buildInputField('Atitudinal 1 (Máx 1.5)', viewModel.updateAtitudinal1),
            
            const Divider(height: 40),

            _buildSectionTitle('2º Bimestre (B2)', context),
            _buildInputField('P2 (Máx 4.0)', viewModel.updateP2),
            _buildInputField('Validação PI (Máx 1.5)', viewModel.updatePiValidacao),
            _buildInputField('Apres. PI (Máx 1.5)', viewModel.updatePiApresentacao),
            _buildInputField('AIA 2 (Máx 1.5)', viewModel.updateAia2),
            _buildInputField('Atitudinal 2 (Máx 1.5)', viewModel.updateAtitudinal2),

            const SizedBox(height: 30),

            // Card de Resultado
            Card(
              color: viewModel.statusColor.withOpacity(0.1),
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: viewModel.statusColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Média Final: ${viewModel.score.average.toStringAsFixed(1)}',
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    Text(viewModel.resultMessage,
                        style: TextStyle(fontSize: 18, color: viewModel.statusColor, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    Text('Necessário no B2: ${viewModel.score.quantoFaltaParaPassar().toStringAsFixed(1)}',
                        style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildInputField(String label, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          filled: true,
          fillColor: Colors.grey[50],
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: onChanged,
      ),
    );
  }
}