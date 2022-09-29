import sys

import pyperf

from _binarysearch import benchmark_native_binary_search, benchmark_cython_binary_search
from binarysearch import benchmark_binary_search


function_name = ""
inner_loops = 10

def add_cmdline_args(cmd, args):
    cmd.extend(("-f", function_name))
    cmd.extend(("-i", str(inner_loops)))


if __name__ == "__main__":
    runner = pyperf.Runner(add_cmdline_args=add_cmdline_args)
    cmd = runner.argparser
    cmd.add_argument("-f", "--function_name", default="", type=str)
    cmd.add_argument("-i", "--inner_loops", default=10, type=int)
    parsed_args = runner.parse_args()
    function_name = parsed_args.function_name
    inner_loops = int(parsed_args.inner_loops)
    if function_name == "binary_search":
        runner.bench_func("happy_path_{}".format(inner_loops), benchmark_binary_search, inner_loops)
    elif function_name == "cython_binary_search":
        runner.bench_func("happy_path_{}".format(inner_loops), benchmark_cython_binary_search, inner_loops)
    elif function_name == "native_binary_search":
        runner.bench_func("happy_path_{}".format(inner_loops), benchmark_native_binary_search, inner_loops)
