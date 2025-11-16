import 'package:absen_mbg/pages/signUp/classesMajorsInputPage.dart';
import 'package:flutter/material.dart';
import 'package:absen_mbg/utils/colors/colors.dart';
import 'package:absen_mbg/widgets/textField.dart';
import 'package:absen_mbg/widgets/primaryButton.dart';

class NameInputPage extends StatefulWidget {
  const NameInputPage({super.key});

  @override
  State<NameInputPage> createState() => _NameInputPageState();
}

class _NameInputPageState extends State<NameInputPage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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
              "Siapa nama Kamu?",
              style: TextStyle(
                fontSize: 28,
                fontFamily: "Montserrat",

                color: AppColor.darkText,
              ),
            ),
            const SizedBox(height: 8),
            // Subteks
            const Text(
              "Masukan nama kamu ya.",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Montserrat",
                color: AppColor.darkText,
              ),
            ),
            const SizedBox(height: 32),

            // TextField
            CustomTextField(
              controller: _nameController,
              hintText: "Nama",
              icon: Icons.person_outline,
              height: 56,
            ),
            const SizedBox(height: 32),

            // Tombol Berikutnya
            CustomButton(
              onPressed: () {
                // TODO: Navigate to next page
                Navigator.push(context, MaterialPageRoute(builder: (_) => ClassMajorInputPage()));
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