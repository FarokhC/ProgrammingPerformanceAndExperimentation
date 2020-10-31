# import stats_func
import time
import generate_numbers
import math
from functools import reduce

cpdef cythonSort(listValues):
    cdef int i
    cdef int j
    cdef int length
    length = len(listValues)
    for i in range(length-1):
        didSwap = False
        for j in range(length-1-i):
            if listValues[j] > listValues[j+1]:
                listValues[j], listValues[j+1] = listValues[j+1], listValues[j]
                didSwap = True
        if not didSwap:
            break
    return listValues

numbers = []
lines = None

def pythonSort(listValues):
    length = len(listValues)
    for i in range(length-1):
        didSwap = False
        for j in range(length-1-i):
            if listValues[j] > listValues[j+1]:
                listValues[j], listValues[j+1] = listValues[j+1], listValues[j]
                didSwap = True
        if not didSwap:
            break
    return listValues

def pythonGetMax(listValues):
    currentMax = listValues[0]
    length = len(listValues)

    for i in range(length-1):
        if(listValues[i] > currentMax):
            currentMax = listValues[i]
    return currentMax

cpdef cythonGetMax(listValues):
    cdef int currentMax = listValues[0]
    cdef int i = 0
    length = len(listValues)

    for i in range(length-1):
        if(listValues[i] > currentMax):
            currentMax = listValues[i]
    return currentMax

def pythonGetAvg(listValues):
    sum = 0
    list_length = len(listValues)
    for i in range(len(listValues)):
        newSum = sum + listValues[i]
        sum = newSum
    return sum / list_length

cpdef cythonGetAvg(listValues):
    cdef int sum = 0
    cdef int list_length = len(listValues)
    cdef int i = 0
    cdef newSum = 0
    for i in range(len(listValues)):
        newSum = sum + listValues[i]
        sum = newSum
    return sum / list_length

def pythonGetSTD(listValues):
    av = pythonGetAvg(listValues)
    return math.sqrt(reduce((lambda x, y: x + y), [(float(x) - av) ** 2 for x in listValues]) / (len(listValues) - 1))


# cpdef cythonGetSTD(list):
#     av = cythonGetAvg(listValues)
#     return math.sqrt(reduce((lambda x, y: x + y), [(float(x) - av) ** 2 for x in listValues]) / (len(listValues) - 1))

generate_numbers.generateRandomNumbers()

#Read lines and get time
read_lines_start_time = time.time()
with open("numbers.txt", 'r') as file:
    lines = file.readlines()
python_numbers = [int(line) for line in lines]
cython_numbers = [int(line) for line in lines]
read_lines_end_time = time.time()
read_lines_time = read_lines_end_time - read_lines_start_time

print("Python time to read file: " + str(read_lines_time))

#Compute time to get average
python_avg_start_time = time.time()
python_avg = pythonGetAvg(python_numbers)
python_avg_end_time = time.time()
python_avg_time = python_avg_end_time - python_avg_start_time
print("Python computational average time: " + str(python_avg_time))

cython_avg_start_time = time.time()
cython_avg = cythonGetAvg(python_numbers)
cython_avg_end_time = time.time()
cython_avg_time = cython_avg_end_time - cython_avg_start_time

print("Cython computational average time: " + str(cython_avg_time))

#Compute time to get std
python_std_start_time = time.time()
python_std = pythonGetSTD(python_numbers)
python_std_end_time = time.time()
python_std_time = python_std_end_time - python_std_start_time

# cython_std_start_time = time.time()
# cython_std = cythonGetSTD(python_numbers)
# cython_std_end_time = time.time()
# cython_std_time = cython_std_end_time - cython_std_start_time

#Get Max
cython_max_start_time = time.time()
cython_max = cythonGetMax(cython_numbers)
cython_max_end_time = time.time()
cython_max_time = cython_max_end_time - cython_max_start_time
print("Cython max run time: " + str(cython_max_time))

python_max_start_time = time.time()
python_max = pythonGetMax(cython_numbers)
python_max_end_time = time.time()
python_max_time = python_max_end_time - python_max_start_time

print("Python max run time: " + str(python_max_time))

#Sort values
cython_sorted_start_time = time.time()
cython_sortedNumbers = cythonSort(cython_numbers)
cython_sorted_end_time = time.time()
cython_sorted_time = cython_sorted_end_time - cython_sorted_start_time
print("Cython sort run time: " + str(cython_sorted_time))

python_sorted_start_time = time.time()
python_sortedNumbers = pythonSort(python_numbers)
python_sorted_end_time = time.time()
python_sorted_time = python_sorted_end_time - python_sorted_start_time

print("Python sort run time: " + str(python_sorted_time))

#Print results
# print("Python computational average: " + str(python_avg))
# print("Python computaitonal standard deviation: " + str(python_std))

# print("Python computaitonal standard deviation time: " + str(python_std_time))
# print("Cython computaitonal standard deviation time: " + str(cython_std_time))
