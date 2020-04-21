enum Flavor {
  DEVELOPMENT,
  RELEASE,
}

class Config {

  static Flavor appFlavor;

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return 'https://next.json-generator.com';
      case Flavor.DEVELOPMENT:
      default:
        return 'https://next.json-generator.com';
    }
  }
}