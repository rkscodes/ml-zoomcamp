# create a web service with flask
from flask import Flask

app = Flask('ping')

@app.route('/ping', methods=['GET'])
def ping():
    return "pong";

if __name__ == "__main__":
    app.run(debug=True)