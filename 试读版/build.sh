#!/bin/bash
# 数字经济一本通关 试读版编译脚本：xelatex 双遍
cd "$(dirname "$0")"
xelatex -interaction=nonstopmode 试读版.tex > /tmp/de_trial1.log 2>&1
xelatex -interaction=nonstopmode 试读版.tex > /tmp/de_trial2.log 2>&1
echo "== 错误 =="
grep -E "^!" /tmp/de_trial2.log | head -10 || true
echo "== Overfull 数量 =="
grep -c "Overfull" /tmp/de_trial2.log || true
echo "== 完成: $(ls -la 试读版.pdf | awk '{print $5}') bytes =="
