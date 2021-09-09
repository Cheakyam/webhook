
from flask import Flask
from flask import request
from flask import jsonify

import fileFactory
import sys



app = Flask(__name__)

@app.route("/")
def hello() :
    return "Hello"


@app.route("/webhook/<id>")
def webhook(id) :
    hookPath = "./hook.json"
    configs = fileFactory.load(hookPath)
    for config in configs:
        if config['id'] == id :
            sys.execute(config['command-working-directory'], config['execute-command'])
            break;     
    return jsonify( {
        'code' : 0,
        'msg' : id,
        'info' : []
    } )

if __name__ == "__main__":
    app.run(debug = True, host = '0.0.0.0')