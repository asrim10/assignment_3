import 'package:assignment_3/common/my_snackbar.dart';
import 'package:assignment_3/widgets/my_button.dart';
import 'package:assignment_3/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';

class SimpleInterestScreen extends StatefulWidget {
  const SimpleInterestScreen({super.key});

  @override
  State<SimpleInterestScreen> createState() => _SimpleInterestScreenState();
}

class _SimpleInterestScreenState extends State<SimpleInterestScreen> {
  final TextEditingController principalController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController rateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Simple Interest Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Times New Roman",
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTextFormField(
                onChanged: (value) {
                  principalController.text = value;
                },
                text: "Enter Principle",
              ),
              SizedBox(height: 15),
              MyTextFormField(
                onChanged: (value) {
                  timeController.text = value;
                },
                text: "Enter time",
              ),
              SizedBox(height: 15),

              MyTextFormField(
                onChanged: (value) {
                  rateController.text = value;
                },
                text: "Enter rate",
              ),
              SizedBox(height: 15),
              MyButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    double p = double.parse(principalController.text);
                    double t = double.parse(timeController.text);
                    double r = double.parse(rateController.text);
                    double result = (p * t * r) / 100;

                    showMySnackBar(
                      context: context,
                      message: "Simple Interest = $result",
                    );
                  }
                },
                text: "Simple Interest",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
