from _segmentation import Wrapper

if __name__ == "__main__":
    mi_strings = [
        ("salmón", "bbb"),
        ("ccc", "ddd"),
        (b"b_aaa", b"b_bbb"),
        (b"b_ccc", b"b_ddd"),
    ]
    wrapper = Wrapper(mi_strings)
    print(wrapper.results())
