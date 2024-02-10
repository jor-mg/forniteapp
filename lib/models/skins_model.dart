// To parse this JSON data, do
//
//     final skin = skinFromJson(jsonString);

import 'dart:convert';

List<Skin> skinFromJson(String str) =>
    List<Skin>.from(json.decode(str).map((x) => Skin.fromJson(x)));

String skinToJson(List<Skin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Skin {
  int regularPrice;
  int finalPrice;
  Bundle? bundle;
  Banner? banner;
  bool giftable;
  bool refundable;
  int sortPriority;
  dynamic categories;
  String sectionId;
  dynamic section;
  Layout layout;
  String devName;
  String offerId;
  String tileSize;
  String newDisplayAssetPath;
  NewDisplayAsset? newDisplayAsset;
  List<Item> items;

  Skin({
    required this.regularPrice,
    required this.finalPrice,
    this.bundle,
    this.banner,
    required this.giftable,
    required this.refundable,
    required this.sortPriority,
    required this.categories,
    required this.sectionId,
    required this.section,
    required this.layout,
    required this.devName,
    required this.offerId,
    required this.tileSize,
    required this.newDisplayAssetPath,
    this.newDisplayAsset,
    required this.items,
  });

  factory Skin.fromJson(Map<String, dynamic> json) => Skin(
        regularPrice: json["regularPrice"],
        finalPrice: json["finalPrice"],
        bundle: json["bundle"] != null ? Bundle.fromJson(json["bundle"]) : null,
        banner: json["banner"] != null ? Banner.fromJson(json["banner"]) : null,
        giftable: json["giftable"],
        refundable: json["refundable"],
        sortPriority: json["sortPriority"],
        categories: json["categories"],
        sectionId: json["sectionId"],
        section: json["section"],
        layout: Layout.fromJson(json["layout"]),
        devName: json["devName"],
        offerId: json["offerId"],
        tileSize: json["tileSize"],
        newDisplayAssetPath: json["newDisplayAssetPath"],
        newDisplayAsset: json["newDisplayAsset"] != null
            ? NewDisplayAsset.fromJson(json["newDisplayAsset"])
            : null,
        items: (json["items"] as List<dynamic>?)
                ?.map((x) => Item.fromJson(x))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "regularPrice": regularPrice,
        "finalPrice": finalPrice,
        "bundle": bundle?.toJson(),
        "banner": banner?.toJson(),
        "giftable": giftable,
        "refundable": refundable,
        "sortPriority": sortPriority,
        "categories": categories,
        "sectionId": sectionId,
        "section": section,
        "layout": layout.toJson(),
        "devName": devName,
        "offerId": offerId,
        "tileSize": tileSize,
        "newDisplayAssetPath": newDisplayAssetPath,
        "newDisplayAsset": newDisplayAsset?.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Banner {
  String value;
  String intensity;
  String backendValue;

  Banner({
    required this.value,
    required this.intensity,
    required this.backendValue,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        value: json["value"],
        intensity: json["intensity"],
        backendValue: json["backendValue"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "intensity": intensity,
        "backendValue": backendValue,
      };
}

class Bundle {
  String name;
  String info;
  String image;

  Bundle({
    required this.name,
    required this.info,
    required this.image,
  });

  factory Bundle.fromJson(Map<String, dynamic> json) => Bundle(
        name: json["name"],
        info: json["info"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "info": info,
        "image": image,
      };
}

class Item {
  String id;
  String name;
  String description;
  Rarity type;
  Rarity rarity;
  Series? series;
  ItemImages images;
  List<Variant>? variants;
  List<String>? builtInEmoteIds;
  dynamic searchTags;
  List<String> gameplayTags;
  dynamic metaTags;
  String? showcaseVideo;
  String? dynamicPakId;
  dynamic displayAssetPath;
  String? definitionPath;
  String path;
  DateTime added;
  List<DateTime> shopHistory;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.rarity,
    this.series,
    required this.images,
    required this.variants,
    this.builtInEmoteIds,
    required this.searchTags,
    required this.gameplayTags,
    required this.metaTags,
    required this.showcaseVideo,
    this.dynamicPakId,
    required this.displayAssetPath,
    required this.definitionPath,
    required this.path,
    required this.added,
    required this.shopHistory,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        type: Rarity.fromJson(json["type"]),
        rarity: Rarity.fromJson(json["rarity"]),
        images: ItemImages.fromJson(json["images"]),
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
        builtInEmoteIds: json["builtInEmoteIds"] == null
            ? []
            : List<String>.from(json["builtInEmoteIds"]!.map((x) => x)),
        searchTags: json["searchTags"],
        gameplayTags: List<String>.from(json["gameplayTags"].map((x) => x)),
        metaTags: json["metaTags"],
        showcaseVideo: json["showcaseVideo"],
        displayAssetPath: json["displayAssetPath"],
        definitionPath: json["definitionPath"],
        path: json["path"],
        added: DateTime.parse(json["added"]),
        shopHistory: List<DateTime>.from(
            json["shopHistory"].map((x) => DateTime.parse(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type.toJson(),
        "rarity": rarity.toJson(),
        "images": images.toJson(),
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
        "builtInEmoteIds": builtInEmoteIds == null
            ? []
            : List<dynamic>.from(builtInEmoteIds!.map((x) => x)),
        "searchTags": searchTags,
        "gameplayTags": List<dynamic>.from(gameplayTags.map((x) => x)),
        "metaTags": metaTags,
        "showcaseVideo": showcaseVideo,
        "displayAssetPath": displayAssetPath,
        "definitionPath": definitionPath,
        "path": path,
        "added": added.toIso8601String(),
        "shopHistory":
            List<dynamic>.from(shopHistory.map((x) => x.toIso8601String())),
      };
}

class ItemImages {
  String smallIcon;
  String icon;
  String? featured;
  dynamic other;

  ItemImages({
    required this.smallIcon,
    required this.icon,
    required this.featured,
    required this.other,
  });

  factory ItemImages.fromJson(Map<String, dynamic> json) => ItemImages(
        smallIcon: json["smallIcon"],
        icon: json["icon"],
        featured: json["featured"],
        other: json["other"],
      );

  Map<String, dynamic> toJson() => {
        "smallIcon": smallIcon,
        "icon": icon,
        "featured": featured,
        "other": other,
      };
}

class Introduction {
  String chapter;
  String season;
  String text;
  int backendValue;

  Introduction({
    required this.chapter,
    required this.season,
    required this.text,
    required this.backendValue,
  });

  factory Introduction.fromJson(Map<String, dynamic> json) => Introduction(
        chapter: json["chapter"],
        season: json["season"],
        text: json["text"],
        backendValue: json["backendValue"],
      );

  Map<String, dynamic> toJson() => {
        "chapter": chapter,
        "season": season,
        "text": text,
        "backendValue": backendValue,
      };
}

class Set {
  String value;
  String text;
  String backendValue;

  Set({
    required this.value,
    required this.text,
    required this.backendValue,
  });

  factory Set.fromJson(Map<String, dynamic> json) => Set(
        value: json["value"],
        text: json["text"],
        backendValue: json["backendValue"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
        "backendValue": backendValue,
      };
}

class Rarity {
  String value;
  String displayValue;
  String backendValue;

  Rarity({
    required this.value,
    required this.displayValue,
    required this.backendValue,
  });

  factory Rarity.fromJson(Map<String, dynamic> json) => Rarity(
        value: json["value"],
        displayValue: json["displayValue"],
        backendValue: json["backendValue"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "displayValue": displayValue,
        "backendValue": backendValue,
      };
}

class Series {
  String value;
  String image;
  List<String> colors;
  String backendValue;

  Series({
    required this.value,
    required this.image,
    required this.colors,
    required this.backendValue,
  });

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        value: json["value"],
        image: json["image"],
        colors: List<String>.from(json["colors"].map((x) => x)),
        backendValue: json["backendValue"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "image": image,
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "backendValue": backendValue,
      };
}

class Variant {
  String channel;
  String type;
  List<Option> options;

  Variant({
    required this.channel,
    required this.type,
    required this.options,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        channel: json["channel"],
        type: json["type"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "channel": channel,
        "type": type,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class Option {
  String tag;
  String name;
  String image;

  Option({
    required this.tag,
    required this.name,
    required this.image,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        tag: json["tag"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "tag": tag,
        "name": name,
        "image": image,
      };
}

class Layout {
  String id;
  String name;
  String category;
  int index;
  String showIneligibleOffers;

  Layout({
    required this.id,
    required this.name,
    required this.category,
    required this.index,
    required this.showIneligibleOffers,
  });

  factory Layout.fromJson(Map<String, dynamic> json) => Layout(
        id: json["id"],
        name: json["name"],
        category: json["category"] ?? "Nulo",
        index: json["index"],
        showIneligibleOffers: json["showIneligibleOffers"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "category": category,
        "index": index,
        "showIneligibleOffers": showIneligibleOffers,
      };
}

class NewDisplayAsset {
  String id;
  dynamic cosmeticId;
  List<MaterialInstance> materialInstances;

  NewDisplayAsset({
    required this.id,
    required this.cosmeticId,
    required this.materialInstances,
  });

  factory NewDisplayAsset.fromJson(Map<String, dynamic> json) =>
      NewDisplayAsset(
        id: json["id"],
        cosmeticId: json["cosmeticId"],
        materialInstances: List<MaterialInstance>.from(
            json["materialInstances"].map((x) => MaterialInstance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cosmeticId": cosmeticId,
        "materialInstances":
            List<dynamic>.from(materialInstances.map((x) => x.toJson())),
      };
}

class MaterialInstance {
  String id;
  MaterialInstanceImages images;
  //Colors colors;
  Map<String, double> scalings;
  dynamic flags;

  MaterialInstance({
    required this.id,
    required this.images,
    //required this.colors,
    required this.scalings,
    required this.flags,
  });

  factory MaterialInstance.fromJson(Map<String, dynamic> json) =>
      MaterialInstance(
        id: json["id"],
        images: MaterialInstanceImages.fromJson(json["images"]),
        scalings: Map.from(json["scalings"])
            .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
        flags: json["flags"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "images": images.toJson(),
        //"colors": colors.toJson(),
        "scalings":
            Map.from(scalings).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "flags": flags,
      };
}

class Colors {
  String backgroundColorB;
  String backgroundColorA;

  Colors({
    required this.backgroundColorB,
    required this.backgroundColorA,
  });

  factory Colors.fromJson(Map<String, dynamic> json) => Colors(
        backgroundColorB: json["Background_Color_B"],
        backgroundColorA: json["Background_Color_A"],
      );

  Map<String, dynamic> toJson() => {
        "Background_Color_B": backgroundColorB,
        "Background_Color_A": backgroundColorA,
      };
}

class MaterialInstanceImages {
  String offerImage;
  String background;

  MaterialInstanceImages({
    required this.offerImage,
    required this.background,
  });

  factory MaterialInstanceImages.fromJson(Map<String, dynamic> json) =>
      MaterialInstanceImages(
        offerImage: json["OfferImage"],
        background: json["Background"] ?? "Nulo",
      );

  Map<String, dynamic> toJson() => {
        "OfferImage": offerImage,
        "Background": background,
      };
}
