import 'package:bs/app_Events.dart';
import 'package:bs/app_bloc.dart';
import 'package:bs/init_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignInBloc,SigninState>(
        builder: (context,state) {
          return Center(
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    width: 300.w,
                    height: 200.h,
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                          fontSize: 40.sp,

                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 300.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    onChanged: (value){
                      context.read<SignInBloc>().add(EmailEvent(value));
                    },
                    controller:userNameController ,
                    decoration: InputDecoration(
                      focusColor: Colors.deepPurple,
                      alignLabelWithHint: true,
                      hintText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    width: 300.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      onChanged: (value){

                      },
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        focusColor: Colors.deepPurple,
                        hintText: 'password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)
                        ),

                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  width: 290.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      TextButton(onPressed: (){},
                          child: Text("create account",
                            style: TextStyle(
                              fontSize: 10.sp ,),)),
                      TextButton(onPressed: (){},
                          child: Text("forget password",
                            style: TextStyle(
                              fontSize: 10.sp ,),)),

                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10),
                  child: ElevatedButton(
                    onPressed: (){

                    },
                    child:Text("Login"),
                    style:ElevatedButton.styleFrom(
                      minimumSize: const Size(300, 40),
                      maximumSize: const Size(300, 40),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      )
    );
  }
}

