import six
import cython
from cpython.bytes cimport PyBytes_AsString
from cpython.bytes cimport PyBytes_Size
from cpython.unicode cimport PyUnicode_AsEncodedString

cdef extern from "Python.h":
    const char* PyUnicode_AsUTF8AndSize(object o, Py_ssize_t *size)

ctypedef struct dd_object:
    const char* parameterKey
    const char* stringValue


cdef class Wrapper(object):
    cdef list strings_list
    cdef list bytes_list

    def __init__(self, list strings):
        cdef char * ptr
        cdef ssize_t length = 0
        self.strings_list = strings
        self.bytes_list = []

        results = []
        for tuple_elements in self.strings_list:
            print("element[0] %s" % tuple_elements[0])
            print("element[1] %s" % tuple_elements[1])
            self._string_to_bytes(tuple_elements[0], &ptr, &length)
            key = ptr
            self._string_to_bytes(tuple_elements[1], &ptr, &length)
            value = ptr
            self.bytes_list.append(self.build_result(&key, &value))


    cdef object _string_to_bytes(self, object string, const char ** ptr, ssize_t *length):
        # ptr[0] = NULL
        if isinstance(string, six.binary_type):
            ptr[0] = PyBytes_AsString(string)
            length[0] = PyBytes_Size(string)
        elif isinstance(string, six.text_type):
            if ptr[0] == NULL:
                string = PyUnicode_AsEncodedString(string, "utf-8", "surrogatepass")
                ptr[0] = PyBytes_AsString(string)
                length[0] = PyBytes_Size(string)
        return string

    cdef dd_object build_result(self, char ** key, char ** value):
        cdef dd_object result_object
        result_object.parameterKey = key[0]
        result_object.stringValue = value[0]
        return result_object

    def results(self):
        return self.bytes_list