#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <iostream>

using namespace std;
using namespace cv;

int main(int argc, char *argv[])
{

    cout << "Hey Buddy" <<endl;
    if (argc < 2) {
        return -1;
    }

    Mat image = imread(argv[1]);
    Mat edges;
    Canny(image, edges, 350, 590);

    namedWindow("Image");
    imshow("Image", image);

    namedWindow("Edges");
    imshow("Edges", edges);
    waitKey();

    return 0;
}
