#include <opencv2/core/core.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>

using namespace std;
using namespace cv;


int main(int argc, char *argv[])
{
    Mat src;
    src = imread("../A.jpg", CV_LOAD_IMAGE_GRAYSCALE);
    resize(src, src, Size(256,256));

    threshold(src, src, 100, 255, CV_THRESH_BINARY_INV);

    normalize(src, src, 0,1, NORM_MINMAX);

    Mat dst;
    dst = Mat::zeros(src.size(), CV_8U);

    //Hardcoded value
    dst.at<uchar>(75,75) = 1;

    Mat prev;
    Mat kernel = (cv::Mat_<uchar>(3,3) << 0, 1, 0, 1, 1, 1, 0, 1, 0);

    do {
        dst.copyTo(prev);
        dilate(dst, dst, kernel);
        dst &= (1 - src);
    }
    while (countNonZero(dst - prev) > 0);

    src = 1 - src;
    normalize(src, src, 0, 255, NORM_MINMAX);
    normalize(dst, dst, 0, 255, NORM_MINMAX);

    namedWindow("Input Image");
    imshow("Input Image", src);

    imwrite("./fill.jpg", dst);
    namedWindow("out");
    imshow("out", dst);

    waitKey();
    return 0;
}
