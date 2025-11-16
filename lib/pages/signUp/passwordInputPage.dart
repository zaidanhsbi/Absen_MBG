import 'package:absen_mbg/pages/signUp/classesMajorsInputPage.dart';
import 'package:absen_mbg/pages/signin/signInPage.dart';
import 'package:flutter/material.dart';
import 'package:absen_mbg/utils/colors/colors.dart';
import 'package:absen_mbg/widgets/textField.dart';
import 'package:absen_mbg/widgets/primaryButton.dart';

class PasswordInputPage extends StatefulWidget {
  const PasswordInputPage({super.key});

  @override
  State<PasswordInputPage> createState() => _PasswordInputPageState();
}

class _PasswordInputPageState extends State<PasswordInputPage> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Judul
            const Text(
              "Password kamu apa?",
              style: TextStyle(
                fontSize: 28,
                fontFamily: "Montserrat",

                color: AppColor.darkText,
              ),
            ),
            const SizedBox(height: 8),
            // Subteks
            const Text(
              "Masukan password kamu ya.",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Montserrat",
                color: AppColor.darkText,
              ),
            ),
            const SizedBox(height: 32),

            // TextField
            CustomTextField(
              controller: _passwordController,
              hintText: "Password",
              icon: Icons.lock,
              height: 56,
              isPassword: true,
            ),
            const SizedBox(height: 32),

            // Tombol Berikutnya
            CustomButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SignInPage()));
              },
              text: "Berikutnya",
              height: 48,
              borderRadius: 24,
            ),
          ],
        ),
      ),
    );
  }
}