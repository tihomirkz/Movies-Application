import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_application/models/movie_model.dart';

Widget movieCard({
  required BuildContext context,
  required Movie movie,
  required Null Function(Movie movie) onPressedLikeButton,
  required Null Function(BuildContext context, Movie movie) onTapMovie,
}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    margin: const EdgeInsets.all(8),
    elevation: 5,
    color: Colors.black12,
    child: ListTile(
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Stack(
                children: <Widget>[
                  posterImage(imageUrl: movie.posterurl),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () => onPressedLikeButton(movie),
                      iconSize: 50,
                      icon: Icon(movie.isLiked
                          ? Icons.favorite
                          : Icons.favorite_border,
                        color: movie.isLiked
                            ? Colors.red
                            : Colors.blueGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            text(text: movie.title),
            const SizedBox(height: 8),
            ratingBar(movie.avrRating),
            const SizedBox(height: 8),
            text(
              text: 'Rating: ${movie.avrRating.toStringAsFixed(1)}',
              size: 20,
            ),
          ],
        ),
      ),
      onTap: () => onTapMovie(context, movie),
    ),
  );
}

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
  double size = 25,
  Color color = Colors.white,}) {
  return Text(text,
    style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color
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

Widget textField({
  required TextEditingController controller,
  required String labelText,
  required TextInputAction action,
  required bool obscureText,
  required String? Function(String?) validator,
}) {
  return TextFormField(
    controller: controller,
    cursorColor: Colors.blueGrey,
    textInputAction: TextInputAction.next,
    obscureText: obscureText,
    decoration: InputDecoration(labelText: labelText),
    autovalidateMode: AutovalidateMode.disabled,
    validator: validator,
  );
}