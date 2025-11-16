import 'package:absen_mbg/pages/signUp/emailnputPage.dart';
import 'package:flutter/material.dart';
import 'package:absen_mbg/utils/colors/colors.dart';
import 'package:absen_mbg/widgets/primaryButton.dart';

class ClassMajorInputPage extends StatefulWidget {
  const ClassMajorInputPage({super.key});

  @override
  State<ClassMajorInputPage> createState() => _ClassMajorInputPageState();
}

class _ClassMajorInputPageState extends State<ClassMajorInputPage> {
  String? _selectedClass;
  String? _selectedClassGroup;
  String? _selectedMajor;

  // Data contoh — ganti sesuai kebutuhan
  final List<String> _classes = ['X', 'XI', 'XII'];
  final List<String> _classGroup = ['1', '2', '3'];
  final List<String> _majors = [
    'Rekayasa Perangkat Lunak',
    'Teknik Komputer dan Jaringan',
  ];

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
              "Kelas dan Jurusan kamu apa?",
              style: TextStyle(
                fontSize: 28,
                fontFamily: "Montserrat",
                color: AppColor.darkText,
              ),
            ),
            const SizedBox(height: 8),

            // Subteks
            const Text(
              "Masukan kelas dan jurusan kamu ya.",
              style: TextStyle(
                fontSize: 16,
                fontFamily: "Montserrat",
                color: AppColor.darkText,
              ),
            ),
            const SizedBox(height: 32),

            // Dropdown Kelas
            _buildDropdown(
              hint: "Kelas",
              icon: Icons.school_outlined,
              value: _selectedClass,
              items: _classes,
              onChanged: (value) {
                setState(() {
                  _selectedClass = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // Dropdown Jurusan
            _buildDropdown(
              hint: "Rombel",
              icon: Icons.format_list_numbered,
              value: _selectedClassGroup,
              items: _classGroup,
              onChanged: (value) {
                setState(() {
                  _selectedClassGroup = value;
                });
              },
            ),
            const SizedBox(height: 16),

            _buildDropdown(
              hint: "Jurusan",
              icon: Icons.book_outlined,
              value: _selectedMajor,
              items: _majors,
              onChanged: (value) {
                setState(() {
                  _selectedMajor = value;
                });
              },
            ),
            const SizedBox(height: 32),

            // Tombol Berikutnya
            CustomButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => EmailInputPage()));
                
                },
              // (_selectedClass != null && _selectedMajor != null)
              //       ? () {
              //           // Navigate to next page
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(builder: (_) => const NextPage()),
              //           );
              //         }
              //       : null,
              text: "Berikutnya",
              height: 48,
              borderRadius: 24,
            ),
          ],
        ),
      ),
    );
  }

 
  Widget _buildDropdown({
    required String hint,
    required IconData icon,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {

    if (items.isEmpty) {
      return _buildEmptyDropdown(hint, icon);
    }

    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        hint: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            hint,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
        ),
        icon: const Padding(
          padding: EdgeInsets.only(right: 12),
          child: Icon(Icons.keyboard_arrow_down, color: AppColor.icon),
        ),
        dropdownColor: AppColor.surface,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 6),
            child: Icon(icon, color: AppColor.icon),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 16,
          ),
        ),
        items: items.map((item) {
          return DropdownMenuItem(
            value: item,
            child: Text(
              item,
              style: const TextStyle(fontSize: 14, fontFamily: "Montserrat"),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        isExpanded: true,
      ),
    );
  }

  // Helper: Dropdown kosong
  Widget _buildEmptyDropdown(String hint, IconData icon) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColor.surface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColor.icon),
          const SizedBox(width: 12),
          Text(
            "Tidak ada $hint",
            style: TextStyle(color: Colors.grey[600], fontSize: 14),
          ),
        ],
      ),
    );
  }
}

