#!/bin/sh
set -eu

python - <<'PY'
import json, os

path = "/freqtrade/user_data/config.json"
with open(path, "r", encoding="utf-8") as f:
    cfg = json.load(f)

tg = cfg.setdefault("telegram", {})
tg["enabled"] = os.getenv("FREQTRADE__TELEGRAM__ENABLED", "true").lower() == "true"
tg["token"] = os.getenv("FREQTRADE__TELEGRAM__TOKEN", "")
tg["chat_id"] = os.getenv("FREQTRADE__TELEGRAM__CHAT_ID", "")

with open(path, "w", encoding="utf-8") as f:
    json.dump(cfg, f, indent=2)
PY

exec freqtrade trade --config /freqtrade/user_data/config.json
