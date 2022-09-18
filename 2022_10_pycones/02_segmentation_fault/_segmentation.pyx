import six

from cpython.bytes cimport PyBytes_AsString
from cpython.unicode cimport PyUnicode_AsEncodedString


cdef extern from "Python.h":
    const char * PyUnicode_AsUTF8AndSize(object o, Py_ssize_t *size)


cdef class BytesDict(object):
    cdef dict bytes_dict

    def __init__(self, dict strings_dict):
        self.bytes_dict = {}
        cdef char * ptr
        cdef char * bytes_key = NULL
        cdef char * bytes_value = NULL
        print("ptr")
        print(ptr)
        for k, v in strings_dict.items():
            k = self._string_to_bytes(k, &ptr)
            bytes_key = ptr
            v = self._string_to_bytes(v, &ptr)
            bytes_value = ptr
            self._update_dict(bytes_key, bytes_value)

    cdef _update_dict(self, char * bytes_key, char * bytes_value):
        self.bytes_dict.update({bytes_key: bytes_value})

    def __repr__(self):
        return str(self.bytes_dict)

    cdef object _string_to_bytes(self, object string, char ** ptr):
        ptr[0] = NULL
        if isinstance(string, six.binary_type):
            ptr[0] = PyBytes_AsString(string)
        elif isinstance(string, six.text_type):
            if ptr[0] == NULL:
                string = PyUnicode_AsEncodedString(string, "utf-8", "surrogatepass")
                ptr[0] = PyBytes_AsString(string)
        return string

    cpdef long create_list(self):
        cdef long array[5]
        for i in range(0, 5):
            array[i] = -1
        return 0
