import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_info/pages/auth/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_info/pages/views/shop/shopPage.dart';

class DashBoardScreen extends StatefulWidget {
  // const DashBoardScreen({ Key? key }) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  void initState() {
    print("adasnawj");
    super.initState();
    print("ads");
    Fluttertoast.showToast(
        msg: "You Are Logged In Now!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  checkLogin() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('not logged in');

        return Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        print('loggedin');
        // return Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => DashBoardScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    checkLogin();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text('Hello! 🚀✨ - Dashboard'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: AssetImage('assets/astronaut.jpg'),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (builder) => ShopPage()));
                  },
                  child: Text('Shop Now!')),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
// ng build --prod