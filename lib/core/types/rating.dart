typedef RatingConverter = double Function(int rating);
double defaultRatingConverter(int rating) => rating / 2.0;

typedef RatingConverterToStr = String Function(int rating);
String defaultRatingConverterToStr(int rating) =>
    rating == 0 ? '0.0' : '${rating / 2.0}';

typedef RatingConverterToDB = int Function(double rating);
int defaultRatingConverterToDB(double rating) => (rating * 2.0).round();
