class HallsModel {
  String itemName;
  String imageUrl;
  String details;
  String location;
  String contactNo;
  List<HallReviewsModel> listHallReviews;
  List<HallImagesModel> listHallImages;
  List<HallAvailabilityModel> listHallAvailability;

  HallsModel({
    this.itemName,
    this.imageUrl,
    this.details,
    this.location,
    this.contactNo,
    this.listHallReviews,
    this.listHallImages,
    this.listHallAvailability,
  });

  factory HallsModel.fromJson(Map<String, dynamic> json) {
    return HallsModel(
      itemName: json["name"],
      details: json["details"],
      location: json["address"],
      contactNo: json["phone"],
      imageUrl: json["image"] == null ? null : json["image"],
      listHallReviews: new List<HallReviewsModel>.from(
          json["rating_and_reviews"].map((x) => HallReviewsModel.fromJson(x))),
      listHallImages: new List<HallImagesModel>.from(
          json["hall_images"].map((x) => HallImagesModel.fromJson(x))),
      listHallAvailability: new List<HallAvailabilityModel>.from(
          json["availability"].map((x) => HallAvailabilityModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': itemName,
        'details': details,
        'address': location,
        'phone': contactNo,
        'image': imageUrl == null ? null : imageUrl,
        'rating_and_reviews': listHallReviews,
        'hall_images': listHallImages,
        'availability': listHallAvailability,
      };
}

class HallReviewsModel {
  String username;
  String feedback;
  String date;
  double review;

  HallReviewsModel({this.username, this.feedback, this.date, this.review});

  factory HallReviewsModel.fromJson(Map<String, dynamic> json) =>
      new HallReviewsModel(
        username: json["rUsername"],
        feedback: json["rFeedback"],
        date: json["rDate"],
        review: json["rReview"],
      );

  Map<String, dynamic> toJson() => {
        "rUsername": username,
        "rFeedback": feedback,
        "rDate": date,
        "rReview": review
      };
}

class HallImagesModel {
  int iId;
  String iUrl;

  HallImagesModel({this.iId, this.iUrl});

  factory HallImagesModel.fromJson(Map<String, dynamic> json) =>
      new HallImagesModel(
        iId: json["iId"],
        iUrl: json["iImage"],
      );

  Map<String, dynamic> toJson() => {
        "iId": iId,
        "iImage": iUrl,
      };
}

class HallAvailabilityModel {
  int id;
  String day;
  String time;

  HallAvailabilityModel({this.id, this.day, this.time});

  factory HallAvailabilityModel.fromJson(Map<String, dynamic> json) =>
      new HallAvailabilityModel(
        id: json["aId"],
        day: json["day"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "aId": id,
        "day": day,
        "time": time,
      };
}
