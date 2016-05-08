import imutils
import time
import cv2
import numpy as np
from skimage.transform import pyramid_gaussian

def pyramid(image, scale=1.5, minSize=(30,30)):
    yield image

    while True:
        w = int(image.shape[1] / scale)
        image = imutils.resize(image, width=w)

        if image.shape[0] < minSize[1] or image.shape[1] < minSize[0]:
            break
        yield image


def sliding_window(image, step_size, window_size):
    for y in xrange(0, image.shape[0], step_size):
        for x in xrange(0, image.shape[1], step_size):
            yield (x, y, image[y:y + window_size[1], x:x + window_size[0]])


if __name__ == '__main__':
    image = cv2.imread('./pedestrian.jpg')

    win_w = 64
    win_h = 64
    for resized in pyramid_gaussian(image, downscale=1.5):
        for (x, y, window) in sliding_window(resized, step_size=4, window_size=(win_w, win_h)):
            if window.shape[0] != win_h or window.shape[1] != win_w:
                continue
            #Object Detection Here!

            #clone = resized.copy()
            #cv2.rectangle(clone, (x, y), (x + win_w, y + win_h), (0, 0, 255), 1)
            cv2.imshow('Window', window)
            cv2.waitKey(1)
            #time.sleep(0.015)
