from _segmentation import BytesDict

if __name__ == "__main__":
    strings_and_bytes_dict = {
        "barba": "coa",
        "aaa": b"value_aaa",
        "bbb": b"value_bbb",
        "ccc": "value_ccc",
    }
    bytes_dict = BytesDict(strings_and_bytes_dict)
    print(bytes_dict)
    # print(bytes_dict.create_list())
