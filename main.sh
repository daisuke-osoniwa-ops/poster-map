#!/usr/bin/env bash
set -euo pipefail

# 1. 準備（必要なソフトを入れる）
pip install -r python-requirements.txt

# 2. データのダウンロード（あなたのスプレッドシートURL）
curl -sL "https://docs.google.com/spreadsheets/d/e/2PACX-1vS1W4aMccgKRWVHDyqtaSIC8duUonV99Yfa2_sDc9nEehWwc6Mvdm-B6UxOi3F0s9mi3bx9sQinSaq_/pub?gid=474539051&single=true&output=csv" > public/data/all.csv

# 3. データを地図用に変換する
python3 csv2json_small.py public/data/all.csv public/data/

# 4. 集計処理（念のため実行）
python3 summarize_progress.py ./public/data/summary.json
python3 summarize_progress_absolute.py ./public/data/summary_absolute.json
