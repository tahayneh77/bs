import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person {
  @HiveField(0)
  String email;

  @HiveField(1)
  String password;

  Person({required this.email,required this.password});


}
