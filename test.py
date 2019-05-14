import sys
import random

n = 0
for i in range(1000000):
    x = random.randint(0, 2 ** 32)
    y = random.randint(0, 2 ** 32)
    print(x, y)
    if x % y != 0 and y % x != 0:
        n = n + 1
print(n / 10000)
