import 'package:bs/app_Events.dart';
import 'package:bs/app_bloc.dart';
import 'package:bs/person.dart';
import 'package:bs/welcome_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'boxes.dart';
import 'init_state.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  personBox = await Hive.openBox<Person>('PersonBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (context) => AppBloc(),
        ),
        BlocProvider<WelcomeBloc>(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider<SignInBloc>(
          create: (context) => SignInBloc(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context , child ) => MaterialApp(
          debugShowCheckedModeBanner: false,
            home: WelcomePages(),
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: BlocBuilder<AppBloc , AppStates>(
          builder: (context,state){
            return Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 350.w,
                  height: 200.h,
                  child: ListView.builder(
                    itemCount: personBox.length,
                      itemBuilder:(context,index){
                      Person person = personBox.getAt(index);
                      return ListTile(
                        title: Text(person.email),

                      );
                      }
                  ),
                ),
                Text(
                  '${BlocProvider.of<AppBloc>(context).state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<AppBloc>(context).add(Increment());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              BlocProvider.of<AppBloc>(context).add(Decrement());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
