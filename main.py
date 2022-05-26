from flask import Flask, send_file
import chromedriver_binary  # Adds chromedriver binary to path

app = Flask(__name__)


@app.route('/')
def index():
    # Test secrets
    with open('/etc/secrets/id/admin-id') as admin_id, open('/etc/secrets/pw/admin-pw') as admin_pw:
        test_id = admin_id.read()
        test_pw = admin_pw.read()
        print(test_id, test_pw)

    # Test Selenium
    from selenium import webdriver
    chrome_options = webdriver.ChromeOptions()
    chrome_options.add_argument('--headless')
    chrome_options.add_argument('--disable-gpu')
    chrome_options.add_argument('window-size=1024,768')
    chrome_options.add_argument('--no-sandbox')

    browser = webdriver.Chrome(chrome_options=chrome_options)
    browser.get('https://www.google.com/search?q=headless+horseman&tbm=isch')
    browser.save_screenshot('spooky.png')
    return send_file('spooky.png')
