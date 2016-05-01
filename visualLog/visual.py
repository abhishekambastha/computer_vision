# pip install visual-logging
from logging import FileHandler
from vlogging import VisualRecord
import logging
import cv2
import numpy as np
import matplotlib.pyplot as plt


logger = logging.getLogger("visual_logging_example")
fh = FileHandler("demo.html", mode="w")

logger.setLevel(logging.DEBUG)
logger.addHandler(fh)

image = cv2.imread('./alia.jpg')
image = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

for s in xrange(3, 11, 2):
    blurred = cv2.GaussianBlur(image, (s, s), 0)
    edged = cv2.Canny(blurred, 75, 200)
    logger.debug(VisualRecord(("Detected edges using sigma %d " % (s)), [blurred, edged], fmt = "jpg"))

t = np.arange(0.01, 20.0, 0.01)

fig = plt.figure()
plt.semilogy(t, np.exp(-t/5.0))
plt.title('semilogy')
plt.grid(True)

logger.info(VisualRecord(("Trying to save a plot"), fig, fmt="png"))
