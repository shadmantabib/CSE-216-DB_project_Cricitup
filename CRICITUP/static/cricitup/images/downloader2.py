import os
import requests
from duckduckgo_search import DDGS

# Create a folder to save the images
os.makedirs("static/cricitup/images/", exist_ok=True)

# Function to download images using DuckDuckGo search
def download_image(query, index):
    filename = os.path.join("static/cricitup/images/", f"{index}.jpg")

    # Check if the image already exists
    if os.path.exists(filename):
        print(f"Image already exists for {query}")
        return

    try:
        # Use the DDGS().images() generator
        results = list(DDGS().images(query))
        if results:
            img_url = results[0].get("image")
            if img_url:
                try:
                    response = requests.get(img_url, allow_redirects=True, timeout=10)
                    response.raise_for_status()
                    if response.status_code == 200:
                        with open(filename, "wb") as file:
                            file.write(response.content)
                        print(f"Downloaded: {filename}")
                    else:
                        print(f"Failed to download {query} image (HTTP {response.status_code})")
                except requests.exceptions.RequestException as e:
                    print(f"Error while downloading {query} image: {str(e)}")
            else:
                print(f"No image found for {query}")
        else:
            print(f"No image found for {query}")
    except requests.exceptions.HTTPError as e:
        print(f"Error while searching for {query} image: {str(e)}")

# Open the text file containing cricketer names
with open("static/cricitup/images/search.txt", "r") as file:
    for idx, cricketer_name in enumerate(file, start=2000):  # Start the index from 2000
        cricketer_name = cricketer_name.strip()  # Remove leading/trailing whitespace
        download_image(cricketer_name, idx)

print("All downloads completed.")
