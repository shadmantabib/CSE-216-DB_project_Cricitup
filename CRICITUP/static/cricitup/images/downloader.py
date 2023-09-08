import os
import requests
from bs4 import BeautifulSoup

# Cricket website URL (replace with the actual URL)
website_url = "https://www.examplecricketwebsite.com"

# Send a request to the cricket website URL
response = requests.get(website_url)

if response.status_code == 200:
    soup = BeautifulSoup(response.text, 'html.parser')

    # Find the HTML elements containing the cricket images (modify based on website structure)
    image_elements = soup.find_all('img', class_='cricket-image-class')

    # Create a folder to save the images
    os.makedirs("cricket_images", exist_ok=True)

    # Download and save each cricket image
    for idx, img_element in enumerate(image_elements, start=1):
        img_url = img_element['src']
        image_filename = f"cricket_images/image_{idx}.jpg"

        # Download the image
        img_response = requests.get(img_url)

        if img_response.status_code == 200:
            with open(image_filename, "wb") as image_file:
                image_file.write(img_response.content)
            print(f"Downloaded {image_filename}")
        else:
            print(f"Failed to download image {idx}")

else:
    print(f"Failed to fetch cricket website: {website_url}")
