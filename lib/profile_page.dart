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

  String name = "";
  String? errorMsg;
  String? errorPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProfilePage"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Card(
            color: const Color.fromARGB(255, 172, 193, 204),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InputField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    label: "Name",
                    hint: "Enter Name",
                    icon: Icons.person,
                    errorText: errorMsg,
                  ),
                  SizedBox(height: 20),
                  InputField(
                    controller: passController,
                    keyboardType: TextInputType.visiblePassword,
                    label: "Password",
                    hint: "Enter Password",
                    icon: Icons.lock,
                    errorText: errorPass,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        errorMsg = null;
                        if (nameController.text.isEmpty) {
                          errorMsg = "Field is empty";
                        } else {
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
    );
  }
}
