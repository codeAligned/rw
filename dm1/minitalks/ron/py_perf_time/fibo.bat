REM timeit can be used from the Windows command line too
REM copy the next to lines into a .sh script to run them on Mac or Linux
python -m timeit -s "from fibo_rn import fibo_loop as f" "for x in range(15): f(x)"
python -m timeit -s "from fibo_rn import fibo_recursive as f" "for x in range(15): f(x)"
