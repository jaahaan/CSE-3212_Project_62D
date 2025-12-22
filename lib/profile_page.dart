import 'package:flutter/material.dart';
import 'package:project_62d/home_page.dart';
import 'package:project_62d/widgets/input_field.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          width: 300,
          child: Card(
            color: const Color.fromARGB(255, 172, 193, 204),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                // autovalidateMode: AutovalidateMode.onUnfocus,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InputField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      label: "Name",
                      hint: "Enter Name",
                      icon: Icons.person,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field is empty!!";
                        } else if (!RegExp(
                          r"^[A-Za-z \.]{3,}$",
                        ).hasMatch(value)) {
                          return "Invalid Format!!";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    InputField(
                      controller: passController,
                      keyboardType: TextInputType.visiblePassword,
                      label: "Password",
                      hint: "Enter Password",
                      icon: Icons.lock,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field is empty!!";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_formKey.currentState!.validate()) {
                            name = nameController.text;
                          }
                        });
                      },
                      child: Text("Submit"),
                    ),
                    SizedBox(height: 20),
                    Text("Name is: $name"),
                    SizedBox(height: 20),

                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      child: Text("Homepage"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
