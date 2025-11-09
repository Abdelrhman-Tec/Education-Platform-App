String fixUrlImage(String imageUrl) {
  if (imageUrl.contains('127.0.0.1:8000') == true) {
    return imageUrl.replaceAll('127.0.0.1:8000', '10.0.2.2:8000');
  } else {
    return '';
  }
}
