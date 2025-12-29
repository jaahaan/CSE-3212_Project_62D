import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_62d/converter_page.dart';
import 'package:project_62d/note_page.dart';
import 'package:project_62d/profile_page.dart';
import 'package:project_62d/stateful_widget_page.dart';
import 'package:project_62d/stateless_widget_page.dart';
import 'package:project_62d/upload_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _supabase = Supabase.instance.client;

  Future<Map<String, dynamic>?> getCurrentUser() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return null;
    final res =
        await _supabase.from('profiles').select().eq('id', user.id).single();
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.home),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.greenAccent,
        title: Text("My Flutter Project"),
        actions: [
          IconButton(
            onPressed: () {
              _supabase.auth.signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: "Add",
        elevation: 50,
        child: Icon(Icons.add),
      ),
      drawer: NavigationDrawer(
        children: [
          DrawerHeader(
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              accountName: Text("Name"),
              accountEmail: Text("Email"),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.home),
            title: Text("HomePage"),
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage();
                  },
                ),
              );
            },
            leading: Icon(Icons.person),
            title: Text("ProfilePage"),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to homepage",
              style: GoogleFonts.lobster(textStyle: TextStyle(fontSize: 30)),
            ),
            FutureBuilder(
              future: getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Text("Error ${snapshot.error}");
                }
                if (!snapshot.hasData) {
                  return const Text("No User Found!!");
                }
                final profile = snapshot.data as Map<String, dynamic>;
                return SizedBox(
                  width: 300,
                  height: 300,
                  child: Card(
                    color: Colors.blueGrey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (profile['avatar_url'] != null)
                          Image.network(
                            profile['avatar_url'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),

                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return UploadPage();
                                },
                              ),
                            );
                          },

                          child: Text("Upload Image"),
                        ),
                        SizedBox(height: 10),
                        Text("Name: ${profile['name']}"),
                        SizedBox(height: 10),
                        Text("Email: ${profile['email']}"),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                );
              },
            ),
            Image.asset('assets/images/flutter.png', height: 50),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return NotePage();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      fixedSize: Size(150, 20),
                    ),
                    child: Text("Note Page"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ConverterPage();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      fixedSize: Size(150, 20),
                    ),
                    child: Text("ConverterPage"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return StatefulWidgetPage();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      fixedSize: Size(150, 20),
                    ),
                    child: Text("Stateful"),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return StatelessWidgetPage();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      foregroundColor: Colors.white,
                      fixedSize: Size(150, 20),
                    ),
                    child: Text("Stateless"),
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              width: 350,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [Colors.brown, Colors.brown.shade200],
                // ),
                border: Border.all(color: Colors.red, width: 5),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            SizedBox(
              height: 200,
              width: 300,
              child: Card(color: Colors.blueGrey),
            ),
            SizedBox(height: 20),

            Image.asset(
              'assets/images/images.jpeg',
              height: 400,
              fit: BoxFit.fill,
            ),
            Image.network(
              'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&q=60&w=500',
            ),
          ],
        ),
      ),
    );
  }
}
