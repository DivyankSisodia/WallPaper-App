import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List wallPapers = [
    'https://media1.popsugar-assets.com/files/thumbor/W7xBMooTKm4JRstd4jojSYBoEqY=/0x0:7952x5304/fit-in/792x528/top/filters:format_auto():upscale()/2020/03/24/559/n/45101125/06c61ac25e79fc30a64224.30513518_.jpg',
    'https://i.natgeofe.com/k/dc7d6bb7-d935-49b2-ab3d-1fc835e4f937/Yosemitewaterfall.jpg?w=1084.125&h=609',
    'https://media.istockphoto.com/id/1146517111/photo/taj-mahal-mausoleum-in-agra.jpg?s=612x612&w=0&k=20&c=vcIjhwUrNyjoKbGbAQ5sOcEzDUgOfCsm9ySmJ8gNeRk=',
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 70, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Material(
                  elevation: 15,
                  borderRadius: BorderRadius.circular(60),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      'https://wallpapers.com/images/featured/cartoon-boy-r6qnug511q4yq3g7.jpg',
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ),
                const Gap(85),
                Text(
                  'Wallify',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
            const Gap(20),
            CarouselSlider.builder(
              itemCount: wallPapers.length,
              itemBuilder: (context, index, realIndex) {
                final res = wallPapers[index];
                return buildImage(res, index);
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 1.5,
                autoPlayInterval: const Duration(seconds: 4),
                autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                aspectRatio: 2.0,
                initialPage: 2,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),
            const Gap(20),
            buildIndicator(),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: wallPapers.length,
      effect: const ExpandingDotsEffect(
        activeDotColor: Colors.blue,
        dotColor: Colors.grey,
        dotHeight: 10,
        dotWidth: 12,
        spacing: 6,
      ),
    );
  }

  Widget buildImage(String url, int index) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
