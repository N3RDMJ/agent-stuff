from playwright.sync_api import sync_playwright
import os

# Example: Automating interaction with static HTML files using file:// URLs

html_file_path = os.path.abspath("web/ui/index.html")
file_url = f"file://{html_file_path}"

with sync_playwright() as p:
    browser = p.chromium.launch(headless=True)
    page = browser.new_page(viewport={"width": 1920, "height": 1080})

    # Navigate to local HTML file
    page.goto(file_url)

    # Take screenshot
    page.screenshot(path="/tmp/static_page.png", full_page=True)

    # Interact with elements
    page.click("text=Search")
    page.fill("#resourceId", "example-id")
    page.fill("#queryParams", "name=Doe")

    # Submit form
    page.click("text=Search")
    page.wait_for_timeout(500)

    # Take final screenshot
    page.screenshot(path="/tmp/after_submit.png", full_page=True)

    browser.close()

print("Static HTML automation completed!")
