import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    //var timer = new Duration(seconds: 5);
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, '/home');
    });
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/loading.png'),
              fit:BoxFit.cover,
            )
          ),
        )
      )
    );
  }
}
