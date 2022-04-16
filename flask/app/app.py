from flask import Flask
from flasgger import Swagger


def create_app() -> Flask:
    """Initialize of base app."""
    app = Flask(__name__)
    swagger = Swagger(app)

    @app.route("/status")
    def health():
        """
        Health check.
        ---
        tags:
            - Health check
        responses:
            200:
                description: Everything OK!
        """
        return "It's Okay!"

    return app
