from flask import Flask, escape, request
from flasgger import Swagger
from sensible.loginit import logger

log = logger(__name__)
app = Flask(__name__)
Swagger(app)


@app.route("/")
def hello():
    name = request.args.get("name", "World")
    return "Hello, " + escape(name) + "!"


@app.route("/health")
def health():
    return {"isRunning": True}


if __name__ == "__main__":  # pragma: no cover
    log.info("START Flask")
    app.debug = True
    app.run(host="0.0.0.0", port=80)
    log.info("SHUTDOWN Flask")
