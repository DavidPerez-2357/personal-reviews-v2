int convertRatingToDB(double rating) {
  return (rating * 2).round();
}

double convertRatingToStars(int rating) {
  return rating / 2;
}

String convertDBRatingToStarsStr(int rating) {
  return rating.toStringAsFixed(1);
}
