import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan/controller/calculator_controller.dart';
import 'package:latihan/controller/bottom_nav_controller.dart'; 
import 'package:latihan/pages/contact_page.dart';
import 'package:latihan/pages/profile_page.dart';
import 'package:latihan/binding/contact_binding.dart'; // Import ContactBinding

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController calculatorController = Get.find();
  
  final BottomNavController bottomNavController = Get.put(
    BottomNavController(),
  );

  // Helper Widget untuk Item di Drawer
  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required Widget page,
  }) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF2D3748)),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      onTap: () {
        // Tutup Drawer
        Get.back(); 
        
        // PENTING: Jika halaman yang dituju adalah ContactPage, kita HARUS 
        // menyertakan binding agar ContactController dan DBHelper terinisialisasi.
        if (page is ContactPage) {
          Get.to(() => page, binding: ContactBinding());
        } else {
          // Untuk halaman lain (misalnya ProfilePage), navigasi biasa.
          Get.to(() => page);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Color(0xFF1A202C),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1, 
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF4A5568)),
      ),
      
      // =============== START: DRAWER IMPLEMENTATION ===============
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Header Drawer
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 69, 71, 70),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.widgets_outlined, size: 40, color: Colors.white), // Ubah warna ikon agar terlihat
                  SizedBox(height: 8),
                  Text(
                    'App Navigation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            
            // Menu Item 1: Calculator (Kembali ke halaman ini)
            ListTile(
              leading: const Icon(Icons.calculate_outlined, color: Color(0xFF2D3748)),
              title: const Text('Calculator', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2D3748))),
              onTap: () {
                // Tutup Drawer dan pastikan kita berada di halaman ini
                Get.back(); 
              },
            ),
            
            // Menu Item 2: Contact List
            _buildDrawerItem(
              icon: Icons.people_outline,
              title: 'Contact List',
              // Pastikan ini adalah const ContactPage() jika widget-nya StatelessWidget/StatefulWidget
              page: const ContactPage(), 
            ),

            // Menu Item 3: Profile
            _buildDrawerItem(
              icon: Icons.person_outline,
              title: 'Profile',
              page: ProfilePage(), 
            ),
          ],
        ),
      ),
      // =============== END: DRAWER IMPLEMENTATION ===============
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Input Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Isi Nomor",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      controller: calculatorController.numberOneController,
                      hint: "Isi Nomor Pertama",
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      controller: calculatorController.numberTwoController,
                      hint: "Isi Nomor Kedua",
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Pilih Operasi",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2D3748),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildOperationButtons(),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Result Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withOpacity(0.06),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calculate_outlined,
                          color: Colors.grey[600],
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Result",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF2D3748),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF8F9FA),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                          width: 1,
                        ),
                      ),
                      child: Obx(() {
                        return Text(
                          calculatorController.result.value.isEmpty
                              ? "Tidak Ada Penjumlahan"
                              : calculatorController.result.value,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: calculatorController.result.value.isEmpty
                                ? const Color(0xFF718096)
                                : const Color(0xFF2D3748),
                          ),
                          textAlign: TextAlign.center,
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets dan Functions ---

  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xFF718096),
          fontWeight: FontWeight.w500,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color.fromARGB(255, 63, 66, 68), width: 1.5),
        ),
        filled: true,
        fillColor: const Color(0xFFF8F9FA),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xFF2D3748),
      ),
    );
  }

  Widget _buildOperationButtons() {
    return Column(
      children: [
        // First Row of Buttons
        Row(
          children: [
            Expanded(
              child: _buildOperationButton(
                text: "+",
                color: const Color.fromARGB(255, 69, 71, 70),
                onPressed: () => _calculate("+"),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildOperationButton(
                text: "-",
                color: const Color.fromARGB(255, 69, 71, 70),
                onPressed: () => _calculate("-"),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Second Row of Buttons
        Row(
          children: [
            Expanded(
              child: _buildOperationButton(
                text: "×",
                color: const Color.fromARGB(255, 69, 71, 70),
                onPressed: () => _calculate("*"),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildOperationButton(
                text: "÷",
                color: const Color.fromARGB(255, 69, 71, 70),
                onPressed: () => _calculate("/"),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOperationButton({
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        child: Text(text),
      ),
    );
  }

  void _calculate(String operation) {
    calculatorController.calculate(
      operation,
      calculatorController.numberOneController.text,
      calculatorController.numberTwoController.text,
    );
  }
}
