import 'package:flutter/material.dart';
import 'package:flutter_application_2/Bookmarkcalendar/Bookmarkpage/Index.dart';
import 'package:flutter_application_2/pages/pages.dart';
import 'package:flutter_application_2/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sky Wallet',
                    style:
                        textTextStyle.copyWith(fontSize: 50, fontWeight: bold)),
                SizedBox(height: 11),
                Text(
                  'Yuk, Catat Keuanganmu sehari-hari',
                  style: secondaryTextStyle.copyWith(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 64,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Username',
                      style: textTextStyle.copyWith(
                          fontSize: 12, fontWeight: bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                            width: 3, color: Color.fromARGB(255, 77, 53, 228)),
                        color: whiteColor,
                      ),
                      child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 17))),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Password',
                      style: textTextStyle.copyWith(
                          fontSize: 12, fontWeight: bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        border: Border.all(
                            width: 3, color: Color.fromARGB(255, 77, 53, 228)),
                        color: whiteColor,
                      ),
                      child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 17),
                              suffixIcon: Icon(Icons.visibility_rounded))),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(),
                    Text(
                      'Lupa Password?',
                      style: textTextStyle.copyWith(fontSize: 12),
                    )
                  ],
                ),
                SizedBox(height: 32),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 21, 0, 155),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Bookmark()));
                    },
                    child: Text('LOGIN',
                        style: whiteTextStyle.copyWith(
                            fontWeight: bold, fontSize: 20)),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum mempunyai akun?",
                        style: textTextStyle.copyWith(fontSize: 10)),
                    SizedBox(width: 12),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text('Register',
                          style: textTextStyle.copyWith(
                              fontSize: 10, fontWeight: bold)),
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
