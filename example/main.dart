import 'package:openpanel_analytics/openpanel_analytics.dart';

String analyticsUrl = "https://api.openpanel.dev/";
const String analyticsName = "yourappname"; // this is actually the site name

void main() {
  Openpanel openpanel = Openpanel(analyticsUrl, analyticsName);
  // Send goal
  openpanel.event(name: 'Device', props: {
    'app_version': 'v1.0.0',
    'app_platform': 'windows',
    'app_locale': 'de-DE',
    'app_theme': 'darkmode',
  });

  // Page open event
  openpanel.event(name: "settings_page");

  // Click event
  openpanel.event();
}
