import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperUtils {
  static const webBaseUrl = 'http://albausalah.blueraydev.com';
  static const _androidMobileType = '1';
  static const _iOSMobileType = '2';

  static void launchExternalUrl(String webUrl) async {
    var webUri = Uri.parse(webUrl);
    var isLaunched =
        await launchUrl(webUri, mode: LaunchMode.externalApplication);

    if (!isLaunched) {
      Get.snackbar('open_external', 'open_external_error');
    }
  }

  static Future<String?> importImage() async {
    if (Platform.isIOS) {
      var status = await Permission.photos.status;
      if (status.isPermanentlyDenied) {
        Get.snackbar(
          'upload_image'.tr,
          'permission_permanent_denied'.tr,
          onTap: (snack) {
            openAppSettings();
          },
        );
        return null;
      }
    }
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    return image?.path;
  }

  static String getMobileType() {
    if (Platform.isAndroid) {
      return _androidMobileType;
    } else if (Platform.isIOS) {
      return _iOSMobileType;
    } else {
      return _androidMobileType;
    }
  }
}
