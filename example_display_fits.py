from astropy.io import fits
import matplotlib.pyplot as plt
from astropy.visualization import ImageNormalize, SqrtStretch

# Path to your FITS file
file_path = '../superbit-lensing/data/Abell3411/b/cal/Abell3411_1_300_1683033980_clean.fits'

# Open the FITS file
hdulist = fits.open(file_path)
hdulist.info()  # Lists all HDUs in the file

# Grab the primary HDU (index 0)
hdu = hdulist[0]
data = hdu.data
header = hdu.header

# (Optional) Examine header metadata
print(header)

# Normalize and display the image
norm = ImageNormalize(data, stretch=SqrtStretch())
plt.figure(figsize=(8, 8))
plt.imshow(data, origin='lower', cmap='gray', norm=norm)
plt.colorbar(label='Pixel Value')
plt.title('FITS Image Visualization')
plt.xlabel('X Pixel')
plt.ylabel('Y Pixel')
plt.show()

# Close the file when done
hdulist.close()
