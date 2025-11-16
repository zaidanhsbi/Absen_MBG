// lib/services/auth_service.dart
import 'package:absen_mbg/pages/admin/GuruPiketMainPage.dart';
import 'package:absen_mbg/pages/user/GuruPiketMainPage.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:absen_mbg/utils/colors/colors.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  void _showSnackbar(
    BuildContext context,
    String message, {
    bool isError = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? AppColor.danger : AppColor.success,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<bool> signIn(
    BuildContext context,
    String email,
    String password,
  ) async {
    print("$email");
    print("$password");
    try {
      if (email.isEmpty || password.isEmpty) {
        _showSnackbar(context, "Email/password tidak boleh kosong");
        return false;
      }

      final response = await supabase.auth.signInWithPassword(
        email: email.trim(),
        password: password,
      );

      if (response.user == null) {
        _showSnackbar(context, "Login gagal");
        return false;
      }

      final userId = response.user!.id;
      final userData = await supabase
          .from('user')
          .select('roles')
          .eq('id', userId)
          .single();

      final String role = userData['role'] ?? '';

      // Navigasi berdasarkan role
      if (role == 'guruPiket') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const GuruPiketMainPage()),
        );
        print("guru");
      } else if (role == 'seksiAbsensi') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const SeksiAbsensiMainPage()),
        );
        print("seksiAbsensi");
      } else {
        _showSnackbar(context, "Role tidak dikenali: $role");
        return false;
      }

      _showSnackbar(context, "Login berhasil!", isError: false);
      return true;
    } on AuthException catch (e) {
      String msg;
      if (e.message.contains('Invalid login credentials')) {
        msg = 'Email atau password salah!';
      } else if (e.message.contains('Email not confirmed')) {
        msg = 'Email belum dikonfirmasi!';
      } else {
        msg = e.message;
      }
      _showSnackbar(context, msg);
      return false;
} catch (e) {

  _showSnackbar(context, "Error detail: $e");
  return false;
}
  }
}
