//
//  boundaryExtract.cpp
//  RegionFill
//
//  Created by aambasth on 3/20/16.
//
//

#include <stdio.h>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>

using namespace cv;
int main(int argc, char ** argv){
    Mat img;
    img = imread("./fill.jpg");

    Mat eroded;
    Mat kernel = Mat::ones(3, 3, CV_8U);

    erode(img, eroded, kernel);
    Mat dst = img - eroded;

    namedWindow("Filled");
    imshow("Filled", img);

    namedWindow("Boundary");
    imshow("Boundary", dst);

    waitKey();
    return 0;
}
