import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_sport_app/app/pages/authentication/views/forgot_password_confirmation.dart';

import '../../../utility/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utility/global.dart';
import '../../../widgets/input_field.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/password_field.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: InkWell(
                onTap: (){
                  Get.back();
                },
                child: const Icon(Icons.arrow_back,color: Colors.black,)),
            backgroundColor: Colors.orange,
            title: const Text('Forget password ',style: TextStyle(
              color: Colors.black
            ),),
            centerTitle: true,
          ),
          body: Container(
          height: getHight(context),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start
            ,
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset('assets/images/ic_sport_logo.svg',color: Colors.transparent,height: 50,)),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  borderRadius: getCircularRadius(10),
                  color: Colors.white.withOpacity(0.7),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text('Forgot Password?',style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25
                    ),textAlign: TextAlign.start,),
                    const SizedBox(height: 10,),
                    const Text('Dont worry it happens. please enter the email or phone number associated with your account '),
                    SizedBox(
                      height: getHight(context) * .1,
                    ),
                    const InputField(
                        icon: "ic_person",
                        hint: "Email or ID",
                        divider: true),
                    SizedBox(
                      height: getHight(context) * .04,
                    ),
                    InkWell(
                      onTap: () {
                          Get.to(const ForgotPasswordConfirmation());
                      },
                      child: const Center(
                        child: MyButton(
                          width: 200,
                          hight: 55,
                          background_color: Colors.orange,
                          border_radius: 8,
                          text: "Confirm",
                          text_color: Colors.black,
                          text_size: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getHight(context) * .01,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),)
        // _loginController.isLoading.value? MyLoading():Container()
      ],
    );
  }
}
