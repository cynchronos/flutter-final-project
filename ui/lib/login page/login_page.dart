import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:ui/theme.dart';
import 'auth_service.dart';
import 'package:ui/homepage/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  String errorMessage = '';

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // auth function here
  Future<void> loginByUsername(String username, String password) async {
    AuthService authService = AuthService();
    Object result = await authService.databaseLogin(username, password);
    
    await loginNavigate(result);
  }

  Future<void> loginNavigate(Object result) async {
    Map data = result as Map;

    if (data['success'] == true) {
      setState(() {
        isLoading = false;
      });
      await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(firstname: data['data']['firstname'],)), (route) => false);
    } else {
      setState(() {
        isLoading = false;
        errorMessage = data['message'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: const Color(0xffFAFAFA),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 32.5,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(150, 152, 169, 0.3),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    child: IconButton(
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios_new),
                      color: const Color(0xffFAFAFA),
                    ),
                  ),
                  const SizedBox(
                    height: 55.5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome\nBack !', style: bannerText),
                      Container(
                        width: 48,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color(0xff5C40CC),
                          borderRadius: BorderRadius.all(Radius.circular(17)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 75,
                  ),
                  errorMessage != '' ? 
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline_rounded, color: redColor, size: 20,),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(errorMessage, style: errorText,),
                      ],
                    ),
                  ) : const SizedBox(),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: generalText,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff5C40CC), width: 2.0),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Masukkan Username Anda';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: generalText,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff5C40CC), width: 2.0),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Masukkan Password Anda';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 58,
                          ),
                          ElevatedButtonTheme(
                            data: ElevatedButtonThemeData(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff5C40CC),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isLoading = true;
                                  errorMessage = '';
                                });
                                if (_formKey.currentState!.validate()) {
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    loginByUsername(usernameController.text,
                                        passwordController.text);
                                  });
                                } else {
                                  Null;
                                }
                              },
                              child: SizedBox(
                                height: 55,
                                child: Center(
                                  child: isLoading
                                      ? LoadingAnimationWidget
                                          .threeArchedCircle(
                                          color: Colors.white,
                                          size: 18,
                                        )
                                      : Text('Login', style: btnText),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Center(
                              child: Text('or', style: subgeneralText),
                            ),
                          ),
                          ElevatedButtonTheme(
                            data: ElevatedButtonThemeData(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: whiteColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    (2 * 32),
                                height: 55,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/icons/google.png',
                                      width: 18,
                                      height: 18,
                                    ),
                                    const SizedBox(
                                      width: 22,
                                    ),
                                    Text('Sign In with Google',
                                        style: subgeneralText),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
