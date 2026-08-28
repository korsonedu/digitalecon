#!/bin/bash
# 数字经济一本通关 编译脚本：xelatex 双遍生成目录
cd "$(dirname "$0")"
xelatex -interaction=nonstopmode main.tex > /tmp/de_build1.log 2>&1
xelatex -interaction=nonstopmode main.tex > /tmp/de_build2.log 2>&1
echo "== 错误 =="
grep -E "^!" /tmp/de_build2.log | head -10 || true
echo "== Overfull 数量 =="
grep -c "Overfull" /tmp/de_build2.log || true
echo "== 完成: $(ls -la main.pdf | awk '{print $5}') bytes =="
