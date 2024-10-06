import 'package:demo_app/core/Pages/add_user.dart';
import 'package:demo_app/core/Pages/company_info.dart';
import 'package:demo_app/core/Pages/device_info_page.dart';
import 'package:demo_app/core/Pages/sign_in.dart';
import 'package:demo_app/core/Pages/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../core/Pages/admin_dashboard.dart';
import '../core/Pages/dashboard_page.dart';
import '../core/Pages/personal_info_page.dart';
import '../core/Pages/power_suply_info_page.dart';
Map<String, WidgetBuilder> routes = {
  // '/':(context) => LoadingPage(),
  '/sign_up': (context) => SignUp(),
  '/sign_in': (context) => SignInPage(),
  '/home':(context) => DashboardPage(),
  '/personal_info':(context) => PersonalInformationPage(),
  '/company_info':(context) => CompanyInfoPage(),
  '/device_info':(context) => DeviceInfoPage(),
  '/power_info':(context) => PowerSupplyInfoPage(),
  '/admin_dashboard': (context) => DashboardScreen(),
  '/user_add': (context) => AddUserPage(),
  '/dashboard_1_page': (context) => DashboardPage()
};