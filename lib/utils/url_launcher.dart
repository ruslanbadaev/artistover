import 'package:url_launcher/url_launcher.dart';

import 'constants/strings.dart';

abstract class UrlLauncher {
  static void goTo(String link) async {
    if (!await launch(link)) throw AppStrings.COULD_NOT_LAUNCH;
  }
}
