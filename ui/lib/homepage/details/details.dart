import 'package:flutter/material.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'package:ui/theme.dart';
import 'package:intl/intl.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    super.key,
    required this.title,
    required this.destination,
    required this.image,
    required this.desc,
    required this.photos,
    required this.interest,
    required this.price,
    required this.rating,
  });

  final String title;
  final String desc;
  final String image;
  final int price;
  final String destination;
  final List<String> photos;
  final List<String> interest;
  final double rating;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final formattedPrice = NumberFormat("#,###", "id_IDR");
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    String priceText = formattedPrice.format(widget.price);

    return Scaffold(
      backgroundColor: const Color(0xffFAFAFA),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IDR $priceText',
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              height: 1.5),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          widget.destination,
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1.5),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xff5C40CC),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: 20,
                        ),
                      ),
                      child: Text('Book Now', style: btnText),
                    ),
                  ],
                ),
              )
            ],
          ),
          Stack(
            children: [
              ClipRRect(
                child: SizedBox(
                  height: screenHeight / 2.3,
                  width: screenWidth,
                  child: Image.asset(
                    "assets/images/${widget.image}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: screenHeight / 2.3,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.1),
                      Color.fromRGBO(0, 0, 0, 0.2),
                      Color.fromRGBO(0, 0, 0, 0.3),
                      Color.fromRGBO(0, 0, 0, 0.4),
                      Colors.black,
                    ],
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 24, right: 24, bottom: 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.title, style: titleDetails),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.destination,
                                style: subtitleDetails,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.yellow,
                                size: 24,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.rating.toString(),
                                style: ratingDetails,
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Image.asset(
                            'assets/icons/navigationemblem.png',
                            width: 108,
                            height: 24,
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: screenWidth / 3),
                  child: ShowUpAnimation(
                    animationDuration: const Duration(seconds: 1),
                    curve: Curves.bounceIn,
                    direction: Direction.vertical,
                    offset: 0.5,
                    child: cardDesc(screenWidth, screenHeight),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cardDesc(screenWidth, screenHeight) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.43,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            top: screenHeight * 0.02,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('About', style: titleGeneralText),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(widget.desc, style: descriptionText),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Text('Photos', style: titleGeneralText),
                if (widget.photos.isNotEmpty)
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                widget.photos.isNotEmpty
                    ? Row(
                        children: [
                          for (String photo in widget.photos) gallery(photo),
                        ],
                      )
                    : Text('Tidak ada Foto', style: descriptionText),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Text('Interest', style: titleGeneralText),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                widget.interest.isNotEmpty
                    ? Column(
                        children: [
                          for (String interest in widget.interest)
                            interestedList(interest),
                        ],
                      )
                    : Text('Tidak ada Interest', style: descriptionText),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget gallery(String image) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.asset(
          "assets/images/$image",
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget interestedList(String interest) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.asset(
            "assets/icons/checkcircle.png",
            width: 16,
            height: 16,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(interest, style: descriptionText),
      ],
    );
  }
}
