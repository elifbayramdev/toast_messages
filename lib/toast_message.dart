import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

mixin ToastMixin<T extends StatefulWidget> on State<T> {
  void showToast({
    required BuildContext context,
    required String title,
    required String description,
    required EnumToastMessage type,
  }) {
    final toastData = ChooseToastType(type);
    final icon = toastData['icon'];
    final backgroundColor = toastData['backgroundColor'];
    final overlay = Overlay.of(context);
    // Declare overlayEntry as late to ensure it's initialized before usage
    late OverlayEntry overlayEntry;
    bool isOverlayVisible = true;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 70.0,
        left: MediaQuery.of(context).size.width * 0.05,
        right: MediaQuery.of(context).size.width * 0.05,
        child: Material(
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                icon,
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        description,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                GestureDetector(
                  child: SvgPicture.asset(
                    'images/close.svg',
                    width: 12,
                    height: 12,
                  ),
                  onTap: () {
                    if (isOverlayVisible) {
                      overlayEntry.remove();
                      isOverlayVisible = false;
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
    overlay.insert(overlayEntry);

    // Remove the toast after a delay, only if it's still visible
    Future.delayed(Duration(seconds: 3), () {
      if (isOverlayVisible && mounted) {
        overlayEntry.remove();
        isOverlayVisible = false;
      }
    });
  }
}

enum EnumToastMessage { info, success, warning, error }

Map<String, dynamic> ChooseToastType(EnumToastMessage typeToast) {
  SvgPicture icon;
  Color backgroundColor;

  switch (typeToast) {
    case EnumToastMessage.info:
      icon = SvgPicture.asset(
        'images/info.svg',
        width: 24,
        height: 24,
      );
      backgroundColor = Color.fromRGBO(234, 242, 255, 1);
      print("Info");
      break;
    case EnumToastMessage.success:
      icon = SvgPicture.asset(
        'images/success.svg',
        width: 24,
        height: 24,
      );
      backgroundColor = Color.fromRGBO(231, 244, 232, 1);
      print("Success");
      break;
    case EnumToastMessage.warning:
      icon = SvgPicture.asset(
        'images/warning.svg',
        width: 24,
        height: 24,
      );
      backgroundColor = Color.fromRGBO(255, 244, 228, 1);
      print("Warning");
      break;
    case EnumToastMessage.error:
      icon = SvgPicture.asset(
        'images/error.svg',
        width: 24,
        height: 24,
      );
      backgroundColor = Color.fromRGBO(255, 226, 229, 1);
      print("Error");
      break;
  }
  return {'icon': icon, 'backgroundColor': backgroundColor};
}
