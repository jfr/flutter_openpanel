import 'package:flutter_test/flutter_test.dart';
import 'package:openpanel_analytics/openpanel_analytics.dart';

const String serverUrl = "https://api.openpanel.dev/";
const String domain = "example.com";
const String name = "pageview";
const String url = "app://localhost/test";
const String referrer = "app://localhost/referrer";
const String screenWidth = "1000x1000";

void main() {
  test('make openpanel event call with pageview', () async {
    final openpanel = Openpanel(serverUrl, domain, screenWidth: screenWidth);
    expect(openpanel.serverUrl, serverUrl);
    expect(openpanel.domain, domain);
    expect(openpanel.screenWidth, screenWidth);

    final event = openpanel.event();
    expect(await event, 202);
  });

  test('make openpanel event call with custom event', () async {
    final openpanel = Openpanel(serverUrl, domain, screenWidth: screenWidth);
    expect(openpanel.serverUrl, serverUrl);
    expect(openpanel.domain, domain);
    expect(openpanel.screenWidth, screenWidth);

    final event = openpanel.event(
        name: 'conversion', page: 'homescreen', referrer: 'referrerPage');
    expect(await event, 202);
  });

  test('check disabled call', () async {
    final openpanel = Openpanel(serverUrl, domain, screenWidth: screenWidth);
    openpanel.enabled = false;
    expect(openpanel.serverUrl, serverUrl);
    expect(openpanel.domain, domain);
    expect(openpanel.screenWidth, screenWidth);

    final event = openpanel.event(
        name: 'conversion', page: 'homescreen', referrer: 'referrerPage');
    expect(await event, 0);
  });

  test('check failed http request', () async {
    final openpanel =
        Openpanel("somewrongurl.asd21", domain, screenWidth: screenWidth);
    expect(openpanel.serverUrl, "somewrongurl.asd21");
    expect(openpanel.domain, domain);
    expect(openpanel.screenWidth, screenWidth);

    final event = openpanel.event(
        name: 'conversion', page: 'homescreen', referrer: 'referrerPage');
    expect(await event, 1);
  });
}
