import 'package:flutter/material.dart';
import 'package:school/screens/dashboard.dart';
import 'package:school/utils/http_requests.dart';
import 'package:school/utils/hashCode.dart';
import '../components/custom_container.dart';
import '../components/custom_dropdown_menu.dart';
import '../components/custom_text_field.dart';
import '../const.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:school/utils/session.dart';
import 'log_in.dart';

class SignUp extends StatefulWidget {
  static const String route = '/SignUp/';

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  CarouselController controller = CarouselController();
  int current = 0;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  TextEditingController password = TextEditingController();
  bool obscurePassword = true;

  TextEditingController confirmPassword = TextEditingController();
  bool obscureConfirmPassword = true;

  String? section;
  List<String> sectionList = ['العلمي', 'الأدبي', 'الصناعي'];

  String? grade;
  List<String> gradeList = [for (int i = 12; i >= 1; i--) '$i'];

  void signUp(email, phone, password, firstName, lastName, section, grade) {
    post('sign_up/', {
      'email': email,
      'phone': phone,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'section': section,
      'grade': grade,
    }).then((value) {
      dynamic result = decode(value);
      switch (result) {
        case 0:
          setSession('sessionKey0', email);
          setSession('sessionValue', password)
              .then((value) => Navigator.pushNamed(context, Dashboard.route));
          break;
        case 1:
          print('account already exit');
          Navigator.pushNamed(context, LogIn.route);
          break;
        case 2:
          print('email is used');
          break;
        case 3:
          print('phoneNum is used');
          break;
        case 404:
          print('check your connection');
          break;
        default:
          print('sth goes wrong, try later');
          break;
      }
    });
  }

  @override
  void initState() {
    delSession('sessionKey0');
    delSession('sessionKey1');
    delSession('sessionValue');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/signup_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height / 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'إنشاء حساب',
                            style: textStyle.copyWith(
                              color: kPurple,
                              fontWeight: FontWeight.w800,
                              fontSize: width / 90,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: height / 32),
                            child: Text(
                              'أهـلا فيـك!',
                              style: textStyle.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: width / 50,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height / 64),
                            child: Row(
                              children: [
                                CustomTextField(
                                  innerText: null,
                                  hintText: 'الاسم الاول',
                                  fontSize: width / 85,
                                  width: width / 5,
                                  controller: firstName,
                                  onChanged: (text) {},
                                  readOnly: false,
                                  obscure: false,
                                  suffixIcon: null,
                                  keyboardType: null,
                                  color: kGray,
                                  verticalPadding: width / 170,
                                  horizontalPadding: width / 42.5,
                                  border: roundedInputBorder(),
                                  focusedBorder: roundedFocusedBorder(),
                                ),
                                SizedBox(width: width / 64),
                                CustomTextField(
                                  innerText: null,
                                  hintText: 'اسم العائلة',
                                  fontSize: width / 85,
                                  width: width / 5,
                                  controller: lastName,
                                  onChanged: (text) {},
                                  readOnly: false,
                                  obscure: false,
                                  suffixIcon: null,
                                  keyboardType: null,
                                  color: kGray,
                                  verticalPadding: width / 170,
                                  horizontalPadding: width / 42.5,
                                  border: roundedInputBorder(),
                                  focusedBorder: roundedFocusedBorder(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height / 64),
                            child: CustomTextField(
                              innerText: null,
                              hintText: 'البريد الإلكتروني',
                              fontSize: width / 85,
                              width: width / 2.42,
                              controller: email,
                              onChanged: (text) {},
                              readOnly: false,
                              obscure: false,
                              suffixIcon: null,
                              keyboardType: TextInputType.emailAddress,
                              color: kGray,
                              verticalPadding: width / 170,
                              horizontalPadding: width / 42.5,
                              border: roundedInputBorder(),
                              focusedBorder: roundedFocusedBorder(),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height / 64),
                            child: CustomTextField(
                              innerText: null,
                              hintText: 'رقم الهاتف',
                              fontSize: width / 85,
                              width: width / 2.42,
                              controller: phone,
                              onChanged: (text) {},
                              readOnly: false,
                              obscure: false,
                              suffixIcon: null,
                              keyboardType: TextInputType.phone,
                              color: kGray,
                              verticalPadding: width / 170,
                              horizontalPadding: width / 42.5,
                              border: roundedInputBorder(),
                              focusedBorder: roundedFocusedBorder(),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height / 64),
                            child: Row(
                              children: [
                                CustomTextField(
                                  innerText: null,
                                  hintText: 'كلمة السر',
                                  fontSize: width / 85,
                                  width: width / 5,
                                  controller: confirmPassword,
                                  onChanged: (text) {},
                                  readOnly: false,
                                  obscure: obscurePassword,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      obscurePassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      size: width / 65,
                                      color: kOffWhite,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        obscurePassword = !obscurePassword;
                                      });
                                    },
                                  ),
                                  keyboardType: null,
                                  color: kGray,
                                  verticalPadding: width / 170,
                                  horizontalPadding: width / 42.5,
                                  border: roundedInputBorder(),
                                  focusedBorder: roundedFocusedBorder(),
                                ),
                                SizedBox(width: width / 64),
                                CustomTextField(
                                  innerText: null,
                                  hintText: 'تأكيد كلمة السر',
                                  fontSize: width / 85,
                                  width: width / 5,
                                  controller: password,
                                  onChanged: (text) {},
                                  readOnly: false,
                                  obscure: obscureConfirmPassword,
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      obscureConfirmPassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      size: width / 65,
                                      color: kOffWhite,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        obscureConfirmPassword =
                                            !obscureConfirmPassword;
                                      });
                                    },
                                  ),
                                  keyboardType: null,
                                  color: kGray,
                                  verticalPadding: width / 170,
                                  horizontalPadding: width / 42.5,
                                  border: roundedInputBorder(),
                                  focusedBorder: roundedFocusedBorder(),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(vertical: height / 64),
                            child: Row(
                              children: [
                                CustomDropDownMenu(
                                  hintText: 'الصف',
                                  fontSize: width / 85,
                                  width: width / 5,
                                  controller: grade,
                                  options: gradeList,
                                  onChanged: (text) {
                                    setState(() {
                                      grade = text;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.expand_more,
                                    size: width / 65,
                                    color: kOffWhite,
                                  ),
                                ),
                                SizedBox(width: width / 64),
                                CustomDropDownMenu(
                                  hintText: 'الفرع',
                                  fontSize: width / 85,
                                  width: width / 5,
                                  controller: section,
                                  options: sectionList,
                                  onChanged: (text) {
                                    setState(() {
                                      section = text;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.expand_more,
                                    size: width / 65,
                                    color: kOffWhite,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: height / 32, bottom: height / 64),
                            child: Button(
                              onTap: () async {
                                if (firstName.text != '' &&
                                    lastName.text != '' &&
                                    email.text != '' &&
                                    phone.text != '' &&
                                    password.text != '' &&
                                    confirmPassword.text == password.text &&
                                    section != null &&
                                    grade != null) {
                                  String passwordSha256 =
                                      hashCode(password.text);

                                  signUp(
                                      email.text,
                                      phone.text,
                                      passwordSha256,
                                      firstName.text,
                                      lastName.text,
                                      section,
                                      grade);
                                }
                              },
                              width: width / 2.42,
                              verticalPadding: 8,
                              horizontalPadding: 0,
                              borderRadius: 20,
                              buttonColor: kPurple,
                              border: 0,
                              child: Center(
                                child: Text(
                                  'أنشئ',
                                  style: textStyle.copyWith(
                                    fontSize: width / 85,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, LogIn.route);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: RichText(
                                  text: TextSpan(
                                text: 'عندك حساب؟ ',
                                style: textStyle.copyWith(
                                    fontSize: width / 100,
                                    color: kWhite,
                                    fontWeight: FontWeight.w800),
                                children: [
                                  TextSpan(
                                    text: 'سجل دخولك!',
                                    style: textStyle.copyWith(
                                      fontSize: width / 100,
                                      color: kPurple,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: width * 0.02),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.1,
                            child: VerticalDivider(
                              thickness: 1,
                              color: kGray,
                            ),
                          ),
                          Text(
                            'أو',
                            style: textStyle.copyWith(
                              color: kGray,
                              fontWeight: FontWeight.w800,
                              fontSize: width / 90,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.1,
                            child: VerticalDivider(
                              thickness: 1,
                              color: kGray,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: width * 0.02),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Button(
                            onTap: () {},
                            width: width * 0.035,
                            verticalPadding: 0,
                            horizontalPadding: 0,
                            borderRadius: 8,
                            buttonColor: kGray,
                            border: 0,
                            child: Padding(
                              padding: EdgeInsets.all(width * 0.0025),
                              child: const Image(
                                image: AssetImage('images/facebook_logo.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          Button(
                            onTap: () {},
                            width: width * 0.035,
                            verticalPadding: 0,
                            horizontalPadding: 0,
                            borderRadius: 8,
                            buttonColor: kGray,
                            border: 0,
                            child: Padding(
                              padding: EdgeInsets.all(width * 0.0025),
                              child: const Image(
                                image: AssetImage('images/google_logo.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 20),
                      child: Image(
                        image: const AssetImage('images/logo.png'),
                        width: width / 10,
                      ),
                    ),
                    Column(
                      children: [
                        RichText(
                            text: TextSpan(
                          text: textList[current][1],
                          style: textStyle.copyWith(
                              fontSize: width / 40,
                              color: kBlack,
                              fontWeight: FontWeight.w800),
                          children: <TextSpan>[
                            TextSpan(
                              text: textList[current][0],
                              style: textStyle.copyWith(
                                fontSize: width / 40,
                                color: kPurple,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        )),
                        SizedBox(height: height / 24),
                        SizedBox(
                          width: width * 0.4,
                          child: CarouselSlider(
                            items: imgList
                                .map(
                                  (item) => Image.asset(
                                    item,
                                    fit: BoxFit.contain,
                                    alignment: Alignment.centerLeft,
                                    width: width * 0.4,
                                  ),
                                )
                                .toList(),
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(() {
                                  current = index;
                                });
                              },
                              viewportFraction: 1,
                              autoPlay: true,
                            ),
                            carouselController: controller,
                          ),
                        ),
                        SizedBox(height: height / 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: imgList.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => controller.animateToPage(entry.key),
                              child: Container(
                                width: width / 55,
                                height: height / 55,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kBlack.withOpacity(
                                        current == entry.key ? 0.9 : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

final List<String> imgList = [
  'images/clock.png',
  'images/led.png',
  'images/magnifying_glass.png'
];

final List<List<String>> textList = [
  ['وقتك المحدود', 'استغل '],
  ['من ذكائك', 'زيد '],
  ['نقاط ضعفك', 'اكتشف ']
];
