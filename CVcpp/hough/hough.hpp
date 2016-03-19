
#ifndef __PER_HOUGH__
#define __PER_HOUGH__
cv::Mat& houghTransform(cv::Mat image);
void findPeaks(const cv::Mat &houghAcc, int diagonal);
#endif
