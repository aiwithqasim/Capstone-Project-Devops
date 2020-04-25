"""pytest tests for library"""

import base64
import json
import pytest
import sys

sys.path.append("../app")

from web import app


@pytest.fixture
def client():
    """Generic Flask application fixture"""

    app.testing = True
    return app.test_client()


def test_root(client):
    """Tests that a redirect is in place for root"""

    # A GET request should return a 200
    res_get = client.get("/")
    assert res_get.status_code == 200


def test_health(client):
    """Tests that the health endpoint is working"""

    # A GET request should return a 200
    res_get = client.get("/health")
    assert res_get.status_code == 200
    assert res_get.json == {"isRunning": True}
