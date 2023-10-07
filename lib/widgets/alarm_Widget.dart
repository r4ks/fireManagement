import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AlarmWidget extends StatelessWidget{
  AlarmWidget(){
    _showGetDialog();
  }

  _showGetDialog(){
Get.defaultDialog(title: "Alarm",content: 
                        Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  "Type",
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                alignment: Alignment.topCenter,
                                height: 40,
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),]), ],),);
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox.shrink();
  }


}