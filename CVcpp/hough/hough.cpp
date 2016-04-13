/*
 author: Abhishek Ambastha
 Linear Hough Transform
 TO-DO: Use gradient for robustness
 */

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>
#include <math.h>
#include <vector>
#include "hough.hpp"

#define DEG2RAD  0.0174533

using namespace cv;
using namespace std;

int main(int argc, char *argv[])
{

    Mat image;
    Mat dup;
    image = imread("/Users/aambasth/personalProjects/houghTransform/lines/input/ps1-input1.png");
    GaussianBlur(image, dup, Size(7,7), 2);

    Mat houghAcc = houghTransform(dup);
    imwrite("./output.jpg", houghAcc);

    int diagonal = sqrt(pow(image.cols, 2) + pow(image.rows, 2));
    vector< pair<int, int> > lines = findPeaks(houghAcc, diagonal);

    for (auto it = lines.begin(); it != lines.end(); ++it) {
        cout << "Rho: "<< it->first<< " Theta: " << it->second << endl;
    }

    vector< pair<int, int> > v;
    drawLines(image, lines);

    namedWindow("image");
    imshow("image", image);
    waitKey();
    return 0;
}

Mat& houghTransform(Mat& image){
    Mat image_edge;
    Canny(image, image_edge, 50, 180, 3);

    namedWindow("edge");
    imshow("edge", image_edge);
    int diagonal = sqrt(pow(image_edge.rows, 2) + pow(image_edge.cols, 2));
    int degrees = 180;

    double center_x = image.cols /2 ;
    double center_y = image.rows/2 ;

    static Mat houghAcc = Mat::zeros(2*diagonal , degrees , CV_8U);

    for (int x = 0; x < image_edge.cols; x++) {
        for (int y =0 ; y < image_edge.rows; y++) {
            if(image_edge.at<uchar>(y, x) > 20){
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
            if ((int)houghAcc.at<uchar>(j,i) > 70) {
                lines.push_back(pair<int, int>(j - diagonal, i));
            }
        }
    }

    return lines;
}

void drawLines(Mat& image, vector< pair<int, int> > v){
    vector< Point > lineEnds;

    cout << image.rows << ", " << image.cols << endl;
    int step = 0;
    for (auto it = v.begin(); it != v.end(); ++it) {
        int rho = it->first;
        int theta = it->second;
        cout << rho << "\t "<< theta << endl;

        double a = cos(theta * DEG2RAD), b = sin(theta * DEG2RAD);
        double x0 = a*rho, y0 = b*rho;

        Point pt1;
        Point pt2;

        int length = 1000;
        pt1.x = cvRound(x0 + length*(-b)) + image.cols /2.0;
        pt1.y = cvRound(y0 + length*(a)) + image.rows/2.0;
        pt2.x = cvRound(x0 - length*(-b)) + image.cols/2.0;
        pt2.y = cvRound(y0 - length*(a)) + image.rows/2.0;

        line( image, pt1, pt2, Scalar(0,255,0), 1, CV_AA);
        cout<< step++ << ": " << pt1 << ", " << pt2 <<endl;
    }
}
