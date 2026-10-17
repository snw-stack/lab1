#!/bin/bash

echo "=== for 구구단 ==="

for ((dan=2; dan<=9; dan++)); do
    for ((n=1; n<=9; n++)); do
        echo "$dan x $n = $((dan * n))"
    done
    echo
done

echo "=== while 구구단 ==="

dan=2
while ((dan <= 9)); do
    n=1
    while ((n <= 9)); do
        echo "$dan x $n = $((dan * n))"
        ((n += 1))
    done
    echo
    ((dan += 1))
done

echo "=== until 구구단 ==="

dan=2
until ((dan > 9)); do
    n=1
    until ((n > 9)); do
        echo "$dan x $n = $((dan * n))"
        ((n += 1))
    done
    echo
    ((dan += 1))
done
