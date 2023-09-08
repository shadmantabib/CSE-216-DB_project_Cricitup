import os
import requests
from bs4 import BeautifulSoup
from urllib.parse import quote

# Function to download images from Google Images
def download_images(query, filename):
    if os.path.exists(filename):
        print(f"Image already exists for {query}")
        return

    try:
        # Create a Google Images search URL for the query
        query_url = f"https://www.google.com/search?q={quote(query)}&tbm=isch"

        # Set headers to mimic a real browser request
        headers = {
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36"
        }

        # Send a GET request to the Google Images search URL
        response = requests.get(query_url, headers=headers)

        # Parse the response content with BeautifulSoup
        soup = BeautifulSoup(response.text, 'html.parser')

        # Find and extract image URLs from the parsed HTML
        img_tags = soup.find_all('img')
        img_urls = [img['src'] for img in img_tags if 'src' in img.attrs]

        # Filter out small or irrelevant images by checking dimensions (adjust as needed)
        img_urls = [url for url in img_urls if 'http' in url and not url.endswith('gif')]

        # Download the first image (you can modify this to download more images if needed)
        if img_urls:
            img_url = img_urls[0]
            response = requests.get(img_url, allow_redirects=True, timeout=10)
            if response.status_code == 200:
                with open(filename, 'wb') as file:
                    file.write(response.content)
                print(f"Downloaded: {filename}")
            else:
                print(f"Failed to download {query} image (HTTP {response.status_code})")
        else:
            print(f"No images found for {query}")

    except requests.exceptions.RequestException as e:
        print(f"Error while downloading {query} image: {str(e)}")

# Read the input file containing missing keywords and corresponding indices
with open('static/cricitup/images/search.txt', 'r') as file:
    missing_keywords = [line.strip() for line in file.readlines()]

# Create a directory to store downloaded images
if not os.path.exists('missing_images'):
    os.makedirs('missing_images')

# Iterate through each missing keyword and download an image
for missing_keyword in missing_keywords:
    index, keyword = missing_keyword.split(', ', 1)
    filename = os.path.join('missing_images', f'{index.strip()}.png')  # Remove whitespace and extra .png
    download_images(keyword, filename)
