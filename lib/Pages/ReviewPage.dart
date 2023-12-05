import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Review And Rating"),
      ),
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text('Rating : $'),
                RatingBar.builder(maxRating: 1,
                    itemBuilder: (context, _) =>
                        Icon(Icons.star, color: Colors.amber,),
                    onRatingUpdate: (rating) =>
                        setState(() {
                                  this.rating = rating;
                        }),)


              ],
            ),
          )),
    );
  }
}
