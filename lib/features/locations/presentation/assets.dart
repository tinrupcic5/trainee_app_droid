String getLogoImage(String imageName) {
  String sanitizedImageName = imageName.replaceAll(' ', '_').toLowerCase();
  return 'assets/images/logo/$sanitizedImageName.png';
}
