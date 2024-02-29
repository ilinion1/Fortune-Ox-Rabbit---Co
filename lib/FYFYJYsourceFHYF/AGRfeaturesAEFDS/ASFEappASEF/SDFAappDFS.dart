import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/ZSEFutilsSZF/EZSEFmystery_init_audioZSF/XDRinit_audioXDBF.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/ERGdate_time_controllerFRG.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/VZDfirst_time_controllerDEF.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fortune/FYFYJYsourceFHYF/SAEFcommonASFEA/SZFEwidgetsSZFE/ETRanim_splashNHF.dart';
import 'package:fortune/FYFYJYsourceFHYF/AGRfeaturesAEFDS/ASFEappASEF/HGFHcontrollersGDFH/ZCXVmoney_controllerXZCV.dart';

class App extends StatelessWidget {
  const App({super.key, required this.pref});

  final SharedPreferences pref;

  @override
  Widget build(BuildContext context) {
    return YEYInitAudioAGRSG(
      pref: pref,
      child: ScreenUtilInit(
        designSize: const Size(393, 852),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => EFAEMoneyCubitASEFAE(pref),
            ),
            BlocProvider(
              create: (context) => AFEADateTimeCubitAEFAE(pref),
            ),
            BlocProvider(
              create: (context) => ASEFAFirstTimeCubitAEFAS(pref),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Mystery',
            theme: ThemeData.dark(
              // fontFamily: 'Poppins',
              useMaterial3: true,
            ).copyWith(
              scaffoldBackgroundColor: Colors.transparent,
              textTheme: const TextTheme(
                bodySmall: TextStyle(fontFamily: 'Poppins'),
                bodyMedium: TextStyle(fontFamily: 'Poppins'),
                bodyLarge: TextStyle(fontFamily: 'Poppins'),
              ),
            ),
            home: const FAESProgressBarSAEFDS(),
          ),
        ),
      ),
    );
  }
}
