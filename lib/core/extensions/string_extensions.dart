extension DiacriticRemoval on String {
  String removeDiacritics() {
    return replaceAll(RegExp('Ά'), 'Α')
        .replaceAll(RegExp('Ό'), 'Ο')
        .replaceAll(RegExp('Έ'), 'Ε')
        .replaceAll(RegExp('Ή'), 'Η')
        .replaceAll(RegExp('Ύ'), 'Υ')
        .replaceAll(RegExp('Ώ'), 'Ω')
        .replaceAll(RegExp('Ί'), 'Ι');
  }
}
