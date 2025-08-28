class MetadataResponse {
  MetadataResponse({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  MetadataResponse.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }

  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;
}
