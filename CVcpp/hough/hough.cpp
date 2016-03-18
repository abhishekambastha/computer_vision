#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>
#include <math.h>

using namespace cv;
using namespace std;

double DEG2RAD = 3.14 / 180;

int main(int argc, char *argv[])
{

  Mat image;
  Mat image_edge;
  image = imread("../../houghTransform/lines/input/ps1-input0.png");

  blur(image, image, Size(5,5));
  Canny(image, image_edge, 100, 150, 3);

  int diagonal = sqrt(pow(image_edge.rows, 2) + pow(image_edge.rows, 2));
  int degrees = 180;

  double center_x = image.cols /2 ;
  double center_y = image.rows/2 ;

  Mat houghAcc = Mat::zeros(2*diagonal , degrees , CV_8U);
  for (int x = 0; x < image_edge.cols; x++) {
    for (int y =0 ; y < image_edge.rows; y++) {
      if(image_edge.at<uchar>(y, x) > 100){
        for(int theta = 0; theta < 180 ; theta ++){
          double r = ((double)x - center_x)*cos((double)theta * DEG2RAD)
            + ((double)y - center_y)*sin((double)theta * DEG2RAD);
          //uchar a  = 1;
          houghAcc.at<uchar>(round(r+diagonal), theta) += 1;
        }
    }
    }

  }

  cout << image_edge.rows<< ", " << image_edge.cols << endl;
  cout << image.rows<< ", " << image.cols << endl;

  imwrite("./output.jpg", houghAcc);

  namedWindow("MyImage", CV_WINDOW_AUTOSIZE);
  imshow("MyImage", houghAcc);
  waitKey(0);
  return 0;
}
