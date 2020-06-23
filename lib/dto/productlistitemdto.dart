class ProductListItemDto {
  final int id;
  final String title;
  final String category;
  final String content;
  final int price;
  final int userId;
  final String region;
  final String imageFilePath;
  final String status;
  final DateTime createdTime;

  ProductListItemDto(
      {this.id,
      this.title,
      this.category,
      this.content,
      this.price,
      this.userId,
      this.region,
      this.imageFilePath,
      this.status,
      this.createdTime});

  factory ProductListItemDto.fromJSON(Map<String, dynamic> json) {
    return ProductListItemDto(
        id: json['id'],
        title: json['title'],
        category: json['category'],
        content: json['content'],
        price: json['price'],
        userId: json['userId'],
        region: json['region'],
        imageFilePath: json['imageFilePath'],
        status: json['status'],
        createdTime: DateTime.parse(json['createdTime']));
  }
}
