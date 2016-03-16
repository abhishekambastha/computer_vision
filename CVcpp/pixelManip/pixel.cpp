#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>
#include <math.h>

double DEG2RAD = 3.14 / 180;

using namespace cv;
using namespace std;

int main(int argc, char** argv){
    char* imageName = argv[1];

    Mat image;
    image = imread("../../houghTransform/lines/input/ps1-input0.png", 0);

    if(argc !=2 || !image.data) return -1;

    Canny(image, image, 10, 100, 3);

    //Accumulator Array Dimensions
    int diag_length = sqrt(pow(image.rows, 2) + pow(image.cols, 2));
    int deg_size = 180;

    cout << diag_length << "\n";


    //Calculation

    double maxVal = 0;

    Mat houghAcc = Mat::zeros(2*diag_length, deg_size, CV_32F);
    for(int x=0; x<image.cols; x++){
        for(int y=0; y<image.rows; y++){
            //Formula d = x
            if(image.at<Vec3b>(y,x)[0] > 200){
                for (int theta=0; theta < 180; theta++) {
                    double r = (double)x * cos(theta * DEG2RAD) + (double)y * sin(theta *DEG2RAD)+diag_length;
                    houghAcc.at<double>((int)r, theta) += 1;
                }
            }
        }
    }

    cout << maxVal << "\n";


    namedWindow(imageName, CV_WINDOW_AUTOSIZE);
    imshow(imageName, image);

    normalize(houghAcc, houghAcc, 0, 1, NORM_MINMAX);
    namedWindow("Acc", CV_WINDOW_AUTOSIZE);
    imshow("Acc", houghAcc);
    waitKey(0);

    return 0;
}

/*
 uchar pixelVal;
 for(int i=0; i<image.cols; i++){
 for(int j=0; j<image.rows; j++){
 Vec3b &intensity = image.at<Vec3b>(j,i);
 image.at<Vec3b>(j, i)[0] = 0;
 image.at<Vec3b>(j, i)[1] = 0;
 }
 }
 */

