import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'backend/push_notifications/push_notifications_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterFlowTheme.initialize();

  FFAppState(); // Initialize FFAppState

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late Stream<PickupsFirebaseUser> userStream;
  PickupsFirebaseUser? initialUser;
  bool displaySplashImage = true;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = pickupsFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    jwtTokenStream.listen((_) {});
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() => displaySplashImage = false),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(String language) =>
      setState(() => _locale = createLocale(language));
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PICKUPS',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Builder(
              builder: (context) => Container(
                color: FlutterFlowTheme.of(context).primaryColor,
                child: Center(
                  child: Image.asset(
                    'assets/images/Logo_(2).png',
                    width: MediaQuery.of(context).size.width * 0.7,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : currentUser!.loggedIn
              ? PushNotificationsHandler(child: NavBarPage())
              : LoginWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'Packages';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'Packages': PackagesWidget(),
      'Deliveries': DeliveriesWidget(),
      'IntercomSupport': IntercomSupportWidget(),
      'Profile': ProfileWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      extendBody: true,
      bottomNavigationBar: Visibility(
        visible: responsiveVisibility(
          context: context,
          desktop: false,
        ),
        child: FloatingNavbar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() {
            _currentPage = null;
            _currentPageName = tabs.keys.toList()[i];
          }),
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          selectedItemColor: Color(0xFF17CF77),
          unselectedItemColor: FlutterFlowTheme.of(context).secondaryText,
          selectedBackgroundColor: Color(0x00000000),
          borderRadius: 10,
          itemBorderRadius: 8,
          margin: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
          width: double.infinity,
          elevation: 10,
          items: [
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FFIcons.kpackage,
                    color: currentIndex == 0
                        ? Color(0xFF17CF77)
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 24,
                  ),
                  Text(
                    'Packages',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: currentIndex == 0
                          ? Color(0xFF17CF77)
                          : FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FFIcons.kwalkTraced31,
                    color: currentIndex == 1
                        ? Color(0xFF17CF77)
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 24,
                  ),
                  Text(
                    'Deliveries',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: currentIndex == 1
                          ? Color(0xFF17CF77)
                          : FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FFIcons.khelpCircle,
                    color: currentIndex == 2
                        ? Color(0xFF17CF77)
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 24,
                  ),
                  Text(
                    'Support',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: currentIndex == 2
                          ? Color(0xFF17CF77)
                          : FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            ),
            FloatingNavbarItem(
              customWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FFIcons.kvector1,
                    color: currentIndex == 3
                        ? Color(0xFF17CF77)
                        : FlutterFlowTheme.of(context).secondaryText,
                    size: 24,
                  ),
                  Text(
                    'Profile',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: currentIndex == 3
                          ? Color(0xFF17CF77)
                          : FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 11.0,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
