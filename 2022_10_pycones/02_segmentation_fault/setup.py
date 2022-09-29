from setuptools import setup
# Import this after setuptools or it will fail
import Cython.Distutils
from Cython.Build import cythonize  # noqa: I100
extra_compile_args = [
    "-g",
    "-O0",
    "-Wall",
    "-Wpedantic",
]

if __name__ == "__main__":
    setup(
        ext_modules=cythonize(
            [
                Cython.Distutils.Extension(
                    "_segmentation",
                    sources=["_segmentation.pyx"],
                    language="c++",
                    extra_compile_args=extra_compile_args,
                ),
            ],
            gdb_debug=True,
        )
    )
