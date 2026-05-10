import 'package:flutter/material.dart';

class EpicLoginPage extends StatefulWidget {
  const EpicLoginPage({super.key});

  @override
  State<EpicLoginPage> createState() => _EpicLoginPageState();
}

class _EpicLoginPageState extends State<EpicLoginPage> {
  bool _isExpanded = false;
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    // Trigger the animation after a small delay
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _isExpanded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. DYNAMIC BACKGROUND
          AnimatedContainer(
            duration: const Duration(seconds:4) ,
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: _isExpanded ? Alignment.topLeft : Alignment.bottomRight,
                end: _isExpanded ? Alignment.bottomRight : Alignment.topLeft,
                colors: const [Color(0xFF6A11CB), Color(0xFF2575FC)],
              ),
            ),
            onEnd: () => setState(() => _isExpanded = !_isExpanded),
          ),

          // 2. THE MAIN CONTENT
          Center(
            child: SingleChildScrollView(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInBack,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                padding: const EdgeInsets.all(30),
                width: 400,
                // The "Glass" Effect
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.lock_person_rounded, size: 80, color: Colors.white),
                    const SizedBox(height: 10),
                    const Text(
                      "WELCOME",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Email Field
                    _buildTextField(
                      label: "Email",
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    _buildTextField(
                      label: "Password",
                      icon: Icons.lock_outline,
                      isPassword: true,
                    ),

                    const SizedBox(height: 40),

                    // EPIC LOGIN BUTTON
                    InkWell(
                      onTap: () {},
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, 4),
                              blurRadius: 10,
                            )
                          ],
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Color(0xFF2575FC),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required String label, required IconData icon, bool isPassword = false}) {
    return TextField(
      obscureText: isPassword && !_isPasswordVisible,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Colors.white70),
          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.white),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.05),
      ),
    );
  }
}