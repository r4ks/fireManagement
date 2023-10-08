import 'package:get/get.dart';

class AlarmController extends GetxController {
  RxBool isAlarm = false.obs;
  RxString alarmText = "You are in Danger".obs;
  Map<int,String> alarmType = {1:"You are in Danger",2:"You will be in Danger soon", 3:"Roads you are using are blocked!", 4:"Stay put, you are safe but the roads are dangerous"};
}