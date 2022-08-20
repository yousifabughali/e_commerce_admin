import 'package:e_commerce_admin/app_router/router.dart';
import 'package:e_commerce_admin/screens/category_screens/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LunchScreen extends StatefulWidget {
  const LunchScreen({Key? key}) : super(key: key);

  @override
  _LunchScreenState createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  void initState()  {
    super.initState();
     navigationFun(context);
    }

  navigationFun(BuildContext context)async{
    await Future.delayed(Duration(seconds: 3));
    Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 28, 44, 180),
              Color.fromARGB(255, 104, 12, 128),
            ],
          ),
        ),
        child:  Text(
          'E-Commerce Admin',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
