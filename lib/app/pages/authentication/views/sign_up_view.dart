import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mad_sport_app/app/pages/authentication/controller/sign_up_controller.dart';
import 'package:mad_sport_app/app/pages/authentication/views/forgot_password.dart';
import 'package:mad_sport_app/app/pages/home/bindings/home_binding.dart';
import 'package:mad_sport_app/app/pages/home/views/home_view.dart';
import 'package:mad_sport_app/app/widgets/Loading.dart';
import '../../../utility/constants.dart';
import '../../../utility/global.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/password_field.dart';


class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar:  AppBar(
            leading: InkWell(
                onTap: (){
                  Get.back();
                },
                child: const Icon(Icons.arrow_back,color: Colors.black,)),
            backgroundColor: Colors.orange,
            title: const Text('Signup',style: TextStyle(
                color: Colors.black
            ),),
            centerTitle: true,
          ),
            body: Container(
              height: getHight(context),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 50),
                      child: SvgPicture.asset('assets/images/ic_sport_logo.svg',color: Colors.orange,height: 100,)),
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(bottom: 30),
                    decoration: BoxDecoration(
                      borderRadius: getCircularRadius(10),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: getHight(context) * .04,
                        ),
                         InputField(
                          controller: controller.userName,
                            icon: "ic_person",
                            hint: "User name",
                            divider: true),
                         const SizedBox(
                          height: 10
                        ),
                         InputField(
                           controller: controller.firstName,
                            icon: "ic_person",
                            hint: "First name",
                            divider: true),
                         const SizedBox(
                            height: 10
                        ),
                         InputField(
                           controller: controller.lastName,
                            icon: "ic_person",
                            hint: "Last name",
                            divider: true),
                        const SizedBox(
                            height: 10
                        ),
                         InputField(
                          controller: controller.email,
                            icon: "ic_person",
                            hint: "Email",
                            divider: true),
                        const SizedBox(
                            height: 10
                        ),
                         InputField(
                          controller: controller.mobile,
                            icon: "ic_person",
                            hint: "Mobile",
                            divider: true),
                        const SizedBox(
                            height: 10
                        ),
                         PasswordField(
                          controller: controller.password,
                            icon: "ic_password", hint: "Password") ,
                        const SizedBox(
                            height: 10
                        ),
                        SizedBox(
                          height: getHight(context) * .04,
                        ),
                        InkWell(
                          onTap: () {
                            controller.register();
                          },
                          child: const MyButton(
                            width: 200,
                            hight: 55,
                            background_color: Colors.orange,
                            border_radius: 8,
                            text: "SignUp",
                            text_color: Colors.black,
                            text_size: 14,
                          ),
                        ),
                        SizedBox(
                          height: getHight(context) * .01,
                        ),
                        InkWell(
                          onTap: () {
                            Get.back();
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Already have an account ?",
                              style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
        Obx(() => controller.isLoading.value?MyLoading():const SizedBox())
      ],
    );
  }
}
