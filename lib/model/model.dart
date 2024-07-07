class ModelData {
    List<Data>? data;

    ModelData({this.data});

    ModelData.fromJson(Map<String, dynamic> json) {
        data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(data != null) {
            _data["data"] = data?.map((e) => e.toJson()).toList();
        }
        return _data;
    }
}

class Data {
    String? title;
    String? image;
    String? subTitle;
    String? description;
    int? quantity;
    bool? isFav;
    String? price;

    Data({this.title, this.image, this.subTitle, this.description, this.quantity, this.isFav, this.price});

    Data.fromJson(Map<String, dynamic> json) {
        title = json["title"];
        image = json["image"];
        subTitle = json["subTitle"];
        description = json["description"];
        quantity = json["quantity"];
        isFav = json["isFav"];
        price = json["price"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["title"] = title;
        _data["image"] = image;
        _data["subTitle"] = subTitle;
        _data["description"] = description;
        _data["quantity"] = quantity;
        _data["isFav"] = isFav;
        _data["price"] = price;
        return _data;
    }
}