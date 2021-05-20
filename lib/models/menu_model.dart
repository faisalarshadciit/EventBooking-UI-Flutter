class MenuModel {
  String menuTitle;
  String perHeadCharges;
  String menuItem;
  String menuImage;
  List<MenuItemsModel> itemsList;

  MenuModel({
    this.menuTitle,
    this.perHeadCharges,
    this.menuItem,
    this.menuImage,
    this.itemsList,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      menuTitle: json["menuTitle"],
      perHeadCharges: json["perHead"],
      menuItem: json["menuItem"],
      menuImage: json["menuImage"] == null ? null : json["menuImage"],
      itemsList: new List<MenuItemsModel>.from(
          json["itemsList"].map((x) => MenuItemsModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'menuTitle': menuTitle,
        'perHead': perHeadCharges,
        'menuItem': menuItem,
        'menuImage': menuImage == null ? null : menuImage,
        'itemsList': itemsList,
      };
}

class MenuItemsModel {
  String itemName;

  MenuItemsModel({this.itemName});

  factory MenuItemsModel.fromJson(Map<String, dynamic> json) =>
      new MenuItemsModel(itemName: json["itemName"]);

  Map<String, dynamic> toJson() => {"itemName": itemName};
}
