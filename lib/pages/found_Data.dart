import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/Providers/weather_provider.dart';
import 'package:weatherapp/pages/search_screen.dart';
import 'package:weatherapp/pages/setting_page.dart';

import '../Providers/theme_Provider.dart';
import '../Services/weather_service.dart';
import '../catgeory/weatherItems_catgeory.dart';
import '../generated/l10n.dart';
import '../models/weather_model.dart';
import 'aboutUs.dart';
import 'home_screen.dart';

class foundData extends StatelessWidget {
  const foundData({super.key});

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    Brightness theme = Provider.of<ThemeProvider>(context).thememode;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: weatherData!.getColor()!,
        title: Text('${S.of(context).weather} 🌤 ',
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'palabi')),
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const Searchpage(),
                  )),
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const HomeScreen(),
                  )),
              icon: const Icon(Icons.home)),
          const BackButton()
        ],

      ),
      drawer: Drawer(
          child: ListView(itemExtent: 150,
            shrinkWrap: true,
            children: [
              DrawerHeader(
                decoration:  BoxDecoration(color: (theme == Brightness.light)
                    ? lightpurple
                    : darkpurple),
                child: Center(
                  child: Text(
                    "KA Weather",
                    style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'palabi',
                        fontSize: 20.sp),
                  ),
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 10.h),
                child: ListTile(tileColor: Colors.purpleAccent.shade200 ,
                  title: Center(
                    child: Row(
                      children: [
                        Text(S.of(context).settings, style: TextStyle(
                          fontFamily: 'palabi',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),),const Spacer(),
                        Lottie.asset('assets/lottie/Animation - 1712587002465.json',height: 50.h,width: 50.w)
                      ],
                    ),
                  ),
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => const Setting())),
                ),
              ),
              ListTile(tileColor: Colors.amberAccent ,
                title: Center(
                  child: Row(
                    children: [
                      Text(S.of(context).AboutUs, style: TextStyle(
                        fontFamily: 'palabi',
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),),const Spacer(),
                      Lottie.asset('assets/lottie/Animation - 1713422813806.json',height: 50.h,width: 50.w)
                    ],
                  ),
                ),
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const aboutUs())),
              ),
            ],
          )),
      body:
       Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
              weatherData!.getColor()![600]!,
              weatherData!.getColor()![400]!,
              weatherData!.getColor()![200]!,
              weatherData!.getColor()![100]!,
            ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.mirror)),
        width: double.infinity,
        height: double.infinity,
        child: RefreshIndicator(
            backgroundColor: Colors.purpleAccent,
            onRefresh: () async {
              Weatherservice service = Weatherservice();
              WeatherModel weather =
                  await service.getweather(cityname: Provider.of<WeatherProvider>(context,listen:false).cityname!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
            },
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        Provider.of<WeatherProvider>(context).cityname!.toUpperCase(),
                        style:  TextStyle(
                            shadows: const [
                              Shadow(
                                  color: Colors.grey,
                                  offset: Offset(3, 3),
                                  blurRadius: 10)
                            ],
                            fontSize: 30.sp,
                            fontFamily: 'palabi',
                            fontWeight: FontWeight.bold)),
                     Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                      child: const Divider(thickness: 2, color: Colors.grey),
                    ),
                  ],
                ), //city-nam
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Chip(
                      backgroundColor: Colors.purpleAccent.shade100,
                      label: Text(
                        '${weatherData!.temp.toInt()}°',
                      ),
                      labelStyle:  TextStyle(
                          shadows: const [
                            Shadow(
                                color: Colors.grey,
                                offset: Offset(3, 3),
                                blurRadius: 10),
                          ],
                          fontSize: 30.sp,
                          fontFamily: 'palabi',
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Divider(thickness: 2, color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Chip(
                        backgroundColor: Colors.purpleAccent.shade100,
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              Provider.of<WeatherProvider>(context)
                                  .weatherData!
                                  .getsituation(context),
                            ),
                            Image.network(
                              "http:${weatherData!.icon}",
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                            ),
                          ],
                        ),
                        labelStyle:  TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: 'palabi',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            shadows: const [
                              Shadow(
                                  color: Colors.grey,
                                  offset: Offset(3, 3),
                                  blurRadius: 10)
                            ]),
                      ),
                    ),
                    WeatherItems(
                      paddingToRow: 100.w,
                      iconOfText: Icons.ac_unit,
                      colorOfIcon: Colors.purpleAccent,
                      txt: S.of(context).itsfeels,
                      colorOfContainerOfTxt: Colors.white,
                      colorOfContainerOfData: Colors.grey,
                      data:'${weatherData!.feelslike_c.toInt()}°',
                      colorOfData: Colors.black,
                      colorOfTxt: weatherData!.getColor()![900]!,
                    ),
                  ],
                ),

// e and divider
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 25.h),
                  child: SizedBox(
                    height: 100.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherItems(
                          iconOfText: Icons.hourglass_top_outlined,
                          colorOfIcon: Colors.grey,
                          txt: S.of(context).lastupdate,
                          colorOfContainerOfTxt: Colors.purple.shade400,
                          colorOfContainerOfData: Colors.purpleAccent.shade100,
                          data: weatherData!.time,
                          paddingToRow: 100.w,
                          colorOfData: Colors.white,
                          colorOfTxt: Colors.white,
                        ), //last update
                        const VerticalDivider(
                          thickness: 2,
                          color: Colors.grey,
                        ),
                        WeatherItems(
                          paddingToRow: 100.w,
                          iconOfText: Icons.date_range,
                          colorOfIcon: Colors.grey,
                          txt: S.of(context).Date,
                          colorOfContainerOfTxt: Colors.white,
                          colorOfContainerOfData: Colors.grey,
                          data: weatherData!.date,
                          colorOfData: Colors.black,
                          colorOfTxt: weatherData!.getColor()![900]!,
                        ),
                      ],
                    ),
                  ),
                ), //date&last update
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const Divider(thickness: 2, color: Colors.grey),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20.h),
                  child: SizedBox(
                    height: 100.h,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              WeatherItems(
                                paddingToRow: 100.w,
                                iconOfText: Icons.maximize_outlined,
                                colorOfIcon: Colors.red,
                                txt: S.of(context).maxtemp,
                                colorOfContainerOfTxt: Colors.white,
                                colorOfContainerOfData: Colors.grey,
                                data: '${weatherData!.maxtemp.toInt()}°',
                                colorOfData: Colors.black,
                                colorOfTxt: weatherData!.getColor()![900]!,
                              ),
                            ],
                          ),
                           VerticalDivider(
                              thickness: 2, color: Colors.grey, width: 20.w),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                WeatherItems(
                                  paddingToRow: 100.w,
                                  iconOfText: Icons.minimize_outlined,
                                  colorOfIcon: Colors.blue,
                                  txt: S.of(context).mintemp,
                                  colorOfContainerOfTxt: Colors.white,
                                  colorOfContainerOfData: Colors.grey,
                                  data: '${weatherData!.mintemp.toInt()}°',
                                  colorOfData: Colors.black,
                                  colorOfTxt: weatherData!.getColor()![900]!,
                                ),

                              ]),
                        ]),
                  ),
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const Divider(thickness: 2, color: Colors.grey),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: 20.h),
                  child: SizedBox(
                    height: 100.h,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              WeatherItems(
                                paddingToRow: 100.w,
                                iconOfText: Icons.scale,
                                colorOfIcon: Colors.amber,
                                txt: S.of(context).pressure,
                                colorOfContainerOfTxt: Colors.white,
                                colorOfContainerOfData: Colors.grey,
                                data:  " ${weatherData!.pressure.toInt()}  ${S.of(context).millibars}",
                                colorOfData: Colors.black,
                                colorOfTxt: weatherData!.getColor()![900]!,
                              ),
                            ],
                          ),
                           VerticalDivider(
                              thickness: 2, color: Colors.grey, width: 20.w),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                WeatherItems(
                                  paddingToRow: 100.w,
                                  iconOfText: Icons.water_drop,
                                  colorOfIcon: Colors.blueAccent,
                                  txt: S.of(context).Humidity,
                                  colorOfContainerOfTxt: Colors.white,
                                  colorOfContainerOfData: Colors.grey,
                                  data: "${weatherData!.humidity} %",
                                  colorOfData: Colors.black,
                                  colorOfTxt: weatherData!.getColor()![900]!,
                                ),

                              ]),
                        ]),
                  ),
                ),


              ],
            )),
      ),
    );
  }
}
