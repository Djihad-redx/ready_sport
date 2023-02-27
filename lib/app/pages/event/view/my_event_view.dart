import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_sport_app/app/utility/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mad_sport_app/app/utility/global.dart';

class MyEvent extends GetView {
  const MyEvent({Key? key}) : super(key: key);

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
        body: ListView(
          children: [
            Container(
              height: 130,
              width: getWidth(context),
              decoration: const BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(image: AssetImage('assets/images/map.png'),fit: BoxFit.cover)
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/images/ic_sport_logo.svg',height: 60,),
                  ),
                  const Text('UrbanSoccer La Defense',style:  TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),),
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child:  Text('Dimanche 27 mars',style:  TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(children: const [
                          Icon(Icons.watch_later_outlined,size: 35,),
                          Text('15:15',style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                        ],),
                        Column(children: const [
                          Icon(Icons.hourglass_bottom,size: 35,),
                          Text('15:15',style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                        ],),
                        Column(children: const [
                          Icon(Icons.euro,size: 35,),
                          Text('15:15',style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),)
                        ],),
                      ],),
                  ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
            Container(
              width: getWidth(context),
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),

              child: Column(children: [
                const SizedBox(height: 10,),
                const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('2 places disponibles/10',style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),
              ),
                Container(
                  width: getWidth(context),
                  height: 60,
                  margin: EdgeInsets.only(right: getWidth(context)*.12,left: getWidth(context)*.12,top: 10,bottom: 5),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: getCircularRadius(6)
                  ),
                  child:  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Apply',style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                        ),),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('+100 points krank',style:  TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),),
                        ),

                      ],
                    ),
                  ),

                ),
                const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text('participe a cet event et gaagne 100 points',style: TextStyle(
                      fontSize: 15,
                  ),),
                ),
                const SizedBox(height: 20,)

              ],),),
            Container(
              width: getWidth(context),
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),

              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Event:',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),),
                    ),
                    Text('Football - 5vs5',style: TextStyle(
                      fontSize: 15
                    ),),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Visibilite:',style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15
                      ),),
                    ),
                    Expanded(
                      child: Text('Publique (visible par toute )',style: TextStyle(
                        fontSize: 15
                      ),),
                    ),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Adress:',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                    ),
                    Expanded(
                      child: Text('85 Avenue Francois arago,',style: TextStyle(
                          fontSize: 15
                      ),),
                    ),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('type de payment:',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                    ),
                    Expanded(
                      child: Text('18.25\$ sur place',style: TextStyle(
                          fontSize: 15
                      ),),
                    ),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('niveau:',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                    ),
                    Text('Bon - Tres bon - Expert',style: TextStyle(
                        fontSize: 15
                    ),),
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('Ambiance:',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),),
                    ),
                    Text('Fun',style: TextStyle(
                        fontSize: 15
                    ),),
                  ],),
                ),

              ],),),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child:  Icon(Icons.person_pin,color: Colors.black,size: 40,),
            ),
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Event organise par sabastien terras',style: TextStyle(
                  fontSize: 15,
                  color: Colors.black
                ),textAlign: TextAlign.center,),
              ),
            ),




          ],
        ));
  }
}
