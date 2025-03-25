import 'package:_3gx_application/screens/Adrey/loginpage.dart';
import 'package:_3gx_application/screens/Adrey/signuppage.dart';
import 'package:flutter/material.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.red[900],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'lib/assets/Laptop.png',
                        width: 400,
                        height: 300,
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Tabaco - Legazpi - Daet - Sorsogon',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Inventory Management",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A62B7),
                        fixedSize: const Size(300, 50)),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A62B7),
                        fixedSize: const Size(300, 50)),
                    child: const Text(
                      'Signup',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
