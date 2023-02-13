import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utility/global.dart';
import '../../event/view/event_view.dart';

class EventCard extends StatelessWidget {
  EventCard({
    Key? key,
    this.eventName,
    this.groundName,
    this.price,
    this.time,
    required this.backgroundColor
  }) : super(key: key);

  final String? eventName;
  final String? groundName;
  final String? price;
  final String? time;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(const Event());
      },
      child: Container(
        height: 100,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: getCircularRadius(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(children: [
          Expanded(
            child: Stack(
              children: [
                Row(children:  [
                  Expanded(child: Container(decoration:  BoxDecoration(color: Colors.orange.shade100,borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))),)),

                  Expanded(child: Container(
                height: 100,
                color: Colors.orange.shade100,)),
                Expanded(child: Container(color: Colors.orange.shade100,)),
              Expanded(child: Container(color: Colors.orange.shade100,)),
              Expanded(child: Container(decoration: const BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),)),
                ],),
                Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('4:00 PM. Westway sports center',style:  TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w600),).marginOnly(left: 5),
                      const SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/images/person.jpeg'),
                                fit: BoxFit.cover
                              )
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('UrbanSoccer Puteaux',style:  TextStyle(color: Colors.black,fontSize: 12),),
                              SizedBox(height: 4,),
                              Text('15.00\$',style:  TextStyle(color: Colors.black,fontSize: 12),),
                            ],
                          ),
                          const Spacer(),
                          const Text('18/18',style:  TextStyle(color: Colors.black),),
                        ],),
                    ],
                  ),),
              ],
            ),
          )
        ],),
      ),
    );
  }
}