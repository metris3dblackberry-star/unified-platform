import os
from pathlib import Path

import requests
from flask import Flask, render_template, send_from_directory


def create_app() -> Flask:
    app = Flask(__name__)
    outputs_dir = Path(__file__).resolve().parent

    crm_public_url = os.environ.get(
        "CRM_PUBLIC_URL",
        "https://web-production-5755d.up.railway.app/",
    ).rstrip("/") + "/"
    erp_public_url = os.environ.get(
        "ERP_PUBLIC_URL",
        "https://planeta-erp-production.up.railway.app/",
    ).rstrip("/") + "/"
    shell_title = os.environ.get("SHELL_TITLE", "KNB CRM + PLANETA ERP")

    @app.get("/")
    def index():
        return render_template(
            "index.html",
            shell_title=shell_title,
            crm_url=crm_public_url,
            erp_url=erp_public_url,
            background_videos=[
                "/media/CRM.mp4",
                "/media/numbers.mp4",
                "/media/SAP.mp4",
            ],
        )

    @app.get("/media/<path:filename>")
    def media(filename: str):
        return send_from_directory(outputs_dir, filename)

    @app.get("/health")
    def health():
        return {
            "gateway": "ok",
            "shell_title": shell_title,
            "crm": {
                "url": crm_public_url,
                "status": _probe(crm_public_url),
            },
            "erp": {
                "url": erp_public_url,
                "status": _probe(erp_public_url),
            },
        }

    return app


def _probe(url: str) -> str:
    try:
        response = requests.get(url, timeout=10)
        return f"ok ({response.status_code})"
    except requests.RequestException as exc:
        return f"offline ({exc.__class__.__name__})"


if __name__ == "__main__":
    app = create_app()
    host = os.environ.get("HOST", "127.0.0.1")
    port = int(os.environ.get("PORT", "5100"))
    app.run(host=host, port=port, debug=False, threaded=True)
