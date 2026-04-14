import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScoreInputField extends StatelessWidget {
  final String label;
  final Function(String) onChanged;

  const ScoreInputField({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black87),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: const Icon(Icons.edit_note, color: Colors.grey),
        ),
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          // Garante que o usuário só digite números e um ponto/vírgula
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
        ],
        onChanged: onChanged,
      ),
    );
  }
}