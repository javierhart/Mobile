import 'package:flutter/material.dart';

void main() {
  runApp(MyProfilApp());
}

class MyProfilApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY PROFIL',
      debugShowCheckedModeBanner: false,
      home: ProfilPage(),
    );
  }
}

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  bool sudahFollow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("MY PROFIL", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // biar tidak overflow
          child: Column(
            children: [
              // Bagian atas: foto profil + tombol follow
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.blueAccent,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          sudahFollow = !sudahFollow;
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              sudahFollow
                                  ? "Sekarang kamu rakyat dari King Javier ✅"
                                  : "NOOO MY RAKYATTT ❌",
                            ),
                            duration: Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: sudahFollow
                            ? Colors.green
                            : Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                      ),
                      child: Text(
                        sudahFollow ? "Following ✅" : "Follow dong",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Biodata singkat
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "Halo, Saya Adithya Javier Hartono 👋",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Saya anak kampus yang demen banget sama fotografi 📸 "
                        "terus suka juga nonton drachin, drakor, sama donghua 🎬",
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              // Info kontak
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.blueAccent),
                  title: Text("Javier@example.com"),
                  subtitle: Text("Kontak emailku ✉️"),
                ),
              ),

              // Bagian bawah: hobi
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Hobi nih:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      children: [
                        Chip(
                          label: Text("📷 Foto"),
                          backgroundColor: Colors.yellowAccent,
                        ),
                        Chip(
                          label: Text("💻 Ngoding"),
                          backgroundColor: Colors.greenAccent,
                        ),
                        Chip(
                          label: Text("🍿 Nonton"),
                          backgroundColor: Colors.pinkAccent,
                        ),
                        Chip(
                          label: Text("🍳 Masak"),
                          backgroundColor: Colors.purpleAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Footer copyright
              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  "© 2025 King Javier Profile 👑",
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}