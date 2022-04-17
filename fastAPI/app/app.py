"""App module."""
from fastapi import FastAPI


def create_app():
    """Initialize of base app."""
    app = FastAPI(title="api-practice-fastapi")

    @app.get("/status")
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
