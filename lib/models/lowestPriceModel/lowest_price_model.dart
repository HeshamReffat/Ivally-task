class LowestPriceModel {
  late int id;
  late String title;
  late String content;
  late String slug;
  late String date;
  late Type type;
  late bool featured;
  late FeaturedImage featuredImage;
  late List<String> galleryImage;
  late String price;
  late String status;
  late Location location;
  late String address;
  late String contactName;
  late String contactEmail;
  late String contactPhone;
  late String views;
  late String size;
  late String bedrooms;
  late String bathrooms;
  late String prefix;
  //late Meta meta;

  LowestPriceModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.slug,
      required this.date,
      required this.type,
      required this.featured,
      required this.featuredImage,
      required this.galleryImage,
      required this.price,
      required this.status,
      required this.location,
      required this.address,
      required this.contactName,
      required this.contactEmail,
      required this.contactPhone,
      required this.views,
      required this.size,
      required this.bedrooms,
      required this.bathrooms,
      required this.prefix,
     // required this.meta
      });

  LowestPriceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    slug = json['slug'];
    date = json['date'];
    type = (json['type'] != null ? new Type.fromJson(json['type']) : null)!;
    featured = json['featured'];
    featuredImage = (json['featured_image'] != null
        ? new FeaturedImage.fromJson(json['featured_image'])
        : null)!;
    galleryImage = json['gallery_image'].cast<String>();
    price = json['price'];
    status = json['status'];
    location = (json['location'] != null
        ? new Location.fromJson(json['location'])
        : null)!;
    address = json['address'];
    contactName = json['contact_name'];
    contactEmail = json['contact_email'];
    contactPhone = json['contact_phone'];
    views = json['views'];
    size = json['size'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    prefix = json['prefix'];
   // meta = (json['meta'] != null ? new Meta.fromJson(json['meta']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['slug'] = this.slug;
    data['date'] = this.date;
    if (this.type != null) {
      data['type'] = this.type.toJson();
    }
    data['featured'] = this.featured;
    if (this.featuredImage != null) {
      data['featured_image'] = this.featuredImage.toJson();
    }
    data['gallery_image'] = this.galleryImage;
    data['price'] = this.price;
    data['status'] = this.status;
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    data['address'] = this.address;
    data['contact_name'] = this.contactName;
    data['contact_email'] = this.contactEmail;
    data['contact_phone'] = this.contactPhone;
    data['views'] = this.views;
    data['size'] = this.size;
    data['bedrooms'] = this.bedrooms;
    data['bathrooms'] = this.bathrooms;
    data['prefix'] = this.prefix;
    // if (this.meta != null) {
    //   data['meta'] = this.meta.toJson();
    // }
    return data;
  }
}

class Type {
  String? name;
  int? id;

  Type({required this.name, required this.id});

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}

class FeaturedImage {
  String? thumbnail;
  String? medium;
  String? large;

  FeaturedImage(
      {required this.thumbnail, required this.medium, required this.large});

  FeaturedImage.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}

class Location {
  String? lat;
  String? long;

  Location({required this.lat, required this.long});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}
//
// class Meta {
//   late List<dynamic> realEstatePropertyFeatured;
//   late List<dynamic> realEstatePropertyPriceOnCall;
//   late List<dynamic> realEstatePropertyPriceUnit;
//   late List<dynamic> realEstatePropertyPriceShort;
//   late List<dynamic> realEstatePropertyPrice;
//   late List<dynamic> realEstatePropertyPricePostfix;
//   late List<dynamic> realEstatePropertySize;
//   late List<dynamic> realEstatePropertyLand;
//   late List<dynamic> realEstatePropertyRooms;
//   late List<dynamic> realEstatePropertyBedrooms;
//   late List<dynamic> realEstatePropertyBathrooms;
//   late List<dynamic> realEstatePropertyGarage;
//   late List<dynamic> realEstatePropertyGarageSize;
//   late List<dynamic> realEstatePropertyYear;
//   late List<dynamic> realEstatePropertyVideoUrl;
//   late List<dynamic> realEstatePropertyIdentity;
//   late List<dynamic> realEstatePropertyImages;
//   late List<dynamic> lThumbnailId;
//   late List<dynamic> realEstateFloorsEnable;
//   late List<dynamic> realEstateFloors;
//   late List<dynamic> realEstateAgentDisplayOption;
//   late List<dynamic> realEstatePropertyAuthor;
//   late List<dynamic> realEstatePropertyAddress;
//   late List<dynamic> realEstatePropertyLocation;
//   late List<dynamic> realEstatePropertyCountry;
//   late List<dynamic> realEstatePrivateNote;
//   late List<dynamic> lWpmlLocationMigrationDone;
//   late List<dynamic> realEstatePropertyViewsCount;
//
//   Meta(
//       {required this.realEstatePropertyFeatured,
//       required this.realEstatePropertyPriceOnCall,
//       required this.realEstatePropertyPriceUnit,
//       required this.realEstatePropertyPriceShort,
//       required this.realEstatePropertyPrice,
//       required this.realEstatePropertyPricePostfix,
//       required this.realEstatePropertySize,
//       required this.realEstatePropertyLand,
//       required this.realEstatePropertyRooms,
//       required this.realEstatePropertyBedrooms,
//       required this.realEstatePropertyBathrooms,
//       required this.realEstatePropertyGarage,
//       required this.realEstatePropertyGarageSize,
//       required this.realEstatePropertyYear,
//       required this.realEstatePropertyVideoUrl,
//       required this.realEstatePropertyIdentity,
//       required this.realEstatePropertyImages,
//       required this.lThumbnailId,
//       required this.realEstateFloorsEnable,
//       required this.realEstateFloors,
//       required this.realEstateAgentDisplayOption,
//       required this.realEstatePropertyAuthor,
//       required this.realEstatePropertyAddress,
//       required this.realEstatePropertyLocation,
//       required this.realEstatePropertyCountry,
//       required this.realEstatePrivateNote,
//       required this.lWpmlLocationMigrationDone,
//       required this.realEstatePropertyViewsCount});
//
//   Meta.fromJson(Map<String, dynamic> json) {
//     realEstatePropertyFeatured =
//         json['real_estate_property_featured'];
//     realEstatePropertyPriceOnCall =
//         json['real_estate_property_price_on_call'];
//     realEstatePropertyPriceUnit =
//         json['real_estate_property_price_unit'];
//     realEstatePropertyPriceShort =
//         json['real_estate_property_price_short'];
//     realEstatePropertyPrice = json['real_estate_property_price'];
//     realEstatePropertyPricePostfix =
//         json['real_estate_property_price_postfix'];
//     realEstatePropertySize = json['real_estate_property_size'];
//     realEstatePropertyLand = json['real_estate_property_land'];
//     realEstatePropertyRooms = json['real_estate_property_rooms'];
//     realEstatePropertyBedrooms =
//         json['real_estate_property_bedrooms'];
//     realEstatePropertyBathrooms =
//         json['real_estate_property_bathrooms'];
//     realEstatePropertyGarage =
//         json['real_estate_property_garage'];
//     realEstatePropertyGarageSize =
//         json['real_estate_property_garage_size'];
//     realEstatePropertyYear = json['real_estate_property_year'];
//     realEstatePropertyVideoUrl =
//         json['real_estate_property_video_url'];
//     realEstatePropertyIdentity =
//         json['real_estate_property_identity'];
//     realEstatePropertyImages =
//         json['real_estate_property_images'];
//     lThumbnailId = json['_thumbnail_id'];
//     realEstateFloorsEnable = json['real_estate_floors_enable'];
//     realEstateFloors = json['real_estate_floors'];
//     realEstateAgentDisplayOption =
//         json['real_estate_agent_display_option'];
//     realEstatePropertyAuthor =
//         json['real_estate_property_author'];
//     realEstatePropertyAddress =
//         json['real_estate_property_address'];
//     realEstatePropertyLocation =
//         json['real_estate_property_location'];
//     realEstatePropertyCountry =
//         json['real_estate_property_country'];
//     realEstatePrivateNote = json['real_estate_private_note'];
//     lWpmlLocationMigrationDone =
//         json['_wpml_location_migration_done'];
//     realEstatePropertyViewsCount =
//         json['real_estate_property_views_count'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['real_estate_property_featured'] = this.realEstatePropertyFeatured;
//     data['real_estate_property_price_on_call'] =
//         this.realEstatePropertyPriceOnCall;
//     data['real_estate_property_price_unit'] = this.realEstatePropertyPriceUnit;
//     data['real_estate_property_price_short'] =
//         this.realEstatePropertyPriceShort;
//     data['real_estate_property_price'] = this.realEstatePropertyPrice;
//     data['real_estate_property_price_postfix'] =
//         this.realEstatePropertyPricePostfix;
//     data['real_estate_property_size'] = this.realEstatePropertySize;
//     data['real_estate_property_land'] = this.realEstatePropertyLand;
//     data['real_estate_property_rooms'] = this.realEstatePropertyRooms;
//     data['real_estate_property_bedrooms'] = this.realEstatePropertyBedrooms;
//     data['real_estate_property_bathrooms'] = this.realEstatePropertyBathrooms;
//     data['real_estate_property_garage'] = this.realEstatePropertyGarage;
//     data['real_estate_property_garage_size'] =
//         this.realEstatePropertyGarageSize;
//     data['real_estate_property_year'] = this.realEstatePropertyYear;
//     data['real_estate_property_video_url'] = this.realEstatePropertyVideoUrl;
//     data['real_estate_property_identity'] = this.realEstatePropertyIdentity;
//     data['real_estate_property_images'] = this.realEstatePropertyImages;
//     data['_thumbnail_id'] = this.lThumbnailId;
//     data['real_estate_floors_enable'] = this.realEstateFloorsEnable;
//     data['real_estate_floors'] = this.realEstateFloors;
//     data['real_estate_agent_display_option'] =
//         this.realEstateAgentDisplayOption;
//     data['real_estate_property_author'] = this.realEstatePropertyAuthor;
//     data['real_estate_property_address'] = this.realEstatePropertyAddress;
//     data['real_estate_property_location'] = this.realEstatePropertyLocation;
//     data['real_estate_property_country'] = this.realEstatePropertyCountry;
//     data['real_estate_private_note'] = this.realEstatePrivateNote;
//     data['_wpml_location_migration_done'] = this.lWpmlLocationMigrationDone;
//     data['real_estate_property_views_count'] =
//         this.realEstatePropertyViewsCount;
//     return data;
//   }
// }
