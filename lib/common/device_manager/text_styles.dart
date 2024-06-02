
import 'package:flutter/material.dart';

import 'colors.dart';
import 'screen_constants.dart';

class TextStyles {

  static TextStyle get titleWhite => TextStyle(
    color: AppColors.white,
    fontSize: FontSize.s39,
    fontWeight: FontWeight.w600,
    height: 3.0
  );
  static TextStyle get titleBlack => TextStyle(
      color: AppColors.blackTextColor,
      fontSize: FontSize.s20,
      fontWeight: FontWeight.w600,
  );
  static TextStyle get titleWhiteInLine => TextStyle(
      color: AppColors.white,
      fontSize: FontSize.s39,
      fontWeight: FontWeight.w600,
  );

  static TextStyle get landingSubTitleBlue => TextStyle(
    letterSpacing: 2.0,
    color: const Color(0xff009fe3),
    fontSize: FontSize.s18,
    fontWeight: FontWeight.w300,
  );
  static TextStyle get subTitleWhite => TextStyle(
    color: AppColors.white,
    fontSize: FontSize.s18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle get subTitleBlack => TextStyle(
    color: AppColors.blackTextColor,
    fontSize: FontSize.s18,
    fontWeight: FontWeight.w500,
  );
  static TextStyle get subTitleWhiteLight => TextStyle(
    color: AppColors.white,
    fontSize: FontSize.s16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle get subTitleBlackLight => TextStyle(
    color: AppColors.blackTextColor,
    fontSize: FontSize.s16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get title => TextStyle(
    color: AppColors.titleBlack,
    fontSize: FontSize.s16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle get title16Transparent => TextStyle(
    fontSize: FontSize.s16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle get titleSamiBold => TextStyle(
    color: AppColors.titleBlack,
    fontSize: FontSize.s24,
    fontWeight: FontWeight.w600,
  );
  static TextStyle get titleLight => TextStyle(
    color: AppColors.titleBlack,
    fontSize: FontSize.s18,
    fontWeight: FontWeight.w400,
  );
  static TextStyle get titleLightHighLighted => TextStyle(
    color: AppColors.primaryColor,
    fontSize: FontSize.s18,
    fontWeight: FontWeight.w400,
  );
  static TextStyle get subHeadings => TextStyle(
    color: AppColors.titleBlack,
    fontSize: FontSize.s15,
    fontWeight: FontWeight.w300,
  );
  static TextStyle get subHeadingsWithUnderLine => TextStyle(
    color: AppColors.titleBlack,
    decoration: TextDecoration.underline,
    fontSize: FontSize.s15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle get smallHintText => TextStyle(
    color: AppColors.titleBlack,
    fontSize: FontSize.s15,
    fontWeight: FontWeight.w400,
  );
  static TextStyle get smallHintTextHighLighted => TextStyle(
    color: AppColors.highLightedColor,
    fontSize: FontSize.s15,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get blankTest => TextStyle(
        color: Colors.white70,
        fontSize: FontSize.s30,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get toggleNo => TextStyle(
        color: AppColors.red,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get toggleYes => TextStyle(
        color: AppColors.primaryColor,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get statusMessage => TextStyle(
        fontSize: FontSize.s12,
        color: AppColors.completedButtonColor,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get availableTextGreen => TextStyle(
        fontSize: FontSize.s12,
        color: AppColors.completedButtonColor,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get unAvailableTextRed => TextStyle(
        fontSize: FontSize.s12,
        color: AppColors.red,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get tabViewTitle => TextStyle(
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get letterText => TextStyle(
        color: Colors.white70,
        fontSize: FontSize.s30,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get cardTitle => TextStyle(
        color: AppColors.titleBlack,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get cardTitleWhite => TextStyle(
        color: AppColors.white,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get cardColoredTitle => TextStyle(
        color: AppColors.primaryColor,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get cardGrayTitle => TextStyle(
        color: AppColors.lowerSubTitleBlack,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get cardGraySubTitle => TextStyle(
        color: AppColors.lowerSubTitleBlack,
        fontSize: FontSize.s12,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get dateSubTitle => TextStyle(
        color: AppColors.titleBlack,
        fontSize: FontSize.s13,
        fontWeight: FontWeight.w800,
      );



  static TextStyle get dashTitle => TextStyle(
        color: AppColors.white,
        fontSize: FontSize.s29,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get dashSubTitle => TextStyle(
        color: AppColors.white,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get inActiveIconText => TextStyle(
        color: AppColors.inActiveIconTextColor,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get highlightTitle => TextStyle(
        color: AppColors.highlightTitle,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get coloredHighlightTitle => TextStyle(
        color: AppColors.primaryColor,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get subTitle => TextStyle(
        color: AppColors.subTitleBlack,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get description => TextStyle(
        color: AppColors.titleBlack,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get descriptionMsg => TextStyle(
        color: AppColors.lowerSubTitleBlack,
        fontSize: FontSize.s12,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get bankDescriptionMsg => TextStyle(
        color: AppColors.titleBlack,
        fontSize: FontSize.s12,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get jobOffers => TextStyle(
        color: AppColors.primaryColor,
        fontSize: FontSize.s16,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get activityCardText => TextStyle(
        color: AppColors.primaryColor,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get activityCardTextSmall => TextStyle(
        color: AppColors.primaryColor,
        fontSize: FontSize.s12,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get upperSubTitle => TextStyle(
        color: AppColors.upperSubTitleBlack,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get subTitleDarkBlack => TextStyle(
        color: AppColors.subTitleDarkBlack,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get calenderText => TextStyle(
        color: AppColors.subTitleDarkBlack,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get calenderGraySubTitle => TextStyle(
        color: AppColors.graySubTitle,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get inActiveDateText => TextStyle(
        color: AppColors.inActiveDateColor,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get selectedDay => TextStyle(
        color: AppColors.subTitleBlack,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get currentDay => TextStyle(
        color: AppColors.completedButtonColor,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get subTitleHighlight => TextStyle(
        color: AppColors.primaryColor,
        fontSize: FontSize.s14,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get subTitleHighlightUnderline => TextStyle(
        color: AppColors.primaryColor,
        fontSize: FontSize.s14,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get lowerSubTitle => TextStyle(
        color: AppColors.lowerSubTitleBlack,
        fontSize: FontSize.s13,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get buttonText => TextStyle(
        color: AppColors.white,
        fontSize: FontSize.s15,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get invoiceButtonText => TextStyle(
        color: AppColors.white,
        fontSize: FontSize.s13,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get refuseButtonText => TextStyle(
        color: AppColors.refuseButtonText,
        fontSize: FontSize.s13,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get completeButtonText => TextStyle(
        color: AppColors.completeButtonText,
        fontSize: FontSize.s13,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get startButtonText => TextStyle(
        color: AppColors.white,
        fontSize: FontSize.s13,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get completedButtonText => TextStyle(
        color: AppColors.white,
        fontSize: FontSize.s13,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get inProgress => TextStyle(
        color: AppColors.saffronColor,
        fontSize: FontSize.s13,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get joinButtonText => TextStyle(
        color: AppColors.white,
        fontSize: FontSize.s12,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get addButtonText => TextStyle(
        color: AppColors.primaryColor,
        fontSize: FontSize.s12,
        fontWeight: FontWeight.w800,
      );

  static TextStyle get homeAppBarTitle => TextStyle(
    color: AppColors.titleBlack,
    fontSize: FontSize.s20,
    fontWeight: FontWeight.w500,
  );


  static TextStyle get notificationSubtitle => TextStyle(
    color: AppColors.notificationSubtitleColor,
    fontSize: FontSize.s13,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get greySubtitle => TextStyle(
    color: AppColors.greySubtitleColor,
    fontSize: FontSize.s16,
    fontWeight: FontWeight.w400,
  );


}
