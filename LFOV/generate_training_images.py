import cv2
import numpy as np
import matplotlib.pyplot as plt

def resample_image(im, box, target_size):
    height_im = im.shape[0]
    width_im = im.shape[1]

    x1 = box[0][0]
    y1 = box[0][1]
    x4 = box[1][0]
    y4 = box[1][1]

    rescale_y = 1.0*target_size / (y4 - y1)
    rescale_x = 1.0*target_size / (x4 - x1)

    new_h = int(rescale_y * height_im)
    new_w = int(rescale_x * width_im)

    new_x1 = int(x1 * rescale_x)
    new_y1 = int(y1 * rescale_y)

    new_x4 = int(x4 * rescale_x)
    new_y4 = int(y4 * rescale_y)

    im_resized = cv2.resize(im, (new_w, new_h))

    cv2.rectangle(im_resized, (new_x1, new_y1), (new_x4, new_y4), (0,0,255), 1)

    return im_resized

def _get_image_blob(im):
    """Converts an image into a network input.

    Arguments:
        im (ndarray): a color image in BGR order

    Returns:
        blob (ndarray): a data blob holding an image pyramid
        im_scale_factors (list): list of image scales (relative to im) used
            in the image pyramid
    """
    im_orig = im.astype(np.float32, copy=True)

    im_shape = im_orig.shape
    im_size_min = np.min(im_shape[0:2])
    im_size_max = np.max(im_shape[0:2])

    processed_ims = []
    im_scale_factors = []

    for target_size in 600:
        im_scale = float(target_size) / float(im_size_min)
        # Prevent the biggest axis from being more than MAX_SIZE
        if np.round(im_scale * im_size_max) > cfg.TEST.MAX_SIZE:
            im_scale = float(cfg.TEST.MAX_SIZE) / float(im_size_max)
        im = cv2.resize(im_orig, None, None, fx=im_scale, fy=im_scale,
                        interpolation=cv2.INTER_LINEAR)
        im_scale_factors.append(im_scale)
        processed_ims.append(im)

if __name__ == '__main__':
    im = cv2.imread('./images/soccer.jpg')
    box = [(160, 120), (305, 265)]
    im_resized = resample_image(im, box, 16)
    plt.subplot(2,1,1)
    plt.imshow(im_resized)
    plt.show()

    l = _get_image_blob(im)
    import pdb; pdb.set_trace()

