import 'package:flutter_map_arcgis_example/screens/mainScreen.dart';
import 'package:flutter_map_arcgis_example/screens/reportingScreen.dart';
import 'package:get/get.dart';

class Routes {
  Routes._();

  static List<GetPage<dynamic>> getPages = [
    GetPage(
        name: mainScreen,
        page: () => const MainScreen(),
        transition: Transition.noTransition),
    GetPage(
        name: reportingScreen,
        page: () => const ReportingScreen(),
        transition: Transition.noTransition),
  ];
  static String mainScreen = "/";
  static String reportingScreen= "/reportingScreen";
  static String settingsAppScreen = "/settingsAppScreen";
  static String pdfScreen = "/pdfScreen";
  static String manuelWashScreen = "/manuelWashScreen";
  static String timeSettingScreen = "/timeSettingScreen";
  static String cleaningScreen = "/cleaningScreen";
  static String testScreen = "/testScreen";
}
