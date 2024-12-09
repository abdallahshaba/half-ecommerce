import 'dart:async';

import 'package:e_commerce_app14/core/constant/colors.dart';
import 'package:e_commerce_app14/views/screen/language/language_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
 late AnimationController _animationController;
 late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // إعداد الحركة (Animation) لتغيير الحجم (Scale)
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    // بدء الحركة
    _animationController.forward();

    // الانتقال إلى الصفحة الرئيسية بعد 3 ثواني
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LanguageScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kBackgroundColorMain2, // لون الخلفية
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // شعار البرنامج مع حركة تكبير وتصغير (Scale)
            ScaleTransition(
              scale: _animation,
              child: Container(
                height: 450,
                width: 450,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/appLogo.png'), // هنا تضع صورة الشعار
                  ),
                ),
              ),
            ),
            SizedBox(height: 30), // مساحة بين الشعار والنص
            // نص الترحيب مع حركة الظهور (Fade In)
            AnimatedOpacity(
              opacity: _animationController.isAnimating ? 0.0 : 1.0,
              duration: Duration(seconds: 2),
              child: Text(
                'Welcome to My App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
