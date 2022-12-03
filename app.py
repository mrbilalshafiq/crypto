from flask import Flask, render_template
import requests

app = Flask(__name__)

@app.route("/")
def home():
    url = "https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,XRP,BCH,EOS&tsyms=GBP"
    response = requests.get(url)
    data = response.json()

    prices = {}
    for key, value in data.items():
        prices[key] = value["GBP"]

    return render_template("home.html", prices=prices)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)


