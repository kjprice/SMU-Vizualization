
// first define a bunch of images ( 1 kj, 10 eve, 10 gabe) all in grey scale
// Map through each eve and gabe image
PImage kjImage;

FamilyImage[] familyImages;
String imagesPath = "images/family/";


void setup() {
  size(100, 100);
  kjImage = loadImage("images/kj.jpg");
  familyImages = createImages();
  background(familyImages[0].greyscale);
}

FamilyImage[] createImages() {
  String[] imageFileNames = getFileNamesOfImages();
  ArrayList<FamilyImage> images = new ArrayList<FamilyImage>();
  for (int i = 0; i < imageFileNames.length; i++) {
    String fileName = imageFileNames[i];
    if (fileName.endsWith("jpg")) {
      FamilyImage familyImage = new FamilyImage(imagesPath + fileName);
      images.add(familyImage);
    }
  }
  
  println("found " + images.size() + " images");
  return images.toArray(new FamilyImage[images.size()]);
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
  // image(kjImage, 10, 0);
}

class FamilyImage {
  public PImage image;
  private int greyscale;
  private int imageSize;
  FamilyImage (String filePath) {
    // then get the grayscale of each image - apply
    println(filePath);
    this.image = loadImage(filePath);
    this.setGreyscale();
  }
  
  void setGreyscale() {
    loadPixels();
    int sumOfGreyscale = 0;
    int pixelCount = 0;
    for (int y = 0; y < this.image.height; y++) {
      for (int x = 0; x < this.image.width; x++) {
        // image(this.image, 0, 0);
        // println(this.image.pixels[y+x]);
        pixelCount++;
        int loc = x + y * this.image.width;
        int greyscale = gray(this.image.pixels[loc]);
        sumOfGreyscale += greyscale;
        //println(color(this.image.pixels[loc]));
      }
    }
    
    int averageGreyscale = sumOfGreyscale / pixelCount;
    this.greyscale = averageGreyscale;
    println(this.greyscale);
    
    this.imageSize = pixelCount;
  }
}

// https://processing.org/discourse/beta/num_1159135995.html

static final int gray(color value) { 
  int r=(value&0x00FF0000)>>16; // red part
  int g=(value&0x0000FF00)>>8; // green part
  int b=(value&0x000000FF); // blue part
  return (r + g + b) / 3;   
}

// TODO create function that will loop through familyImages to find closest matching greyscale