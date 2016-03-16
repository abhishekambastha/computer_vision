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
from progressbar import ProgressBar
pbar = ProgressBar()

imageURL = './input/ps1-input0.png'

debug_view = False

def showImage(title, image):
    if debug_view:
        cv2.imshow(title, image)
        cv2.waitKey(0)
        cv2.destroyAllWindows()

img = cv2.imread(imageURL)
showImage('Image', img)
img_gray = cv2.cvtColor(img, cv2.COLOR_RGB2GRAY)
img_edge = cv2.Canny(img_gray, 100, 200)
_, img_edge = cv2.threshold(img_edge, 100, 255, cv2.THRESH_BINARY)
showImage('Edge', img_edge)

#Accumulator Array
r, c = img_edge.shape
diag = math.sqrt(r**2 + c**2)
H = np.zeros(shape=(2*diag + 1, 181), dtype=np.uint64)

degree = np.deg2rad(np.arange(-90.0 ,90.0))
cos_vector = np.cos(degree)
sin_vector = np.sin(degree)

#for (x, y), value in np.ndenumerate(img_edge):
#    if value > 0:
#        for theta in xrange(181):
#            d = x * math.cos(math.degrees(theta)) - y * math.sin(math.degrees(theta))
#            if d in xrange(int(-1*d_max), int(d_max)):
#                H[int(d), theta] += 1

print 'Entered For loop'
d_list = []
for (r, c), value in np.ndenumerate(img_edge):
    d = c * cos_vector - r * sin_vector + diag
    d = d.astype(np.int64)
    bins = np.bincount(d)

    d_list.append(d)

import pdb; pdb.set_trace()

#np.concatenat)
