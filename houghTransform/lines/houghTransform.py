'''
Hough Transform

1. Find the edges
2. Create accumulator array H[d, theta]
3. parametric line: xcos(theta) -ysin(theta) = d
4. Iterate the array for the theta's and vote the d's
5. Find the peak

'''

import cv2
import numpy as np
import math

imageURL = './input/ps1-input0.png'

img = cv2.imread(imageURL)
cv2.imshow('Image', img)
cv2.waitKey(0)
cv2.destroyAllWindows()

img_gray = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
print img_gray.shape

img_edge = cv2.Canny(img_gray, 100, 200)
cv2.imshow('Edge', img_edge)
cv2.waitKey(0)
cv2.destroyAllWindows()

#Accumulator Array
r, c = img_edge.shape
_, img_edge = cv2.threshold(img_edge, 100, 255, cv2.THRESH_BINARY)
d_max = math.sqrt(r**2 + c**2)
H = np.zeros(shape=(2*d_max + 1, 181), dtype=np.int32)


for (x, y), value in np.ndenumerate(img_edge):
    if value > 0:
        for theta in xrange(181):
            d = x * math.cos(math.degrees(theta)) - y * math.sin(math.degrees(theta))
            if d in xrange(int(-1*d_max), int(d_max)):
                H[int(d), theta] += 1

import pdb; pdb.set_trace()

cv2.imshow('accumulator', H)
cv2.waitKey(0)
cv2.destroyAllWindows()
