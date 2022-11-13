import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:ids_backend/api.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ids_backend/cards/live_match_card.dart';
import 'package:ids_backend/pages/Live_match_update.dart';
import 'package:ids_backend/pages/leaderboard_page.dart';
import 'package:ids_backend/pages/live_match_page.dart';
import 'package:ids_backend/pages/schedule_page.dart';
import 'package:ids_backend/sheetfields.dart';
import 'dart:convert' as convert;
import 'package:workmanager/workmanager.dart';

const credentials = r'''
{
  "type": "service_account",
  "project_id": "idsapp-367514",
  "private_key_id": "3f6cd1909851fb1ef97ce904efdbb1e94c077f68",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCysFYRHItDHWoy\nwXKY6VqR9L7wV3nLkHZZyiC3PMEnuM1Zz1oHwdv1El8a5spwr7LJwhfzg8hTwcNa\nZLx0dEp4vuHZJxZ1WudgtS0h471EYicApjozae+8bfVl1YLXBusnvnWPqw3PFPvI\n1FB5at9hRj+Q7jIcNdSNGMpvfemT2y7lCbAerH18bjKNzMdjeQAM13Bd7kEF2yfY\n68bPwAaj4XQ5Y0YgKqJl1hponPlwPVAP/BliQG1LhAFmiI4kfSpfmMTTFeHH7dzQ\nmhoT1V00mS87T6w44uE89PgxFqWSm9365KMpS5wiOyO0QCQ9ELU/Kn3e93VXhZe9\nydupVJ1nAgMBAAECggEAOEm06vH/anZnIDLw6vtDRQwAY8xieP36UiGKeb5BKEae\nJWbceOoX5FTTsbE23xVxr/2ctuBx5/R3Gc/2z4ZceTnEAjg+alxm239nBrBrTBHR\nMHKsjcqWstg+f8Qo0ZyD0gK8nLOpB20YPXSoHv9L+6P53SkzjtBkMsg26LUUsbbH\nt3PprmJhcTtv9Fk3B+C+YQcOViWqGH5oVzfh+V9oV8X+v4rcoZMOsu7xyb1Nf0D2\nlahZB9OD1NOVPDwFijlJ0EFoPyXta4bgo9QzgVrPTJ7icnPaYXgHk3SM9EyzZ1Tb\nn1Rwt2/Qh/D7AnnX3LkxAu2Sp7IjTVEcK7Y3ux7FaQKBgQDux/rxg/Yf05FdYcTJ\nTUSayJJu24awJ/3h/gaAGuU+/LF2Q6lsIOLS5aZv+SXXiKPD4LgaKEmm861MXPMQ\nvRFZSJ8B5lHEFV6jdbu7VJ7Qk238UMkgbYHIUiaSPv75D1OShqbPCBpTgiqlbtX3\nuF1mm7zzfUFdaDs3u6ZWfIuAPwKBgQC/kwVeQXp0mut81yX9lu4GvcT6zFq0Izts\nyNgUbQbavCvDYtkd88CDO3FcPg+hLOsjVOIQAIMp9rOFMVlNFsiT1MxVIY1qwQ7b\n+KDigbQFVf0y4xs9xfri8dXwVGtkhAXvQTm6z0AT6HIF4edD0WCrA3+5hlBK3rMr\nwvEGyTEY2QKBgHmqegnvlEw5L/tl4rAzZ756bmp//svpRKqPFd7WVXLXrNC2vy/y\nPcD59OlfCNIetFsNOKFTX9vqk6WyQsOHorxcjXCZW5ZO0S72wVY9UsKyLDuBKkoU\noilg+nhQEvjyv0GMzJf25/se+v3aULntPeIXfpqOeuzOPEY0nhe5VBdfAoGAdlB7\ngUHZOgivpTNO8DX1nU44SFhLMHON8Np9sOfA0vhh4tK6mqf+3k2o7joZ9wXB1tlG\noHFgkFsfdgQLTfPjPoGvDGijaSoAXlRIMHvATYdUz8e4/Ea4cs6+vSW2CacL7z6O\nQ9RZk7H8MavZ42V9WUDY8iCEmCi/6SgFKZa57skCgYB+MZz58Vcpvnu5zgJ93q59\n5/CVEekXTGY0T3E15xwSIylJhSlJY3goKsPuQ9sd6kq4XJZJ2R5odM2qVZImAeFw\nksXBI/5ZxxGTIVPbKDTLSQB6Bvob9jUzEU8PdCr0OQksuxd8Z13yT+z7ZCfBaTC1\nhqRGcTbjWSxSvHKprB/Lhg==\n-----END PRIVATE KEY-----\n",
  "client_email": "idsappbackend@idsapp-367514.iam.gserviceaccount.com",
  "client_id": "101193501222030579447",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/idsappbackend%40idsapp-367514.iam.gserviceaccount.com"
}

''';

const spreadsheetId = '1COH4LmB1F-6WMKKBCQJD7SXvzmcbozUSO_zkpNJM9jE';

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    print('Task is executing bich niggha!');
    return Future.value(true);
  });
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await UserSheetsApi.init();

  Workmanager().initialize(callbackDispatcher);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController cricketController = TextEditingController();
  TextEditingController playerController = TextEditingController();
  TextEditingController runsController = TextEditingController();
  List<FeedbackForm> schedulepage = <FeedbackForm>[];
  int serial = 1;
  var jss;
  getScheduleFromSheet() async {
    var raw = await http.get(Uri.https(
        'https://script.googleusercontent.com/macros/echo?user_content_key=F-FZmrlP1eX4T6T9lU8Kr5hgMkOTfrtcREZbK9uv7NZ_jgsMLu-uPHFzHbjcySt6V318ub0m0ThYf-zJOC-U6irnM-OEV23tm5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnJVzqLhjB0f02cp9oeE9jqfMOgUtcHafJbRnr-g0ZNlGolpVqn4C49M6QOx3G5FDHw&lib=MinjJ1scBg8ZCAIkbLgp2E4AnPvVPRreW'));
    var jsonfeedback = convert.jsonDecode(raw.body);
    print('lullaby=${raw.body}');
  }

  @override
  void initState() {
    getScheduleFromSheet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
        ],
        routes: {
          "/live_match_update": (_) => const Live_match_update(),
        },
        home: MediaQuery(
          data: const MediaQueryData(),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Inter-NIT Cricket'),
                  bottom: const TabBar(
                    tabs: [
                      Tab(text: "LIVE MATCH", icon: Icon(Icons.sports_cricket)),
                      Tab(text: "LEADERBOARD", icon: Icon(Icons.leaderboard)),
                      Tab(text: "SCHEDULE", icon: Icon(Icons.schedule)),
                    ],
                  ),
                  elevation: 20,
                ),
                body: const TabBarView(
                  children: [
                    Live_match_page(),
                    Leaderboard_page(),
                    Schedule_page()
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
