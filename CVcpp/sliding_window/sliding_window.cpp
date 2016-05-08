#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/video/background_segm.hpp>
#include <opencv2/video/tracking.hpp>

using namespace std;
using namespace cv;

int main(int argc, char *argv[])
{
    Mat LoadedImage;
    LoadedImage = imread("/Users/aambasth/personalProjects/thesis/attempt1/images/pedestrian.jpg");

    namedWindow("Image Loaded");
    imshow("Image Loaded", LoadedImage);

    int windows_n_rows = 128;
    int windows_n_cols = 128;

    Mat DrawResultGrid= LoadedImage.clone();

    int StepSlide = 32;

    namedWindow("Step 2 draw Rectangle", WINDOW_AUTOSIZE);
    Mat DrawResultHere = LoadedImage.clone();
    for (int row = 0; row <= LoadedImage.rows - windows_n_rows; row += StepSlide)
    {
        // Cycle col step

        for (int col = 0; col <= LoadedImage.cols - windows_n_cols; col += StepSlide)
        {
            Rect windows(col, row, windows_n_rows, windows_n_cols);

            // Draw only rectangle
            rectangle(DrawResultHere, windows, Scalar(255), 1, 8, 0);
            // Draw grid

            imshow("Step 2 draw Rectangle", DrawResultHere);
            waitKey(15);
        }
    }
    
    return 0;
}
