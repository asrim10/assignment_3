import 'package:flutter/material.dart';

import '../common/my_snackbar.dart';
import '../widgets/my_button.dart';
import '../widgets/my_text_form_field.dart';

class ArithmeticScreen extends StatefulWidget {
  const ArithmeticScreen({super.key});

  @override
  State<ArithmeticScreen> createState() => _ArithmeticScreen();
}

class _ArithmeticScreen extends State<ArithmeticScreen> {
  final TextEditingController firstController = TextEditingController(
    text: "1",
  );
  final TextEditingController secondController = TextEditingController(
    text: "1",
  );

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Arithmetic Operation',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Times New Roman",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTextFormField(
                text: "Enter first number",
                onChanged: (value) {
                  firstController.text = value;
                },
              ),
              const SizedBox(height: 10),

              MyTextFormField(
                text: "Enter second number",
                onChanged: (value) {
                  secondController.text = value;
                },
              ),
              const SizedBox(height: 15),

              MyButton(
                text: "SUM",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    int f = int.parse(firstController.text);
                    int s = int.parse(secondController.text);
                    int result = f + s;

                    showMySnackBar(context: context, message: "Sum = $result");
                  }
                },
              ),
              const SizedBox(height: 10),

              MyButton(
                text: "SUBTRACT",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    int f = int.parse(firstController.text);
                    int s = int.parse(secondController.text);
                    int result = f - s;

                    showMySnackBar(
                      context: context,
                      message: "Subtract = $result",
                    );
                  }
                },
              ),
              const SizedBox(height: 10),

              MyButton(
                text: "MULTIPLY",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    int f = int.parse(firstController.text);
                    int s = int.parse(secondController.text);
                    int result = f * s;

                    showMySnackBar(
                      context: context,
                      message: "Multiplication = $result",
                    );
                  }
                },
              ),
              const SizedBox(height: 10),

              MyButton(
                text: "DIVIDE",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    int f = int.parse(firstController.text);
                    int s = int.parse(secondController.text);
                    int result = f ~/ s;

                    showMySnackBar(
                      context: context,
                      message: "Division = $result",
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
