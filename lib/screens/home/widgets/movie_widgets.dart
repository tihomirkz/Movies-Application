import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget ratingBar(double rating) {
  return RatingBarIndicator(
    rating: rating,
    itemCount: 10,
    itemSize: 25.0,
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, _) => const Icon(
      Icons.star,
      color: Colors.amber,
    ),
  );
}

Text text({
  required String text,
  double size = 25, }) {
  return Text(text,
    style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: Colors.white
    ),
  );
}

Widget posterImage({required String imageUrl}) {
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(10.0),
    ),
    child: CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) =>
      const Image(image: AssetImage('assets/images/no_poster.jpg')),
    ),
  );
}