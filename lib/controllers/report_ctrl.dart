import 'package:get/get.dart';

class ReportController extends GetxController{
    final List<String> reportFirechoices = ["Wild Fire", "Civil Fire", "Smoke", "Arson"];
    final List<String> reportInjuryChoices = ["Lightly Injured","Heavily Injured", "Lost", "Death", "Needs Rescue"];
    final List<String> reportRoadBlockChoices = ["Closed","Difficult", "On Fire", "Traffic Jam"];
    final List<String> reportEnviromentalChoices = ["Flammable Object","Water Contaminant", "Rare species in danger", "Damaged Structure"];
    final List<String> reportVolunteeringChoices = ["Not Volunteering","General","Transportation", "Medical", "Communication"];

    RxString fireReportChoice = "Wild Fire".obs;
    RxString injuryReportChoice = "Lightly Injured".obs;
    RxString roadBlockReportChoice = "Closed".obs;
    RxString enviromentalChoice = "Dry Leaves".obs;
    RxString volunteerChoice = "Not Volunteering".obs;

} 