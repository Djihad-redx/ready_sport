import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mad_sport_app/app/pages/authentication/controller/login_controller.dart';
import 'package:mad_sport_app/app/pages/authentication/views/forgot_password.dart';
import 'package:mad_sport_app/app/pages/authentication/views/sign_up_view.dart';
import 'package:mad_sport_app/app/pages/home/bindings/home_binding.dart';
import 'package:mad_sport_app/app/pages/home/views/home_view.dart';
import '../../../routes/app_pages.dart';
import '../../../utility/constants.dart';
import '../../../utility/global.dart';
import '../../../widgets/Loading.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/password_field.dart';


class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            body: Container(
              height: getHight(context),
              padding: const EdgeInsets.symmetric(horizontal: 20),
                 color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(50),
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
                              controller: controller.email,
                                icon: "ic_person",
                                hint: "Email or ID",
                                divider: true),
                            SizedBox(
                              height: getHight(context) * .02,
                            ),
                             PasswordField(
                                icon: "ic_password", hint: "Password",controller: controller.password,) ,

                            InkWell(
                              onTap: () {
                                Get.to(const ForgotPassword());
                              },
                              child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(top: 20),
                                  child: const Text(
                                    "Forgot password?",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: Colors.black),
                                  )),
                            ),
                            SizedBox(
                              height: getHight(context) * .04,
                            ),
                            InkWell(
                              onTap: () {
                                controller.login();
                              },
                              child: const MyButton(
                                width: 200,
                                hight: 55,
                                background_color: Colors.orange,
                                border_radius: 8,
                                text: "LOGIN",
                                text_color: Colors.black,
                                text_size: 14,
                              ),
                            ),
                            SizedBox(
                              height: getHight(context) * .01,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Paths.SIGNUP_PAGE);
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Sign up for new user",
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
        Obx(() => controller.isLoading.value? MyLoading():Container())
      ],
    );
  }
}
