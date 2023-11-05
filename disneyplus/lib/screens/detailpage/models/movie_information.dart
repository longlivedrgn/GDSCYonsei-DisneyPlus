class MovieInformation {
  String name;
  String runningTime;
  String imageURL;
  int? openDate;
  String? genre;
  String? size;
  String? summary;

  MovieInformation(
    this.name,
    this.runningTime,
    this.imageURL, {
    this.openDate,
    this.genre,
    this.size,
    this.summary,
  });
  // MovieInformation(
  //   this.name,
  //   this.runningTime,
  //   this.imageURL, [
  //   this.openDate,
  //   this.genre,
  //   this.size,
  //   this.summary,
  // ]);
}
