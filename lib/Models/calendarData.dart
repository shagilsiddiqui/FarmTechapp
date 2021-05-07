class Calender {

  final int harvestTime;
  final List timestamps;
  final List titles;
  final List subtitles;
  final List links;
  final List imageUrls;

  const Calender({
     this.timestamps,
     this.titles,
     this.subtitles,
     this.links,
     this.imageUrls,
     this.harvestTime,
  });

}

List<Calender> calanderData = [];