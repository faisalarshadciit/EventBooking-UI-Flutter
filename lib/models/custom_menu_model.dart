class CustomMenuModel {
  String menuName;
  String itemImage;
  List<CustomMenuItemsModel> menuItemsList;

  CustomMenuModel({
    this.menuName,
    this.itemImage,
    this.menuItemsList,
  });

  factory CustomMenuModel.fromJson(Map<String, dynamic> json) {
    return CustomMenuModel(
      menuName: json["menuName"],
      itemImage: json["itemImage"],
      menuItemsList: new List<CustomMenuItemsModel>.from(
          json["menuItems"].map((x) => CustomMenuItemsModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'menuName': menuName,
        "itemImage": itemImage,
        'menuItems': menuItemsList
      };
}

class CustomMenuItemsModel {
  String itemName;
  double perHeadPrice;
  bool isChecked;

  CustomMenuItemsModel({this.itemName, this.isChecked, this.perHeadPrice});

  factory CustomMenuItemsModel.fromJson(Map<String, dynamic> json) =>
      new CustomMenuItemsModel(
        itemName: json["itemName"],
        isChecked: json["isChecked"],
        perHeadPrice: json["perHeadPrice"],
      );

  Map<String, dynamic> toJson() => {
        "itemName": itemName,
        "isChecked": isChecked,
        'perHeadPrice': perHeadPrice,
      };
}
