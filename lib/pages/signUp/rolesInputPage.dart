import 'package:absen_mbg/pages/signUp/nameInputPage.dart';
import 'package:absen_mbg/widgets/primaryButton.dart';
import 'package:flutter/material.dart';
import 'package:absen_mbg/utils/colors/colors.dart';

class RolesInputPages extends StatelessWidget {
  const RolesInputPages({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          children: [
            // Bagian atas: teks + jarak
            const Spacer(flex: 1),
            const Text(
              "Pilih sebagai siapa\nAnda masuk",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.w400,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 60),
            const Spacer(flex: 1),
            // Button di tengah
            CustomButton(
              text: "Guru Piket",
              onPressed: () {
                Navigator.push(
                 context,
                 MaterialPageRoute(builder: (_) => const NameInputPage()),
                );
              },
            ),
            const SizedBox(height: 14),
            CustomButton(
              text: "Seksi Absensi",
              onPressed: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (_) => const NameInputPage()),
                );
              },
            ),

            const Spacer(flex: 3), // Dorong konten ke atas dari bawah
          ],
        ),
      ),
    );
  }
}