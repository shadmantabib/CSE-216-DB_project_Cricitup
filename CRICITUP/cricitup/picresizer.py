from PIL import Image

# Open the image
image = Image.open('static/cricitup/images/paksl.jpg')

# Define the new width and height
new_width = 702
new_height = 908

# Resize the image to the specified dimensions
resized_image = image.resize((new_width, new_height))

# Save the resized image with the specified folder path and filename
output_path = 'static/cricitup/images/pakslr.jpg'
resized_image.save(output_path)

# Close the original and resized images
image.close()
resized_image.close()
