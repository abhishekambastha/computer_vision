#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <stdio.h>

using namespace cv;
using namespace std;

int main(int argc, char** argv){
  char* imageName = argv[1];

  Mat image;
  image = imread("../../houghTransform/lines/input/ps1-input2.png");

  if(argc !=2 || !image.data)
    return -1;

  blur(image, image, Size(10,10));
  namedWindow(imageName, CV_WINDOW_AUTOSIZE);
  imshow(imageName, image);
  waitKey(0);

  return 0;
}
