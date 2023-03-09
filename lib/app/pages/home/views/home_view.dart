import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mad_sport_app/app/map/view/map_centers.dart';
import 'package:mad_sport_app/app/pages/home/controllers/home_controller.dart';
import 'package:mad_sport_app/app/pages/main_page/view/main_page_view.dart';
import 'package:mad_sport_app/app/routes/app_pages.dart';
import 'package:mad_sport_app/app/utility/dialogs.dart';
import 'package:mad_sport_app/app/utility/global.dart';
import 'package:mad_sport_app/app/utility/storage_utility.dart';
import 'package:mad_sport_app/app/widgets/Loading.dart';

class HomePage extends GetView {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Theme(
      data: ThemeData.light(),
      child: Scaffold(
          extendBody: true,
          key:controller.scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text(myUser.value.message==null?'':myUser.value.message!.username??'Name not found',style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),),
            centerTitle: false,
            leading: InkWell(
                onTap: (){
                  StorageUtility.removeKey('token');
                  Get.offAllNamed(Paths.LOGIN_PAGE);
                  MyDialogs.toastMe('Signed out !!');
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration:  BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade200,
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(myUser.value.message==null?'':myUser.value.message!.profilePicture.toString().contains('defaultAvatar')?'https://as2.ftcdn.net/v2/jpg/02/15/84/43/1000_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg':myUser.value.message!.profilePicture??''),
                          fit: BoxFit.cover
                      )
                  ),
                ),
            ),
            actions: [IconButton(onPressed: (){
              Get.to(MapCentersView());
            }, icon: const Icon(Icons.map_outlined,size: 30,color: Colors.black,))],

          ),
          body: WillPopScope(
            onWillPop: () => controller.onWillPop(),
            child: SizedBox.expand(
            child: PageView(
              onPageChanged: (index){
                controller.currentIndex.value = index;
                controller.bottomNavIndex.value = index;
              },
              physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              children: [
                 const  MainPageView(),
                 Container(color: Colors.blue,),
                 Container(color: Colors.green,),
                 Container(color: Colors.yellow,)
              ],
              controller: controller.pageController,
            ),
        ),
          ),
          floatingActionButton: ScaleTransition(
            scale: controller.animation,
            child: FloatingActionButton(
              elevation: 8,
              backgroundColor: Colors.orange,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () async {

              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Obx(()=>AnimatedContainer(
            duration: const Duration(milliseconds:200),
            height:  controller.hightBottmBar,
            child: AnimatedBottomNavigationBar.builder(
                itemCount: controller.iconList.length,
                tabBuilder: (int index, bool isActive) {
                  final color = isActive ? Colors.orange : Colors.grey;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10,),
                      SvgPicture.asset("assets/icons/${controller.iconList[index]}",color: isActive ? Colors.orange : Colors.grey,height: 18,),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: AutoSizeText(
                          controller.iconTitles[index].tr,
                          maxLines: 1,
                          style: TextStyle(color: color,fontSize: 11),
                          group: controller.autoSizeGroup,
                        ),
                      )
                    ],
                  );
                },
                backgroundColor: Colors.white,
                activeIndex: controller.bottomNavIndex.value,
                splashColor: Colors.white,
                // notchAndCornersAnimation: curve,
                splashSpeedInMilliseconds: 300,
                notchSmoothness: NotchSmoothness.defaultEdge,
                gapLocation: GapLocation.center,

                onTap: (index) {
                  controller.bottomNavIndex.value = index;
                  controller.currentIndex.value = index;
                  controller.pageController.jumpToPage(index);
                }
            ),
          )))
    );
  }
}

