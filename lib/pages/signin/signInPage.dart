import 'package:absen_mbg/controllers/authSignInController.dart';
import 'package:absen_mbg/pages/signUp/rolesInputPage.dart';
import 'package:absen_mbg/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:absen_mbg/utils/colors/colors.dart';
import '../../widgets/textField.dart';
import 'package:absen_mbg/utils/convertSize.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Logo
                Image.asset(
                  "assets/images/logoMBG.png",
                  width: 129,
                  height: 132,
                ),

                const SizedBox(height: 110),

                CustomTextField(
                  controller: _emailController,
                  hintText: "Masukan Email",
                  icon: Icons.email,
                ),

                const SizedBox(height: 8),

                CustomTextField(
                  controller: _passwordController,
                  hintText: "Masukkan password",
                  icon: Icons.lock,
                  isPassword: true,
                ),

                const SizedBox(height: 24),

                /// Tombol Login
                CustomButton(onPressed: () {AuthService().signIn(context, _emailController.text, _passwordController.text);}, text: "Login"),
                const SizedBox(height: 39),

                /// Daftar Akun
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Belum punya akun?",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 13,
                        color: AppColor.darkText,
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RolesInputPages(),
                          ),
                        );
                      },
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
