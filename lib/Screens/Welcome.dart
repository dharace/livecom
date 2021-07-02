import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final _userNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _userNameController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Image(image: AssetImage('assets/bg.png'), fit: BoxFit.cover, width: double.infinity, height: double.infinity),
          Align(
              alignment: Alignment.center,
              child: Padding(
                  padding: EdgeInsets.all(25.sp),
                  child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/bg_welcome1.png'), fit: BoxFit.fill)),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 15.sp),
                          child: SingleChildScrollView(
                              child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.sp),
                              child: Text('Hello,\nwelcome aboard!', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: Color(0xFFD7DDE8))),
                            ),
                            SizedBox(height: 5.sp),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.sp),
                              child:
                                  Text('Let us know a little bit about\nyou.', style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Color(0xFF7889A9))),
                            ),
                            SizedBox(height: 25.sp),
                            TextWidget(
                              hintText: 'User Name',
                              controller: _userNameController,
                              errorText: _validate ? 'Username is not available.' : null
                            ),
                            SizedBox(height: 25.sp),
                            TextWidget(
                              hintText: 'First Name',
                              controller: _firstNameController,
                              errorText: null
                            ),
                            SizedBox(height: 25.sp),
                            TextWidget(
                              hintText: 'Last Name',
                              controller: _lastNameController,
                              errorText: null
                            ),
                            SizedBox(height: 35.sp),
                            _nextButton(),
                            SizedBox(height: 15.sp),
                          ]))))))
        ]));
  }

  TextWidget({String hintText, TextEditingController controller, String errorText}) {
    return TextField(
      controller: controller,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Color(0xFFD7DDE8)),
      cursorColor: Color(0xFF7889A9),
      decoration: InputDecoration(
          hintText: hintText,
          errorText: errorText,
          hintStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: Color(0xFF7889A9)),
          filled: true,
          fillColor: Color(0xFF2E394E),
          suffixIcon: errorText!= null ?  Padding(
            padding: EdgeInsets.symmetric(horizontal :15.sp, vertical: 0.sp),
            child: IconButton(icon: Image.asset('assets/question.png'), onPressed: (){},),
          ) : null,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFF7889A9), width: 0.5), borderRadius: BorderRadius.all(Radius.circular(100.sp))),
          focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFD7DDE8), width: 0.5), borderRadius: BorderRadius.all(Radius.circular(100.sp))),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFD7DDE8), width: 0.5), borderRadius: BorderRadius.all(Radius.circular(100.sp))),
          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFD7DDE8), width: 0.5), borderRadius: BorderRadius.all(Radius.circular(100.sp))),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFD7DDE8), width: 0.5), borderRadius: BorderRadius.all(Radius.circular(100.sp))),
          contentPadding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 15.sp)),
    );
  }

  _nextButton() {
    return GestureDetector(
        onTap: () {
          setState(() {
            _firstNameController.text.isEmpty ? _validate = true : _validate = false;
          });
        },
        child: Align(
            alignment: Alignment.topRight,
            child: Container(
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/bg_btn_red.png'), fit: BoxFit.fill)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 10.sp),
                  child: Text('NEXT', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: Color(0xFFD7DDE8))),
                ))));
  }
}
