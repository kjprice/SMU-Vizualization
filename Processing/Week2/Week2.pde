
// first define a bunch of images ( 1 kj, 10 eve, 10 gabe) all in grey scale
// Map through each eve and gabe image
PImage kjImage;

ArrayList<PImage> familyImages;
String imagesPath = "images/family/";


void setup() {
  size(100, 100);
  // Images must be in the "data" directory to load correctly
  kjImage = loadImage("images/kj.jpg");
  familyImages = createImages();
}

ArrayList<PImage> createImages() {
  String[] imageFileNames = getFileNamesOfImages();
  ArrayList<PImage> images = new ArrayList<PImage>();
  for (int i = 0; i < imageFileNames.length; i++) {
    String fileName = imageFileNames[i];
    if (fileName.endsWith("jpg")) {
      images.add(loadImage(imagesPath + fileName));
    }
  }
  
  println("found " + images.size() + " images");
  return images;
}

String[] getFileNamesOfImages() {
  // Code partially attributed to : 
  // https://processing.org/discourse/beta/num_1253083238.html
  // and: https://processing.org/discourse/beta/num_1229443269.html

  File dir = new File(sketchPath() + "/" + imagesPath);
  String[] children = dir.list();
  if (children == null) {
    println("image folder does not exist");
  }
  
  return children;
}

void draw() {
  image(kjImage, 10, 0);
}