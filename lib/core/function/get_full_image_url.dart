String getFullImageUrl(String imagePath) {
  if (imagePath.startsWith('http')) {
    return imagePath; // URL كامل، استخدمه كما هو
  }
  return 'http://192.168.1.2/images/courses/$imagePath'; // path نسبي
}
