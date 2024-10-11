import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const grandisExtendedFont = "Grandis Extended";

const Color primaryColor = Color(0xFFFF6161);

const MaterialColor primaryMaterialColor =
    MaterialColor(0xFF9581FF, <int, Color>{
  50: Color(0xFFFFECEC),
  100: Color(0xFFFFD0D0),
  200: Color(0xFFFFB0B0),
  300: Color(0xFFFF9090),
  400: Color(0xFFFF7979),
  500: Color(0xFFFF6161),
  600: Color(0xFFFF5959),
  700: Color(0xFFFF4F4F),
  800: Color(0xFFFF4545),
  900: Color(0xFFDD5656),
});

const Color blackColor = Color(0xFF16161E);
const Color blackColor80 = Color(0xFF45454B);
const Color blackColor60 = Color(0xFF737378);
const Color blackColor40 = Color(0xFFA2A2A5);
const Color blackColor20 = Color(0xFFD0D0D2);
const Color blackColor10 = Color(0xFFE8E8E9);
const Color blackColor5 = Color(0xFFF3F3F4);

const Color whiteColor = Colors.white;
const Color whileColor80 = Color(0xFFCCCCCC);
const Color whileColor60 = Color(0xFF999999);
const Color whileColor40 = Color(0xFF666666);
const Color whileColor20 = Color(0xFF333333);
const Color whileColor10 = Color(0xFF191919);
const Color whileColor5 = Color(0xFF0D0D0D);

const Color greyColor = Color(0xFFB8B5C3);
const Color lightGreyColor = Color(0xFFF8F8F9);
const Color darkGreyColor = Color(0xFF1C1C25);

const Color purpleColor = Color(0xFF7B61FF);
const Color successColor = Color(0xFF2ED573);
const Color warningColor = Color(0xFFFFBE21);
const Color errorColor = Color(0xFFEA5B5B);

const double defaultPadding = 16.0;
const double defaultBorderRadius = 12.0;
const Duration defaultDuration = Duration(milliseconds: 300);

final phoneNumberValidator = MultiValidator([
  RequiredValidator(errorText: 'Phone number is required'),
  MinLengthValidator(10, errorText: 'Phone Number is not valid'),
  PatternValidator(r'(^(?:[+0]9)?[0-9]{10,12}$)',
      errorText: 'Phone Number is not valid')
]);

final nameValidator = MultiValidator([
  RequiredValidator(errorText: 'Name is required'),
]);
