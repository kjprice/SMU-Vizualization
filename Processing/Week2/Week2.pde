
// first define a bunch of images ( 1 kj, 10 eve, 10 gabe) all in grey scale
// Map through each eve and gabe image
String[] KJ_IMAGE_PATHS = new String[] {
  "images/kj.jpg",
  "images/kj2.png"
};
String SELECTED_IMAGE = KJ_IMAGE_PATHS[1];
PImage KJ_IMAGE;

FamilyImage[] familyImages;
String imagesPath = "images/family/";

static final int SIZE_OF_BOXES_TO_REPLACE = 4;
static final int KJ_STARTING_POSITION_X = 0;
static final int KJ_STARTING_POSITION_Y = 0;


void setup() {
  size(800, 800);
  KJ_IMAGE = loadImage(SELECTED_IMAGE);
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
      // println(familyImage.greyscale + " - " + fileName);
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
  performSelfPortrait();
}

void performSelfPortrait() {
  int[][][] boxesOfPixels = createBoxes(SIZE_OF_BOXES_TO_REPLACE);
  
  
  int[][] averageGreyscalePerBox = calculateAverageGreyscalePerBox(boxesOfPixels);
  
  FamilyImage[][] mostSimilarImages = findMostSimilarImagesToPixelColors(averageGreyscalePerBox);
  
  paintImagesInPlaceOfPortrait(mostSimilarImages);
}

void paintImagesInPlaceOfPortrait(FamilyImage[][] mostSimilarImages) {
  int portraitWidth = KJ_IMAGE.width;
  int numberOfColumns = portraitWidth / SIZE_OF_BOXES_TO_REPLACE;
  int currentRow = -1;
  
  for (int y = 0; y < mostSimilarImages.length; y++) {
    for (int x = 0; x < mostSimilarImages[y].length; x++) {
      int x_location = x * SIZE_OF_BOXES_TO_REPLACE + KJ_STARTING_POSITION_X;
      int y_location = y * SIZE_OF_BOXES_TO_REPLACE + KJ_STARTING_POSITION_Y;
      image(mostSimilarImages[y][x].image, x_location, y_location, SIZE_OF_BOXES_TO_REPLACE, SIZE_OF_BOXES_TO_REPLACE);
    }
  }
}

FamilyImage[][] findMostSimilarImagesToPixelColors(int[][] averageGreyscalePerBox) {
  FamilyImage[][] mostSimilarImages = new FamilyImage[averageGreyscalePerBox.length][averageGreyscalePerBox[0].length];
  
  for (int y = 0; y < averageGreyscalePerBox.length; y++) {
    for (int x = 0; x < averageGreyscalePerBox[y].length; x++) {
      FamilyImage mostSimilarImage = findMostSimilarImageToPixelColor(averageGreyscalePerBox[y][x]);
      mostSimilarImages[y][x] = mostSimilarImage; 
    }
  }
  
  return mostSimilarImages;
}

FamilyImage findMostSimilarImageToPixelColor(int greyscale) {
  FamilyImage imageWithShortestDistance = null;
  int shortestDistance = 255;
  for (int i = 0; i < familyImages.length; i++) {
    int colorDifference = Math.abs(familyImages[i].greyscale - greyscale);
    if (colorDifference < shortestDistance) {
      shortestDistance = colorDifference;
      imageWithShortestDistance = familyImages[i];
    }
  }
    
  return imageWithShortestDistance;
}

int[][] calculateAverageGreyscalePerBox (int[][][] boxes) {
  int[][] averageGreyscalePerBox = new int[boxes.length][boxes[0].length];

  for (int y = 0; y < boxes.length; y++) {
    for (int x = 0; x < boxes[y].length; x++) {
      int sumOfGreyscale = 0;
      for (int z = 0; z < boxes[y][x].length; z++) {
        sumOfGreyscale += boxes[y][x][z];
      }
      averageGreyscalePerBox[y][x] = sumOfGreyscale / boxes[y][x].length;
    }
  }
  
  return averageGreyscalePerBox;
}

int [][][] createBoxes(int SIZE_OF_BOXES_TO_REPLACE) {
  println("KJ_IMAGE has size of " + KJ_IMAGE.width + " X " + KJ_IMAGE.height);
  println("initializing boxes with " + (KJ_IMAGE.width) + " X " + KJ_IMAGE.height + " Dimensions");
  int[][][] boxes = new int [KJ_IMAGE.width / SIZE_OF_BOXES_TO_REPLACE][KJ_IMAGE.height / SIZE_OF_BOXES_TO_REPLACE][SIZE_OF_BOXES_TO_REPLACE * SIZE_OF_BOXES_TO_REPLACE];
  
  if ((KJ_IMAGE.width % SIZE_OF_BOXES_TO_REPLACE == 0) && (KJ_IMAGE.height % SIZE_OF_BOXES_TO_REPLACE == 0)) {
    int numberOfBoxes = (KJ_IMAGE.width / SIZE_OF_BOXES_TO_REPLACE) * (KJ_IMAGE.height * SIZE_OF_BOXES_TO_REPLACE );
    println("creating " + numberOfBoxes + " boxes, each having " + SIZE_OF_BOXES_TO_REPLACE + "X" + SIZE_OF_BOXES_TO_REPLACE + " dimensions - which works for KJ_IMAGE size");
  }
  
  // take KJ_IMAGE iterate over every 10X10 block and replace with the closest matching family image
  for (int y = 0; y < KJ_IMAGE.height; y++) {
    for (int x = 0; x < KJ_IMAGE.width; x++) {
      int trueX = x;
      int trueY = y;
      
      int boxIndexX = (int) Math.ceil(trueX / SIZE_OF_BOXES_TO_REPLACE);
      int boxIndexY = (int) Math.ceil(trueY / SIZE_OF_BOXES_TO_REPLACE);
      int boxIndexZ = trueX - (boxIndexX * SIZE_OF_BOXES_TO_REPLACE) + (y - (boxIndexY * SIZE_OF_BOXES_TO_REPLACE)) * SIZE_OF_BOXES_TO_REPLACE;
      
      int loc = x + y * KJ_IMAGE.width;
      int greyscale = gray(KJ_IMAGE.pixels[loc]);
      
      boxes[boxIndexY][boxIndexX][boxIndexZ] = greyscale;
    }
  }

  println("initializing boxes with " + (KJ_IMAGE.width / SIZE_OF_BOXES_TO_REPLACE) + " X " + KJ_IMAGE.height / SIZE_OF_BOXES_TO_REPLACE + " Dimensions");

  return boxes;
}



class FamilyImage {
  public PImage image;
  public int greyscale;
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
  }
}


// https://processing.org/discourse/beta/num_1159135995.html
static final int gray(color value) { 
  int r=(value&0x00FF0000)>>16; // red part
  int g=(value&0x0000FF00)>>8; // green part
  int b=(value&0x000000FF); // blue part
  return (r + g + b) / 3;   
}