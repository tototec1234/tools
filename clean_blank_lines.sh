#!/bin/bash

# 親ディレクトリから実行
# 1階層下のディレクトリのみ探索
find . -mindepth 2 -maxdepth 2 -type f \( -name "*.cpp" -o -name "*.hpp" \) | while read -r file; do
    # macOS（BSD版sed）の場合
    # sed -i '' -E 's/^[[:space:]]+$//' "$file"

    # Linuxの場合は以下の1行に置き換える：
    sed -i -E 's/^[[:space:]]+$//' "$file"
done
