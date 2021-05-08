class Calender {

  final int harvestTime;
  final String timestamps;
  final String titles;
  final String subtitles;
  final String links;
  final String imageUrls;

  const Calender({
     this.timestamps,
     this.titles,
     this.subtitles,
     this.links,
     this.imageUrls,
     this.harvestTime,
  });

}

List<Calender> calanderData = [
  Calender(
    titles: "Land Preparation",
    subtitles:"The soil should be friable, porous and well drained. The optimum soil pH range is 4.8 to 5.4. It prefers a cool weather. Potato is mostly grown as a rainfed crop in regions receiving a rainfall of 1200 – 2000 mm per annum." ,
    imageUrls: "assets/landPrep.png",
    links: "",
  ),
  Calender(
    titles: "Seed Selection",
    subtitles:" Purity of the cultivars and healthy seed tubers are the primary requirements for a successful crop. However, seed tuber is the costliest input in potato cultivation. The tuber seed should be disease free, well-sprouted and 30-40 g each in weight." ,
    imageUrls: "assets/seed.png",
    links: "",
  ),
  Calender(
    titles: "Irrigation",
    subtitles:"The irrigation systems most commonly used in potato cultivation are drip irrigation (labor intensive), sprinkler systems, overhead rain guns and boom irrigation. According to FAO, for high yields, the crop water requirements (ETm) for a 120 to 150 day crop are 500 to 700 mm, depending on climate." ,
    imageUrls: "assets/irrigation.png",
    links: "",
  ),
  Calender(
    titles: "Pest Control",
    subtitles:"Spraying with Tracer (spinosad) 48 SC 300 ml/ha or 0.02% phosphamidon, 0.03% dimethoate, methyl demeton or thiometon control the pest effectively." ,
    imageUrls: "assets/pest.png",
    links: "",
  ),
  Calender(
    titles: "Fertilizing",
    subtitles:"Both potassium and nitrogen are needed throughout vegetative growth, tuber formation and bulking. Potassium is the element most widely utilised by the potato crop and together with nitrogen is required in the highest quantities to achieve high potato yields." ,
    imageUrls: "assets/fertilizer.png",
    links: "",
  ),
  Calender(
    titles: "Harvesting",
    subtitles:"Wait until the tops of the vines have completely died before you begin harvesting. When the vines are dead, it is a sure sign the potatoes have finished growing and are ready to be harvested" ,
    imageUrls: "assets/harvest.png",
    links: "",
  ),
];