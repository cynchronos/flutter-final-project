import 'package:flutter/material.dart';
import 'package:ui/theme.dart';
import 'details/details.dart';
import 'homepage_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.firstname});

  final String firstname;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Future<Map<String, List<dynamic>>> fetchDestinationData() async {
      FetchService fetchData = FetchService();
      Object destination = await fetchData.fetchDestination();

      Map data = destination as Map;

      List<dynamic> destinationList = data['data'];

      List<dynamic> popularDest = [];
      List<dynamic> commonDest = [];

      for (int i = 0; i < destinationList.length; i++) {
        final item = destinationList[i];
        if (item['type'] == 'popular') {
          popularDest.add(item);
        } else if (item['type'] == 'common') {
          commonDest.add(item);
        }
      }

      return {
        'popular': popularDest,
        'common': commonDest,
      };
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        body: FutureBuilder<Map<String, List<dynamic>>>(
            future: fetchDestinationData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final popularDest = snapshot.data!['popular'];
                final commonDest = snapshot.data!['common'];
                return SingleChildScrollView(
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
                                Text(
                                  'Howdy,\n${widget.firstname}',
                                  style: const TextStyle(
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
                              onTap: () {
                                fetchDestinationData();
                              },
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
                        child: ListView.builder(
                            itemCount: popularDest?.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final item = popularDest?[index];

                              return popularList(
                                item['name'],
                                item['location'],
                                'image 1.png',
                                item['description'],
                                ['carousell/3.jpg', 'carousell/4.jpg'],
                                List<String>.from(item['interest']),
                                item['price'],
                                item['rating'].toDouble(),
                              );
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 30, top: 30, right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('New This Year', style: titleGeneralText),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02,
                            ),
                            for (int i = 0; i < commonDest!.length; i++)
                              commonList(
                                commonDest[i]['name'],
                                commonDest[i]['location'],
                                'image 2.png',
                                commonDest[i]['description'],
                                ['carousell/3.jpg', 'carousell/4.jpg'],
                                List<String>.from(commonDest[i]['interest']),
                                commonDest[i]['price'],
                                commonDest[i]['rating'].toDouble(),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }

  Widget popularList(
      String title,
      String destination,
      String image,
      String desc,
      List<String> photos,
      List<String> interest,
      int price,
      double rating) {
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
    int price,
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
