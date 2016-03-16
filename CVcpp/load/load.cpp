#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

using namespace cv;

int main(int argc, char ** argv){
  char* imageName = argv[1];

  Mat image;
  image = imread(imageName, 0);

  if( argc != 2 || !image.data){
    printf("No image data");
    return -1;
  }

  namedWindow(imageName, CV_WINDOW_AUTOSIZE);
  imshow(imageName, image);
  waitKey(0);

  return 0;
}
