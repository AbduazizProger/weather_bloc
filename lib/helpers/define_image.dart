String defineImage(String description) {
  if (description.contains('clear')) {
    return 'images/clear_sky.jpg';
  } else if (description.contains('cloud')) {
    return 'images/cloudly.jpg';
  } else if (description.contains('rain')) {
    return 'images/cloudly.jpg';
  } else if (description.contains('snow')) {
    return 'images/cloudly.jpg';
  } else if (description.contains('thunderstorm')) {
    return 'images/cloudly.jpg';
  } else {
    return 'images/misty.jpg';
  }
}
