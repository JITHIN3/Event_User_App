

import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 60,
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              width: double.infinity,
              child:
                   ElevatedButton(
                onPressed: () {},

                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2, //
                                color: Colors.white,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "jj",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'View basket',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                           "90",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrange.shade200,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(12), // <-- Radius
                  ),
                ),
              )

            ),
          ),
        ],
      ),
    );


  }
}
