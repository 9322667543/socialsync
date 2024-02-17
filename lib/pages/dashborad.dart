// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oneview/ApiCalling/PostWithApi.dart';
import 'package:oneview/GlobalVariables/Global.dart';
import 'package:oneview/pages/cardCarasol.dart';

// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
      super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    
    
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 100,
            //   child: SvgPicture.asset("assets/images/2.svg"),
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 18),
              child: Row(
                children: [
                  SizedBox(
                    height: 90,
                    width: 60,
                    child: SvgPicture.asset("assets/images/1.svg"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: Column(
                      children: [
                        Text(
                          "SocialSync",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "SEAMLESS CONTENT SHARING",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Recent Posts",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),
            SizedBox(height: 10),
            CarouselSlider(
              options: CarouselOptions(
                height: 260,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 2.0,
              ),
              items: imageUrls.map((url) {
                int index = imageUrls.indexOf(url);
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        // Handle card tap here
                      },
                      child: CardCarasol(
                        imageUrl: url.toString(),
                        title: titles[index],
                        likes: 0,
                        comments: 0,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              
              child: Text("Analysis", style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 32,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                child: SfCartesianChart(
                    // Enables the tooltip for all the series in chart
                    tooltipBehavior: _tooltipBehavior,
                    // Initialize category axis
                    primaryXAxis: CategoryAxis(),
                    series: <CartesianSeries>[
                      // Initialize line series
                      LineSeries<ChartData, String>(
                          // Enables the tooltip for individual series
                          enableTooltip: true,
                          dataSource: [
                            // Bind data source
                            ChartData('Jan', 35),
                            ChartData('Feb', 28),
                            ChartData('Mar', 34),
                            ChartData('Apr', 32),
                            ChartData('May', 40)
                          ],
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y)
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
