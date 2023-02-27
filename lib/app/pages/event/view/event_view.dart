import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_sport_app/app/pages/event/view/my_event_view.dart';
import 'package:mad_sport_app/app/utility/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mad_sport_app/app/utility/global.dart';

class Event extends GetView {
  const Event({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(onPressed: (){Get.back();},icon: const Icon(Icons.arrow_back,size: 30,color: Colors.black,),),
          backgroundColor: Colors.orange,
          actions: [Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border,color: Colors.black,)),
          )],
          title: const Text('Football',style: TextStyle(
              color: Colors.black
          ),),
        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: (){
                    Get.to(const MyEvent());
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: getCircularRadius(8),
                        ),
                        child: const Center(child: Icon(Icons.add,size: 30,),)

                      ),
                      Text('@User12332').marginSymmetric(vertical: 3)
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: getCircularRadius(8),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/person.jpeg')
                        ),

                      ),

                    ),
                    Text('@User12332').marginSymmetric(vertical: 3)
                  ],
                ),
                Expanded(child: SizedBox()),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: SizedBox()),
                Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: getCircularRadius(8),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/person.jpeg')
                        ),

                      ),

                    ),
                    Text('@User12332').marginSymmetric(vertical: 3)
                  ],
                ),
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: (){
                    Get.to(MyEvent());
                  },
                  child: Column(
                    children: [
                      Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: getCircularRadius(8),
                          ),
                          child: const Center(child: Icon(Icons.add,size: 30,),)

                      ),
                      Text('@User12332').marginSymmetric(vertical: 3)
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: SizedBox()),
                Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: getCircularRadius(8),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/person.jpeg')
                        ),

                      ),

                    ),
                    Text('@User12332').marginSymmetric(vertical: 3)
                  ],
                ),
                Expanded(child: SizedBox()),
                Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: getCircularRadius(8),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/person.jpeg')
                        ),

                      ),

                    ),
                    Text('@User12332').marginSymmetric(vertical: 3)
                  ],
                ),
                Expanded(child: SizedBox()),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: SizedBox()),
                Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: getCircularRadius(8),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/person.jpeg')
                        ),

                      ),

                    ),
                    Text('@User12332').marginSymmetric(vertical: 3)
                  ],
                ),
                Expanded(child: SizedBox()),
                Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: getCircularRadius(8),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/person.jpeg')
                        ),

                      ),

                    ),
                    Text('@User12332').marginSymmetric(vertical: 3)
                  ],
                ),
                Expanded(child: SizedBox()),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: (){
                    Get.to(MyEvent());
                  },
                  child: Column(
                    children: [
                      Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: getCircularRadius(8),
                          ),
                          child: const Center(child: Icon(Icons.add,size: 30,),)

                      ),
                      Text('@User12332').marginSymmetric(vertical: 3)
                    ],
                  ),
                ),
                Expanded(child: SizedBox()),
                Column(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: getCircularRadius(8),
                        image: const DecorationImage(
                            image: AssetImage('assets/images/person.jpeg')
                        ),

                      ),

                    ),
                    Text('@User12332').marginSymmetric(vertical: 3)
                  ],
                ),
                Expanded(child: SizedBox()),
              ],
            ),

          ],
        ));
  }
}
