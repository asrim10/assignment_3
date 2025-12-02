import 'package:assignment_3/widgets/my_text_form_field.dart';
import 'package:flutter/material.dart';
import '../common/my_snackbar.dart';
import '../widgets/my_button.dart';


class PalindromeScreen extends StatefulWidget {
  const PalindromeScreen({super.key});

  @override
  State<PalindromeScreen> createState() => _PalindromeScreenState();
}

class _PalindromeScreenState extends State<PalindromeScreen> {
  final TextEditingController numController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isPalindrome(int n) {
    int original = n;
    int rev = 0;

    while (n > 0) {
      rev = rev * 10 + n % 10;
      n ~/= 10;
    }
    return original == rev;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Palindrome Number",
          style: TextStyle(
            color: Colors.greenAccent,
            fontSize: 20,
            fontFamily: "Times New Roman",
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTextFormField(
                text: "Enter Number",
                onChanged: (value) {
                  numController.text = value;
                },
              ),

              const SizedBox(height: 15),

              MyButton(
                text: "Check Palindrome",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    int number = int.parse(numController.text);
                    bool pal = isPalindrome(number);

                    showMySnackBar(
                      context: context,
                      message: pal
                          ? "$number is a Palindrome"
                          : "$number is NOT a Palindrome",
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
