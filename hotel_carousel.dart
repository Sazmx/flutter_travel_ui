import 'package:flutter/material.dart';

import 'package:flutterflow/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Exclusive Hotels',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2),
              ),
              GestureDetector(
                onTap: () => print('see all'),
                child: Text('See All',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.0)),
              )
            ],
          ),
        ),
        Container(
          height: 300,
          //color: Colors.blue,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: hotels.length,
            itemBuilder: (BuildContext context, int index) {
              Hotel hotel = hotels[index];
              return Container(
                margin: const EdgeInsets.all(10),
                width: 240.0,
                //color: Colors.red,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Positioned(
                      bottom: 15.0,
                      child: Container(
                        height: 120,
                        width: 240,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                hotel.name,
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                hotel.address,
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '\$${hotel.price} / per night',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0),
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          height: 180,
                          width: 220,
                          image: AssetImage(hotel.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
