class MyApi {
  // API Key
  static const String weatherApiKey =
      "rTqn57BPAyKSRc6mkaLeNbWptHUw9Dhj3GsQg48zfXdVZuMvEJ";
  static const String sphereMapApiKey = 'C6B485191DAB4F61A5FA632E1B7EFD37';

  // Map Layer
  static const String baseMapGG =
      'https://mt1.google.com/vt/lyrs=r&x={x}&y={y}&z={z}';
  static const String satelliteMapGG =
      'https://mt1.google.com/vt/lyrs=y&x={x}&y={y}&z={z}';

  // API URL
  static String priceBoard =
      "https://burncheck.com/ajax/v3/statistics/price_board";
  static String urlPM25Home =
      "https://pm25.gistda.or.th/rest/getPm25byLocation";
  static String urlDataWeather =
      'https://lifedee-api-backend-300940441289.asia-southeast3.run.app/proxy/weather/current';
}
