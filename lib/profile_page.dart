import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  String name = "";
  String? errorMsg;
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
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    // onChanged: (value) {
                    //   name = nameController.text;
                    //   setState(() {});
                    // },
                    // obscureText: true,
                    onFieldSubmitted: (value) {
                      setState(() {
                        errorMsg = null;
                        if (nameController.text.isEmpty) {
                          errorMsg = "Field is empty";
                        } else {
                          name = nameController.text;
                        }
                      });
                    },
                    decoration: InputDecoration(
                      errorText: errorMsg,
                      labelText: "Name",
                      hintText: "Enter Name...",
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
