# ProgrammingPerformanceAndExperimentation

## Preqrequisites
* Install cython using **pip install cython**

## Running the Python and Cython (C compiled Python code) Code
* cd ProgrammingPerformanceAndExperimentation/cython
* Run the command, **python cython_setup.py build_ext --inplace** to compile the cython code in **cython_test.py**. Compiled C code should be generated and outputted in the same directory.
* To run the C compiled Python code, start the python interperter using the command, **python**
* Within the python interpreter, type **import cython_test**. The results will be printed.
* To exit the python interpreter, type **exit()**
