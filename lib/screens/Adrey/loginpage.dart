import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:_3gx_application/screens/Adrey/signuppage.dart';
import 'package:_3gx_application/screens/Toby/side_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  Future<void> loginUser() async {
    const String url = "http://10.0.2.2/3GXInventory/php/login.php";

    Map<String, String> body = {
      "Uname": _unameController.text.trim(),
      "Pword": _pwordController.text.trim(),
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      String responseBody = response.body.trim();
      print("🔹 Raw Response: $responseBody");

      int jsonStart = responseBody.indexOf("{");
      if (jsonStart != -1) {
        responseBody = responseBody.substring(jsonStart);
      }

      final data = jsonDecode(responseBody);

      if (data["status"] == "success") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("✅ Login successful!")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavBar()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("❌ ${data["message"]}")),
        );
      }
    } catch (e) {
      print("⚠️ Network Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Network error: Could not connect to server")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWideScreen = constraints.maxWidth > 800;

          return SingleChildScrollView(
            child: Center(
              child: isWideScreen
                  ? Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.red[900],
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'lib/assets/Laptop.png',
                                  width: constraints.maxWidth * 0.35,
                                  height: constraints.maxHeight * 0.4,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Tabaco - Legazpi - Daet - Sorsogon',
                                  style: TextStyle(color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(child: _buildLoginForm(isWideScreen)),
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          color: Colors.red[900],
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Column(
                            children: [
                              Image.asset(
                                'lib/assets/Laptop.png',
                                width: constraints.maxWidth * 0.6,
                                height: 200,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Tabaco - Legazpi - Daet - Sorsogon',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        _buildLoginForm(isWideScreen),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoginForm(bool isWideScreen) {
    return Padding(
      padding: EdgeInsets.all(isWideScreen ? 50 : 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Column(
              children: [
                Text(
                  "Inventory Management",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Log in using your credentials.",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: _unameController,
            decoration: const InputDecoration(
              labelText: "Username",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _pwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: "Password",
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              suffixIcon: IconButton(
                icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: isWideScreen ? 300 : double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : loginUser,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Colors.red[900],
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Login",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen()),
                  );
                },
                child: const Text(
                  " Sign Up",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
