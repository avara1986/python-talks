import sys

import pyperf

from _binarysearch import cython_binary_search, native_binary_search
from binarysearch import binary_search

search_list = [i for i in range(1000000)]

function_name = ""

def add_cmdline_args(cmd, args):
    cmd.extend(("-f", function_name))


if __name__ == "__main__":
    runner = pyperf.Runner(add_cmdline_args=add_cmdline_args)
    cmd = runner.argparser
    cmd.add_argument("-f", "--function_name", default="", type=str)
    parsed_args = runner.parse_args()
    function_name = parsed_args.function_name
    if function_name == "binary_search":
        f = binary_search
    elif function_name == "cython_binary_search":
        f = cython_binary_search
    elif function_name == "native_binary_search":
        f = native_binary_search
    else:
        print(sys.argv)
        raise Exception("ERROR")
    runner.bench_func("happy_path", f, search_list, 66666, 0, len(search_list))