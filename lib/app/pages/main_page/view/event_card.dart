import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_sport_app/app/pages/home/models/sessionsModel.dart';
import '../../../utility/global.dart';
import '../../event/view/event_view.dart';

class EventCard extends StatelessWidget {
  EventCard({
    Key? key,
    this.eventName,
    this.groundName,
    this.price,
    this.time,
    required this.backgroundColor,
    required this.numberOfPlayers,
    required this.item,
  }) : super(key: key);

  final String? eventName;
  final String? groundName;
  final String? price;
  final String? time;
  final Color backgroundColor;
  final int numberOfPlayers;
  final SessionData? item;


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
                  Expanded(child: Container(decoration:  BoxDecoration(color: numberOfPlayers==0?Colors.white:backgroundColor,borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))),)),
                  Expanded(child: Container(height: 100, color: numberOfPlayers<2?Colors.white:backgroundColor,)),
                  Expanded(child: Container(color: numberOfPlayers<3?Colors.white:backgroundColor,)),
                  Expanded(child: Container(color: numberOfPlayers<4?Colors.white:backgroundColor,)),
                  Expanded(child: Container(decoration:  BoxDecoration(color: numberOfPlayers<12?Colors.white:backgroundColor,borderRadius: const BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))),)),
                ],),
                Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                         item!.center!.address!,
                         style: const TextStyle(color: Colors.black,fontSize: 13,fontWeight: FontWeight.w600),).marginOnly(left: 5),
                                const SizedBox(height: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            margin: const EdgeInsets.only(left: 0),
                            decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200,
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(item!.organizer== null?'https://as2.ftcdn.net/v2/jpg/02/15/84/43/1000_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg':
                                    item!.organizer!.profilePicture.toString().contains('defaultAvatar')?'https://as2.ftcdn.net/v2/jpg/02/15/84/43/1000_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg':
                                    item!.organizer!.profilePicture??''),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item!.center!.name!, style: const TextStyle(color: Colors.black,fontSize: 12),),
                              const SizedBox(height: 4,),
                               Text('${item!.pricePerSlot??'0.00'} ${item!.currency!}',style:  const TextStyle(color: Colors.black,fontSize: 12),),
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