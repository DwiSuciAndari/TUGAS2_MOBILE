import 'package:flutter/material.dart';
import 'menu_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final users = {
    "Cece": "011",
    "Celsi": "015",
    "Alma": "101",
    "Suci": "192"
  };

  void login() {

    String user = usernameController.text;
    String pass = passwordController.text;

    if (users[user] == pass) {

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const MenuPage()),
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Username atau Password salah")),
      );

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xfff2f2f2),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              const Text(
                "Login",
                style: TextStyle(
                  fontFamily: "Audiowide",
                  fontSize: 42,
                  color: Color(0xffe63b8f),
                ),
              ),

              const SizedBox(height: 5),
          const Text(
                "Tugas Kelompok Pemrograman",
                style: TextStyle(
                  fontFamily: "Audiowide",
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const Text(
                "MOBILE IF-B",
                style: TextStyle(
                  fontFamily: "Audiowide",
                  fontSize: 14,
                  color: Color.fromARGB(255, 0, 188, 212),
                ),
              ),

              const SizedBox(height: 40),

              TextField(
                controller: usernameController,

                decoration: InputDecoration(
                  hintText: "Username",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.cyan),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: true,

                decoration: InputDecoration(
                  hintText: "Password",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.cyan),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffe63b8f),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),

                  onPressed: login,

                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontFamily: "Audiowide",
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}