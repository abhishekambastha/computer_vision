/*
 author: Abhishek Ambastha
 */

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>
#include <math.h>
#include <vector>
#include "hough.hpp"

#define DEG2RAD  3.14 / 180

using namespace cv;
using namespace std;


int main(int argc, char *argv[])
{

    Mat image;
    image = imread("../../houghTransform/lines/input/ps1-input0.png");

    Mat houghAcc = houghTransform(image);
    imwrite("./output.jpg", houghAcc);

    int diagonal = sqrt(pow(image.cols, 2) + pow(image.rows, 2));
    vector< pair<int, int> > lines = findPeaks(houghAcc, diagonal);

    for (auto it = lines.begin(); it != lines.end(); ++it) {
      cout << "Rho: "<< it->first<< " Theta: " << it->second << endl;
    }

    return 0;
}

Mat& houghTransform(Mat image){

    Mat image_edge;
    blur(image, image, Size(5,5));
    Canny(image, image_edge, 100, 150, 3);

    int diagonal = sqrt(pow(image_edge.rows, 2) + pow(image_edge.cols, 2));
    int degrees = 180;

    double center_x = image.cols /2 ;
    double center_y = image.rows/2 ;

    static Mat houghAcc = Mat::zeros(2*diagonal , degrees , CV_8U);

    for (int x = 0; x < image_edge.cols; x++) {
      for (int y =0 ; y < image_edge.rows; y++) {
        if(image_edge.at<uchar>(y, x) > 100){
          for(int theta = 0; theta < 180 ; theta ++){
            double r = ((double)x - center_x)*cos((double)theta * DEG2RAD)
              + ((double)y - center_y)*sin((double)theta * DEG2RAD);
            houghAcc.at<uchar>(round(r+diagonal), theta) += 1;
          }
        }
      }
    }
    return houghAcc;
}

vector< pair<int, int> >& findPeaks(const Mat &houghAcc, int diagonal){

    static vector< pair<int, int> > lines;

    for (int i = 0; i < houghAcc.cols; i++) {
      for (int j = 0; j < houghAcc.rows; j++) {
        if ((int)houghAcc.at<uchar>(j,i) > 119) {
          lines.push_back(pair<int, int>(j - diagonal, i));
        }
      }
    }

    return lines;
}
