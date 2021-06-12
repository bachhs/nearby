class Movie {
  final int id, year, numOfRatings, criticsReview, metascoreRating;
  final double rating;
  final List<String> genra;
  final String plot, title, poster, backdrop, location, date;
  final List<Map> cast;

  Movie({
    required this.poster,
    required this.backdrop,
    required this.title,
    required this.id,
    required this.year,
    required this.date,
    required this.location,
    required this.numOfRatings,
    required this.criticsReview,
    required this.metascoreRating,
    required this.rating,
    required this.genra,
    required this.plot,
    required this.cast,
  });
}

// our demo data movie data
List<Movie> movies = [
  Movie(
    id: 1,
    title: "Nguyễn Phương Hằng livestream",
    year: 2021,
    date: "12/06/2021",
    location: "Đại Nam Văn hóa Du lịch Thể thao",
    poster: "assets/images/poster_1.jpg",
    backdrop: "assets/images/backdrop_1.jpg",
    numOfRatings: 150212,
    rating: 7.3,
    criticsReview: 50,
    metascoreRating: 76,
    genra: ["Drama"],
    plot: "Đại hội vạch mặt",
    cast: [
      {
        "orginalName": "Nguyễn Phương Hằng",
        "movieName": "Streamer",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Hoài Linh",
        "movieName": "Từ thiện",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Vy Oanh",
        "movieName": "Ca sĩ",
        "image": "assets/images/actor_3.png",
      },
    ],
  ),
  Movie(
    id: 2,
    title: "Việt Nam vs Malaysia",
    year: 2021,
    date: "11/06/2021",
    location: "Sân vận động Quốc gia Mỹ Đình",
    poster: "assets/images/poster_2.jpg",
    backdrop: "assets/images/backdrop_2.jpg",
    numOfRatings: 150212,
    rating: 8.2,
    criticsReview: 50,
    metascoreRating: 76,
    genra: ["Sport", "Football"],
    plot: "Vòng loại Giải vô địch bóng đá thế giới khu vực châu Á",
    cast: [
      {
        "orginalName": "Nguyễn Tiến Linh",
        "movieName": "Cầu thủ",
        "image": "assets/images/actor_4.png",
      },
      {
        "orginalName": "Quế Ngọc Hải",
        "movieName": "Cầu thủ",
        "image": "assets/images/actor_5.png",
      },
    ],
  ),
  Movie(
    id: 3,
    title: "Thaianh Diamond ra mắt",
    year: 2020,
    date: "25/10/2020",
    location: "Thái Anh Diamond",
    poster: "assets/images/poster_3.jpg",
    backdrop: "assets/images/backdrop_3.jpg",
    numOfRatings: 150212,
    rating: 7.6,
    criticsReview: 50,
    metascoreRating: 79,
    genra: ["Drama"],
    plot: "Hoài Linh làm từ thiện",
    cast: [
      {
        "orginalName": "Hoài Linh",
        "movieName": "Từ thiện",
        "image": "assets/images/actor_2.png",
      },
    ],
  ),
];
