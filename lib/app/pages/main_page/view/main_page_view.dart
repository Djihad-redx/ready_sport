import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:mad_sport_app/app/utility/constants.dart';
import 'package:mad_sport_app/app/utility/global.dart';
import 'package:table_calendar/table_calendar.dart';

import 'event_card.dart';

class MainPageView extends GetView {
  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listOfColors=[Colors.red,Colors.blue,Colors.yellow,Colors.green,Colors.green,Colors.red];
    List _elements = [
      {'name': 'John',    'group': 'Saturday 23'},
      {'name': 'Will',    'group': 'Saturday'},
      {'name': 'Beth',    'group': 'Saturday'},
      {'name': 'Miranda', 'group': 'Sunday'},
      {'name': 'Mike',    'group': 'Monday'},
      {'name': 'Danny',   'group': 'Monday'},
      {'name': 'Danny',   'group': 'Saturday'},
      {'name': 'Danny',   'group': 'Friday'},
      {'name': 'Danny',   'group': 'Friday'},
      {'name': 'Danny',   'group': 'Tuesday'},
      {'name': 'Danny',   'group': 'Tuesday'},
    ];
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
            child: GroupedListView<dynamic, String>(
              stickyHeaderBackgroundColor: Colors.white,
              elements: _elements,
              groupBy: (element) => element['group'],
              groupComparator: (value1, value2) => value2.compareTo(value1),
              itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']),
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
                return EventCard(backgroundColor: listOfColors[0],);
              },
            )
        ),
        // SliverToBoxAdapter(child: Container(
        //   margin: EdgeInsets.only(left: getWidth(context)*.2,right: getWidth(context)*.2,bottom: 10),
        //   height: 40,decoration: BoxDecoration(
        //   borderRadius: getCircularRadius(30),
        //   color: Colors.black
        // ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: const [
        //     Icon(Icons.add_box_outlined,color: Colors.white,),
        //     SizedBox(width: 10,),
        //     Text('Create new event',style:  TextStyle(
        //       color: Colors.white,
        //       fontSize: 15,
        //       fontWeight: FontWeight.bold
        //     ),)
        // ],),
        // )),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //         (context, index) => EventCard(backgroundColor: listOfColors[index],),
        //     childCount: listOfColors.length,
        //   ),
        // ),
        // const SliverToBoxAdapter(child: SizedBox(height: 80,)),
      ],));
  }
}


