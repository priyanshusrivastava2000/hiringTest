import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class slider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          viewportFraction: 0.8,
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        items: [
          'https://res.cloudinary.com/scarywings83289/image/upload/v1621168052/DISAC/1_fkcqam.jpg',
          'https://res.cloudinary.com/scarywings83289/image/upload/v1622797497/DISAC/2_rdkmke.jpg',
          'https://res.cloudinary.com/scarywings83289/image/upload/v1622732271/DISAC/4_jnwxyl.jpg',
          'https://res.cloudinary.com/scarywings83289/image/upload/v1621168039/DISAC/2_nsxzjl.jpg',
          'https://res.cloudinary.com/scarywings83289/image/upload/v1621168071/DISAC/5_l31yls.jpg',
        ].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width ,
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage("$i"),
                    )),
                // child: Image.network(
                //   "$i",
                //   // fit: BoxFit.,
                //   height: 250,

                //   width: 500,
                // ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}