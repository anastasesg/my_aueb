extension StringParsing on int {
  String twoDigits() {
    if (this < 10) {
      return "0$this";
    } else {
      return toString();
    }
  }
}
