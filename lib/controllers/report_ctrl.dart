import 'package:get/get.dart';

class ReportController extends GetxController{
    final List<String> reportFirechoices = ["Fire", "Smoke", "Arson"];
    final List<String> reportInjuryChoices = ["Lightly Injured","Heavily Injured", "Lost", "Death"];
    RxString selectedChoice1 = "Fire".obs;
    RxString selectedChoice2 = "Lightly Injured".obs;
} 