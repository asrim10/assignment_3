import 'package:assignment_3/widgets/my_button.dart';
import 'package:assignment_3/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';

import '../common/my_snackbar.dart';

class AreaOfCircleScreen extends StatefulWidget {
  const AreaOfCircleScreen({super.key});

  @override
  State<AreaOfCircleScreen> createState() => _AreaOfCircleScreenState();
}

class _AreaOfCircleScreenState extends State<AreaOfCircleScreen> {
  final TextEditingController firstController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Area of Circle",
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
          // ✅ FIX: Added Form
          key: _formKey,
          child: Column(
            children: [
              MyTextFormField(
                text: "Enter Radius",
                onChanged: (value) {
                  firstController.text = value;
                },
              ),

              const SizedBox(height: 15),

              MyButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    double r = double.parse(firstController.text);
                    double result = 3.14 * r * r;

                    showMySnackBar(
                      context: context,
                      message: "Area of Circle = $result",
                    );
                  }
                },
                text: "Area of circle",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
