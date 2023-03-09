import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mad_sport_app/app/pages/authentication/model/user_model.dart';
import 'package:mad_sport_app/app/pages/home/controllers/home_controller.dart';
import 'package:mad_sport_app/app/pages/home/models/sessionsModel.dart';
import 'package:mad_sport_app/app/utility/constants.dart';
import 'package:mad_sport_app/app/utility/global.dart';
import 'package:mad_sport_app/app/widgets/Loading.dart';
import 'package:table_calendar/table_calendar.dart';

import 'event_card.dart';

class MainPageView extends GetView<HomeController> {
  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listOfColors=[Colors.red,Colors.blue,Colors.yellow,Colors.green,Colors.green,Colors.red];
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
      children:[
        const SizedBox(height: 10,),
        Container(
          child: TableCalendar(
            firstDay: DateTime.utc(2022, 10, 1),
            lastDay: DateTime.utc(2022, 11, 1),
            focusedDay: DateTime.utc(2022, 10, 1),
            headerVisible: false,
            calendarFormat: CalendarFormat.week,

          ),
        ),

        Expanded(
            child: Obx(()=>
            controller.isLoading.value? MyLoading():
            !controller.mySessions.value.success!?
            Container(
              margin: const EdgeInsets.all(30),
              child: const Text('No sessions',style: TextStyle(
                  fontSize: 22
              ),),):
            GroupedListView<SessionData,String>(
              stickyHeaderBackgroundColor: Colors.white,
              elements: controller.mySessions.value.message!,
              groupBy: (element) => element.startDate.toString(),
              groupComparator: (value1, value2) => value2.compareTo(value1),
              itemComparator: (item1, item2) => item1.id!.compareTo(item2.id!),
              order: GroupedListOrder.DESC,
              useStickyGroupSeparators: true,
              groupSeparatorBuilder: (String value) => Container(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  value,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ).marginOnly(left: 25),
              ),
              itemBuilder: (c, element) {
                return EventCard(backgroundColor: element.participants!.length<3?Colors.green:element.participants!.length<6 && element.participants!.length>2? Colors.orangeAccent:Colors.red,numberOfPlayers: element.participants!.length,item: element,);

              },
            ))
        ),
      ],));
  }
}


