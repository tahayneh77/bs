import 'package:bs/app_Events.dart';
import 'package:bs/app_bloc.dart';
import 'package:bs/main.dart';
import 'package:bs/registration_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'init_state.dart';

class WelcomePages extends StatefulWidget {
  const WelcomePages({Key? key}) : super(key: key);

  @override
  State<WelcomePages> createState() => _WelcomePagesState();
}

class _WelcomePagesState extends State<WelcomePages> {
PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body:BlocBuilder<WelcomeBloc,WelcomeState>(
          builder: (context,state){
            return Container(
              margin: EdgeInsets.only(top: 35.h),
              width: 375.w,
              child: Stack(
                children: [
                  PageView(
                    controller: pageController,
                    onPageChanged: (index){
                      state.page=index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                      print(state.page);
                    },
                    children: [
                      _page(
                          "assits/firstPageImage-02.png",
                          "First welcome page",
                          "let's know about the app",
                          1,
                          context,
                          "Next"
                      ),
                      _page(
                          "assits/secPageImage-02.png",
                          "Second welcome page",
                          "let's know about the app",
                          2,
                          context,
                          "Next"
                      ),
                      _page(
                          "assits/lastPageImage-02.png",
                          "Last welcome page",
                          "let's know about the app",
                          3,
                          context,
                          "Get Start"
                      ),
                    ],
                  ),
                  Positioned(

                    left: 150.w,
                    bottom: 120.h,
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: state.page,
                      decorator: DotsDecorator(
                          activeSize: Size(14, 8),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                          )
                      ),
                    ),
                  )
                ],
              ),

            );
          },
        ),
      ),
    );
  }
  Widget _page (String imagePath , String title , String description , int index,
      BuildContext context , String buttonName){
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.h,
          child: Image.asset(imagePath),
        ),
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),

        ),
        Container(
          child: Text(
            description,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),

        ),
        GestureDetector(
          onTap: () {
            if(index<3){
              pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.decelerate
              );
            }else{
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context)=> LoginPage()));
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 190),
            child: Container(
              width: 270.w,
                height: 40.h,
                child: Center(child: Text(
                    buttonName,
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold
                  ),
                )),
              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3.0, // soften the shadow
                    spreadRadius: 1.0, //extend the shadow
                    offset: Offset(
                      -1.0, // Move to right 10  horizontally
                      3.0, // Move to bottom 10 Vertically
                    ),
                  )
                ],
              ),
            ),
          ),
        )

      ],
    );
  }
}
