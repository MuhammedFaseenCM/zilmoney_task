import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zilmoney_task/controller/login_function.dart';
import 'package:zilmoney_task/controller/provider/login_provider.dart';
import 'package:zilmoney_task/model/login_model.dart';
import 'package:zilmoney_task/view/utils/const_widgets.dart';
import 'package:zilmoney_task/view/utils/custom_colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Provider.of<LoginProvider>(context, listen: false).getHiveValue(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Consumer<LoginProvider>(builder: (context, loginProvider, _) {
          return Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("The", style: TextStyle(fontSize: 25.0)),
                const Text(
                  "Online Shop",
                  style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.w300),
                ),
                kHeight30,
                TextFormField(
                  controller: loginProvider.usernameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "User name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter the username";
                    } else if (value.length < 5) {
                      return "Enter atleast 5 characters";
                    }
                    return null;
                  },
                ),
                kHeight10,
                TextFormField(
                  controller: loginProvider.passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter the password";
                    } else if (value.length < 5) {
                      return "Enter atleast 5 characters";
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      value: loginProvider.isRemember,
                      onChanged: (value) {
                        loginProvider.changeRemember();
                      },
                    ),
                    const Text("Remember"),
                  ],
                ),
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: KwhiteColor,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(color: kBlackColor),
                            borderRadius: BorderRadius.circular(0.0),
                          ),
                        ),
                        onPressed: () {
                          if (!formKey.currentState!.validate()) {
                            return;
                          }
                          String username =
                              loginProvider.usernameController.text;
                          String password =
                              loginProvider.passwordController.text;
                          fetchUserLogin(
                              username: username,
                              password: password,
                              context: context);
                          if (loginProvider.isRemember) {
                            LoginModel value = LoginModel(
                                username: username, password: password);
                            loginProvider.hiveLogin(value: value);
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: kBlackColor),
                        )))
              ],
            ),
          );
        }),
      ),
    );
  }
}
