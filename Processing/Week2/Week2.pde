
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
  noLoop();
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
  println(kjImage.width + ", " + kjImage.height);
  performSelfPortrait();
  // must include a default start top-left position - to work with partner
}

void performSelfPortrait() {
  int sizeToReplace = 10;
  println("kjImage has size of " + kjImage.width + " X " + kjImage.height);
  println("initializing boxes with " + (kjImage.width / sizeToReplace) + " X " + kjImage.height / sizeToReplace + " Dimensions");
  int[][] boxes = new int [kjImage.width / sizeToReplace][kjImage.height / sizeToReplace];
  
  if ((kjImage.width % sizeToReplace == 0) && (kjImage.height % sizeToReplace == 0)) {
    int numberOfBoxes = (kjImage.width / sizeToReplace) * (kjImage.height * sizeToReplace );
    println("creating " + numberOfBoxes + " boxes, each having " + sizeToReplace + "X" + sizeToReplace + " dimensions - which works for kjImage size");
  }
  
  // take kjImage iterate over every 10X10 block and replace with the closest matching family image
  for (int y = 0; y < kjImage.height; y++) {
    //println(y);
    for (int x = 0; x < kjImage.width; x++) {
      int trueX = x;
      int trueY = y;
      
      int boxIndexX = (int) Math.ceil(trueX / sizeToReplace);
      int boxIndexY = (int) Math.ceil(trueY / sizeToReplace);
      
      int loc = x + y * kjImage.width;
      int greyscale = gray(kjImage.pixels[loc]);
      
      boxes[boxIndexX][boxIndexY] = greyscale;
    }
  }
}

class FamilyImage {
  public PImage image;
  private int greyscale;
  private int imageSize;
  FamilyImage (String filePath) {
    // then get the grayscale of each image - apply
    this.image = loadImage(filePath);
    this.setGreyscale();
  }
  
  void setGreyscale() {
    loadPixels();
    int sumOfGreyscale = 0;
    int pixelCount = 0;
    for (int y = 0; y < this.image.height; y++) {
      for (int x = 0; x < this.image.width; x++) {
        pixelCount++;
        int loc = x + y * this.image.width;
        int greyscale = gray(this.image.pixels[loc]);
        sumOfGreyscale += greyscale;
      }
    }
    
    int averageGreyscale = sumOfGreyscale / pixelCount;
    this.greyscale = averageGreyscale;
    // println(this.greyscale);
    
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