class OrdersModel {
  String customerName;
  String customerPhone;
  String eventDate;
  String eventTime;
  String orderStatus;
  int noOfChairs;

  OrdersModel(
      {this.customerName,
      this.customerPhone,
      this.eventDate,
      this.eventTime,
      this.orderStatus,
      this.noOfChairs});

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
      customerName: json["customerName"],
      customerPhone: json["customerPhone"],
      eventDate: json["eventDate"],
      eventTime: json["eventTime"],
      orderStatus: json["orderStatus"],
      noOfChairs: json["noOfChairs"],
    );
  }

  Map<String, dynamic> toJson() => {
        'customerName': customerName,
        'customerPhone': customerPhone,
        'eventDate': eventDate,
        'eventTime': eventTime,
        'orderStatus': orderStatus,
        'noOfChairs': noOfChairs
      };
}
