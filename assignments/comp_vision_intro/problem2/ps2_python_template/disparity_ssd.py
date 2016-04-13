import math
import numpy as np
import cv2

def disparity_ssd(L, R):
    """Compute disparity map D(y, x) such that: L(y, x) = R(y, x + D(y, x))

    Params:
    L: Grayscale left image
    R: Grayscale right image, same size as L

    Returns: Disparity map, same size as L, R
    """

    # TODO: Your code here

    kernel_size = 3;
    r, c = L.shape

    D = np.zeros_like(L)

    num_blocks_horizontal = int(math.floor(1.0 * c / kernel_size))
    num_blocks_vertical = int(math.floor(1.0 * r / kernel_size))

    print num_blocks_vertical

    for j in xrange(num_blocks_horizontal):
        for i in xrange(num_blocks_vertical):
            patch = L[i*kernel_size:(i+1)*kernel_size][j*kernel_size:(j+1)*kernel_size]
            strip = R[i*kernel_size:(i+1)*kernel_size][:]

            #Find disparity
            result = cv2.matchShapes(patch, strip, cv2.TM_SQDIFF_NORMED, 0)
            _, _, min_loc, max_loc = cv2.minMaxLoc(result)

            if min_loc[1]:
                print i, j
