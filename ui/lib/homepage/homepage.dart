import 'package:flutter/material.dart';
import 'package:ui/theme.dart';
import 'details/details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Howdy,\n${'Izukishi'}',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              height: 1.5),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Where to fly today?',
                          style: subgeneralText,
                        ),
                      ],
                    ),
                    // button circle profile
                    InkWell(
                      borderRadius: BorderRadius.circular(35),
                      onTap: () {},
                      child: const CircleAvatar(
                        radius: 35,
                        backgroundImage:
                            AssetImage('assets/images/profile.jpg'),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.27,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (int i = 0; i < 5; i++)
                      popularList(
                          'Lake Ciliwung',
                          'Tangerang',
                          'image 1.png',
                          'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                          ['carousell/3.jpg', 'carousell/4.jpg'],
                          ['Kids Park', 'City Museum', 'Central Mall'],
                          '2.500.000',
                          4.8,
                          ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New This Year', style: titleGeneralText),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    for (int i = 0; i < 5; i++)
                      commonList(
                          'Danau Deratan',
                          'Singaraja',
                          'image 2.png',
                          'Pura Ulun Danu Beratan, pura yang sangat unik karena lokasi pura berada di tengah danau. Pada saat air danau naik, pura Ulun Danu Bratan Bedugul akan terlihat terapung pada permukaan air danau.',
                          ['carousell/3.jpg', 'carousell/4.jpg'],
                          ['Beautiful Lake', 'Shrine', 'Nature'],
                          '1.500.000',
                          4.8,
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget popularList(String title, String destination, String image,
      String desc, List<String> photos, List<String> interest, String price, double rating) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(
                title: title,
                destination: destination,
                image: image,
                desc: desc,
                photos: photos,
                interest: interest,
                price: price,
                rating: rating,
                ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: double.infinity,
        margin: const EdgeInsets.only(left: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    image: AssetImage('assets/images/$image'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: miniBanner,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(destination, style: subMiniBanner)
            ],
          ),
        ),
      ),
    );
  }

  Widget commonList(
    String title,
    String destination,
    String image,
    String desc,
    List<String> photos,
    List<String> interest,
    String price,
    double rating,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(
                title: title,
                destination: destination,
                image: image,
                desc: desc,
                photos: photos,
                interest: interest,
                price: price,
                rating: rating,
                ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
          width: double.infinity,
          height: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      height: MediaQuery.of(context).size.height * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage('assets/images/$image'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              height: 1.5),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          destination,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              height: 1.5,
                              color: Colors.grey),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      rating.toString(),
                      style: subMiniBanner,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
