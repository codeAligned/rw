#!/usr/bin/env python
'''
fibo_rn.py - Two different functions to compute fibonacci sequence
where each number in the sequence is the sum of the previous two.
'''

# calculate next digit in the fibonacci sequence using a loop
def fibo_loop(n):
    a = 0
    b = 1
    for _ in range(n):
        temp = a
        a = b
        b = temp + a
    return a

# calculate next digit in the fibonacci sequence using recursion
def fibo_recursive(n):
    if n > 1:
        return fibo_recursive(n-1) + fibo_recursive(n-2)
    else:
        return n

# use the methods in a loop
def print_loop(n, f):
    for i in range(n):
        print(f(i), end=', ')

if __name__ == '__main__':
    # Test timings
    import time

    # use a timer to time
    t1 = time.time()
    print_loop(15, fibo_loop)
    t2 = time.time()
    d = t2 - t1
    print('fibo_loop', d, t2, t1)

    # use a timer to time in less lines
    t1 = time.time()
    print_loop(15, fibo_recursive)
    print('fibo_recursive', time.time()-t1)

    # use python's timeit from within python
    import timeit
    best3 = timeit.repeat(stmt='for x in range(15): f(x)', 
        setup='from __main__ import fibo_loop as f', number=300)
    print('timeit fibo_loop', best3)
    print('min = ', min(best3))

    import timeit
    best3 = timeit.repeat(stmt='for x in range(15): f(x)', 
         setup='from __main__ import fibo_recursive as f', number=300)
    print('timeit fibo_recursive', best3)
    print('min = ', min(best3))
