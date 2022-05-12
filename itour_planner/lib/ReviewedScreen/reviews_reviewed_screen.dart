import 'package:flutter/material.dart';
import 'package:itour_planner/ReviewedScreen/model/review.dart';
import 'reviewed_container.dart';
import '../ToReviewScreen/reviews_to_review_screen.dart';

class ReviewsReviewedScreen extends StatefulWidget {
  const ReviewsReviewedScreen({Key? key}) : super(key: key);

  @override
  State<ReviewsReviewedScreen> createState() => _ReviewsReviewedScreenState();
}

class _ReviewsReviewedScreenState extends State<ReviewsReviewedScreen> {
  Color themeColor = const Color.fromRGBO(173, 37, 51, 1);

  final List<Review> _reviews = [
    Review(
      'Abdullah\'s Trip',
      'Damn-e-Koh',
      3,
      '25 Nov, 4:51am',
      'A panoramic view of capital of Pakistan',
      'Great View',
      'assets/ReviewPics/damn_e_koh.png',
    ),
    Review(
      'Lahore Trip',
      'Fortress',
      3,
      '21 Jan, 4:51am',
      'City of Lights',
      'Great View',
      'assets/ReviewPics/fortres.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reviews'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {},
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        backgroundColor: themeColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20),
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              alignment: Alignment.centerRight,
              child: OutlinedButton(
                child: const Text('To Review'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReviewsToReviewScreen(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  primary: themeColor,
                  side: BorderSide(
                    color: themeColor,
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            height: 500,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _reviews.length,
              itemBuilder: (context, index) => ReviewContainer(
                _reviews[index].tripName,
                _reviews[index].place,
                _reviews[index].rating,
                _reviews[index].date,
                _reviews[index].title,
                _reviews[index].description,
                _reviews[index].picture,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: themeColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: themeColor,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/BottomAppBarIcons/plan.png"),
              color: themeColor,
            ),
            label: 'Plan',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage("assets/BottomAppBarIcons/booking.png"),
              color: themeColor,
            ),
            label: 'Booking',
          ),
        ],
        selectedItemColor: themeColor,
        onTap: null,
      ),
    );
  }
}
