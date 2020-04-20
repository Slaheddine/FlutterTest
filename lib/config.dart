enum Flavor {
  DEVELOPMENT,
  RELEASE,
}

class Config {

  static Flavor appFlavor;

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return 'https://vmi347851.contaboserver.net/api';
      case Flavor.DEVELOPMENT:
      default:
        return 'https://dipla.herokuapp.com/api';
    }
  }

  static String get userName {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return 'e2LpDx3924FdisjNoUo67bewp60yortfxX';
      case Flavor.DEVELOPMENT:
      default:
        return 'EHolEMIEtishAnDrUCEarSPaTERubm';
    }
  }

  static String get password {
    switch (appFlavor) {
      case Flavor.RELEASE:
        return '48nBj8uspCqdBsYuabiXrps2GbcEKN51XMNCKkViOZQIZJsLo8';
      case Flavor.DEVELOPMENT:
      default:
        return 'bmW8C20BkUZJ4NJ3RpirdbpivySXHavSV4ubGubPxpjdJn5vGv';
    }
  }
}