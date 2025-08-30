
import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;
  EdgeInsets get safePadding => MediaQuery.of(this).padding;
  double get topPadding => MediaQuery.of(this).padding.top;
  double get bottomPadding => MediaQuery.of(this).padding.bottom;

  bool get isMobile => MediaQuery.of(this).size.width < 850;

  bool get isTablet =>
      MediaQuery.of(this).size.width >= 850 &&
          MediaQuery.of(this).size.width < 1100;

  bool get isDesktop => MediaQuery.of(this).size.width >= 1100;


  bool get isRTL => Directionality.of(this) == TextDirection.rtl;

  TextDirection get getDirection => Directionality.of(this) == TextDirection.rtl
      ? TextDirection.rtl
      : TextDirection.ltr;

  double getWidth({
    double? ratioMobile,
    double? ratioTablet,
    double? ratioDesktop,
    double? ratioDesktopOpenSideMenu,
    bool sideMenuIsOpen = false,
  }) {
    final screenWidth = MediaQuery.of(this).size.width;
    if (isMobile) {
      return screenWidth * (ratioMobile ?? 1.0);
    } else if (isTablet) {
      return screenWidth * (ratioTablet ?? 1.0);
    } else if (isDesktop) {
      return screenWidth *
          (sideMenuIsOpen
              ? (ratioDesktopOpenSideMenu ?? ratioDesktop ?? 1.0)
              : (ratioDesktop ?? 1.0));
    }
    return screenWidth;
  }

  double getWidthNElement({
    int? ratioMobile,
    int? ratioTablet,
    int? ratioDesktop,
    int? ratioDesktopOpenSideMenu,
    bool sideMenuIsOpen = false,
    double padding = 0.1,
  }) {
    final screenWidth = MediaQuery.of(this).size.width;

    if (isMobile) {
      return screenWidth * ratio(ratioMobile, padding, sideMenuIsOpen);
    } else if (isTablet) {
      return screenWidth * ratio(ratioTablet, padding, sideMenuIsOpen);
    } else if (isDesktop) {
      return screenWidth *
          (sideMenuIsOpen
              ? ratio(ratioDesktop, padding, sideMenuIsOpen)
              : ratio(ratioDesktop, padding, sideMenuIsOpen));
    }

    return screenWidth;
  }

  double ratio(int? value, double padding, bool sideMenuIsOpen) => value != null
      ? ((1 - padding - (sideMenuIsOpen ? 0.2 : 0)) / value)
      : 1.0;

  double getHeight({
    double? ratioMobile,
    double? ratioTablet,
    double? ratioDesktop,
  }) {
    final screenHeight = MediaQuery.of(this).size.height;

    if (isMobile) {
      return screenHeight * (ratioMobile ?? 1.0);
    } else if (isTablet) {
      return screenHeight * (ratioTablet ?? 1.0);
    } else if (isDesktop) {
      return screenHeight * (ratioDesktop ?? 1.0);
    }
    return screenHeight;
  }
}
