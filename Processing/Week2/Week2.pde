
// first define a bunch of images ( 1 kj, 10 eve, 10 gabe) all in grey scale
// Map through each eve and gabe image
PImage kjImage;

FamilyImage[] familyImages;
String imagesPath = "images/family/";
static final int SIZE_OF_BOXES_TO_REPLACE = 10;
static final int KJ_STARTING_POSITION_X = 0;
static final int KJ_STARTING_POSITION_Y = 0;


void setup() {
  size(300, 300);
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
  performSelfPortrait();
  // image(kjImage, 10, 0);
  // must include a default start top-left position - to work with partner
}

void performSelfPortrait() {
  // first create boxes of all the pixels
  
  // then create boxes of the averages
  int[][][] boxesOfPixels = createBoxes(SIZE_OF_BOXES_TO_REPLACE);
  
  
  int[][] averageGreyscalePerBox = calculateAverageGreyscalePerBox(boxesOfPixels);
  
  FamilyImage[][] mostSimilarImages = findMostSimilarImagesToPixelColors(averageGreyscalePerBox);
  
  paintImagesInPlaceOfPortrait(mostSimilarImages);
}

void paintImagesInPlaceOfPortrait(FamilyImage[][] mostSimilarImages) {
  int portraitWidth = kjImage.width;
  int numberOfColumns = portraitWidth / SIZE_OF_BOXES_TO_REPLACE;
  int currentRow = -1;
  
  for (int y = 0; y < mostSimilarImages.length; y++) {
    for (int x = 0; x < mostSimilarImages[y].length; x++) {
      int x_location = x * SIZE_OF_BOXES_TO_REPLACE + KJ_STARTING_POSITION_X;
      int y_location = y * SIZE_OF_BOXES_TO_REPLACE + KJ_STARTING_POSITION_Y;
      image(mostSimilarImages[y][x].image, x_location, y_location, SIZE_OF_BOXES_TO_REPLACE, SIZE_OF_BOXES_TO_REPLACE);
    }

    //if (y % SIZE_OF_BOXES_TO_REPLACE == 0) {
      //currentRow++;
    //}

    //int x = i * SIZE_OF_BOXES_TO_REPLACE + KJ_STARTING_POSITION_X;
    //int y = currentRow * SIZE_OF_BOXES_TO_REPLACE + KJ_STARTING_POSITION_Y;
    // print(currentRow * SIZE_OF_BOXES_TO_REPLACE + KJ_STARTING_POSITION_Y + ", ");
    // print(y + ", ");
    
    //image(mostSimilarImages[i].image, x, y, SIZE_OF_BOXES_TO_REPLACE, SIZE_OF_BOXES_TO_REPLACE);
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
    
  return familyImages[0];
}

int[][] calculateAverageGreyscalePerBox (int[][][] boxes) {
  int[][] averageGreyscalePerBox = new int[boxes.length][boxes[0].length];

  for (int y = 0; y < boxes.length; y++) {
    int sumOfGreyscale = 0;
    for (int x = 0; x < boxes[y].length; x++) {
      for (int z = 0; z < boxes[y][x].length; z++) {
        sumOfGreyscale += boxes[y][x][z];
      }
      averageGreyscalePerBox[y][x] = sumOfGreyscale / boxes[y][x].length;
    }
  }
  
  return averageGreyscalePerBox;
}

int [][][] createBoxes(int SIZE_OF_BOXES_TO_REPLACE) {
  println("kjImage has size of " + kjImage.width + " X " + kjImage.height);
  println("initializing boxes with " + (kjImage.width) + " X " + kjImage.height + " Dimensions");
  int[][][] boxes = new int [kjImage.width / SIZE_OF_BOXES_TO_REPLACE][kjImage.height / SIZE_OF_BOXES_TO_REPLACE][SIZE_OF_BOXES_TO_REPLACE * SIZE_OF_BOXES_TO_REPLACE];
  
  if ((kjImage.width % SIZE_OF_BOXES_TO_REPLACE == 0) && (kjImage.height % SIZE_OF_BOXES_TO_REPLACE == 0)) {
    int numberOfBoxes = (kjImage.width / SIZE_OF_BOXES_TO_REPLACE) * (kjImage.height * SIZE_OF_BOXES_TO_REPLACE );
    println("creating " + numberOfBoxes + " boxes, each having " + SIZE_OF_BOXES_TO_REPLACE + "X" + SIZE_OF_BOXES_TO_REPLACE + " dimensions - which works for kjImage size");
  }
  
  // take kjImage iterate over every 10X10 block and replace with the closest matching family image
  for (int y = 0; y < kjImage.height; y++) {
    for (int x = 0; x < kjImage.width; x++) {
      int trueX = x;
      int trueY = y;
      
      int boxIndexX = (int) Math.ceil(trueX / SIZE_OF_BOXES_TO_REPLACE);
      int boxIndexY = (int) Math.ceil(trueY / SIZE_OF_BOXES_TO_REPLACE);
      int boxIndexZ = trueX - (boxIndexX * SIZE_OF_BOXES_TO_REPLACE) + (y - (boxIndexY * SIZE_OF_BOXES_TO_REPLACE)) * SIZE_OF_BOXES_TO_REPLACE;
      
      int loc = x + y * kjImage.width;
      int greyscale = gray(kjImage.pixels[loc]);
      
      boxes[boxIndexX][boxIndexY][boxIndexZ] = greyscale;
    }
  }

  println("initializing boxes with " + (kjImage.width / SIZE_OF_BOXES_TO_REPLACE) + " X " + kjImage.height / SIZE_OF_BOXES_TO_REPLACE + " Dimensions");

  return boxes;
}



class FamilyImage {
  public PImage image;
  public int greyscale;
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