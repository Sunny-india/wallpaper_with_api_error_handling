class DataPhotoModel {
  DataPhotoModel(
      {this.page,
      this.per_page,
      this.total_results,
      this.photos,
      this.next_page});
  int? page, per_page, total_results;
  List<PhotoModel>? photos;
  String? next_page;

  factory DataPhotoModel.fromJson(Map<String, dynamic> json) {
    //
    List<PhotoModel> insidePhotos = [];
    List<dynamic>? ph = json['photos'];
    // have it null-checked and then correspond to their values;
    if (ph != null) {
      for (var singlePhotoMap in ph) {
        insidePhotos.add(PhotoModel.fromJson(singlePhotoMap));
      }
    }
    //
    return DataPhotoModel(
        page: json['page'],
        per_page: json['per_page'],
        total_results: json['total_results'],
        photos: insidePhotos,
        next_page: json['next_page']);
  }
}

class PhotoModel {
  PhotoModel(
      {this.id,
      this.width,
      this.height,
      this.photographer_id,
      this.url,
      this.photographer,
      this.photographer_url,
      this.avg_color,
      this.alt,
      this.src,
      this.liked});
  int? id, width, height, photographer_id;
  String? url, photographer, photographer_url, avg_color, alt;
  SrcModel? src;
  bool? liked;

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
        id: json['id'],
        width: json['width'],
        height: json['height'],
        photographer_id: json['photographer_id'],
        url: json['url'],
        photographer: json['photographer'],
        photographer_url: json['photographer_url'],
        avg_color: json['avg_color'],
        alt: json['alt'],
        src: SrcModel.fromJson(json['src']),
        liked: json['liked']);
  }
}

class SrcModel {
  String? original, large2x, large, medium, small, portrait, landscape, tiny;
  SrcModel(
      {this.original,
      this.large2x,
      this.large,
      this.medium,
      this.small,
      this.portrait,
      this.landscape,
      this.tiny});
  factory SrcModel.fromJson(Map<String, dynamic> json) {
    // have them all null-checked
    return SrcModel(
        original: json['original'] ?? '',
        large2x: json['large2x'] ?? '',
        large: json['large'] ?? '',
        medium: json['medium'] ?? '',
        small: json['small'] ?? '',
        portrait: json['portrait'] ?? '',
        landscape: json['landscape'] ?? '',
        tiny: json['tiny'] ?? '');
  }
}
