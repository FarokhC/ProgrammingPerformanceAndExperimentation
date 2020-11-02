# import stats_func
import time
import generate_numbers
import math
from functools import reduce

cpdef cythonBinarySearch(listValues,left,right, value):
    cdef int middle
    listValues = cythonSort(listValues)
    if right >= left:
         
        middle = (left + right) // 2
        if listValues[middle] == value: 
            return middle 
        elif listValues[middle] > value: 
            return cythonBinarySearch(listValues, left, middle-1, value) 
        elif listValues[middle] < value:  
            return cythonBinarySearch(listValues, middle + 1, right, value) 
    else:
        return -1

def pythonBinarySearch(listValues,left,right, value):
    listValues = cythonSort(listValues)
    if right >= left:
        middle = (left + right) // 2
        if listValues[middle] == value: 
            return middle 
        elif listValues[middle] > value: 
            return pythonBinarySearch(listValues, left, middle-1, value) 
        elif listValues[middle] < value:  
            return pythonBinarySearch(listValues, middle + 1, right, value) 
    else:
        return -1

cpdef cythonLinearSearch(listValues,value):
    cdef int i
    for i in range(len(listValues)-1):
        if listValues[i]==value:
            return i

def pythonLinearSearch(listValues,value):
    for i in range(len(listValues)-1):
        if listValues[i] == value:
            return i

def pythonSelectionSort(listValues):
    for i in range(len(listValues)):
        minIdx = i
        for j in range(i+1, len(listValues)):
            if listValues[minIdx] > listValues[j]:
                minIdx = j
        
        listValues[i], listValues[minIdx] = listValues[minIdx], listValues[i]
    return listValues

cpdef cythonSelectionSort(listValues):
    cdef int i
    cdef int j
    cdef int length
    
    length = len(listValues)

    for i in range(len(listValues)):
        minIdx = i
        for j in range(i+1, len(listValues)):
            if listValues[minIdx] > listValues[j]:
                minIdx = j
        
        listValues[i], listValues[minIdx] = listValues[minIdx], listValues[i]
    return listValues


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

#generate_numbers.generateRandomNumbers()

#Read lines and get time
read_lines_start_time = time.time()
with open("numbers.txt", 'r') as file:
    lines = file.readlines()
python_numbers = [int(line) for line in lines]
cython_numbers = [int(line) for line in lines]
read_lines_end_time = time.time()
read_lines_time = read_lines_end_time - read_lines_start_time

print("Python time to read file: " + str(read_lines_time))

#Binary Search
val = int(input("Enter the number you want to find(binary search in python):"))
python_binary_search_start_time = time.time()
python_binary = pythonBinarySearch(python_numbers,0,len(python_numbers)-1,val)
python_binary_search_end_time = time.time()
python_binary_search_time = python_binary_search_end_time - python_binary_search_start_time
print("Python binary search time: " + str(python_binary_search_time))
print("The value is at position "+ str(python_binary))


val = int(input("Enter the number you want to find(binary search in cython):"))
cython_binary_search_start_time = time.time()
cython_binary = cythonBinarySearch(cython_numbers,0,len(cython_numbers)-1,val)
cython_binary_search_end_time = time.time()
cython_binary_search_time = cython_binary_search_end_time - cython_binary_search_start_time
print("Cython binary search time: " + str(cython_binary_search_time))
print("The value is at position "+ str(cython_binary))

#Linear Search
val = int(input("Enter the number you want to find(linear search in python):"))
python_linear_search_start_time = time.time()
python_linear = pythonLinearSearch(python_numbers,val)
python_linear_search_end_time = time.time()
python_linear_search_time = python_linear_search_end_time - python_linear_search_start_time
print("Python linear search time: " + str(python_linear_search_time))
print("The value is at position "+ str(python_linear))


val = int(input("Enter the number you want to find(linear search in cython):"))
cython_linear_search_start_time = time.time()
cython_linear = cythonLinearSearch(cython_numbers,val)
cython_linear_search_end_time = time.time()
cython_linear_search_time = cython_linear_search_end_time - cython_linear_search_start_time
print("Cython linear search time: " + str(cython_linear_search_time))
print("The value is at position "+ str(cython_linear))

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


#Cython SelectionSort values
cython_sorted_start_time = time.time()
cython_sortedNumbers = cythonSelectionSort(cython_numbers)
cython_sorted_end_time = time.time()
cython_sorted_time = cython_sorted_end_time - cython_sorted_start_time
print("Cython Selection sort run time: " + str(cython_sorted_time))

python_sorted_start_time = time.time()
python_sortedNumbers = pythonSelectionSort(python_numbers)
python_sorted_end_time = time.time()
python_sorted_time = python_sorted_end_time - python_sorted_start_time

print("Python Selection sort run time: " + str(python_sorted_time))
#Print results
# print("Python computational average: " + str(python_avg))
# print("Python computaitonal standard deviation: " + str(python_std))

# print("Python computaitonal standard deviation time: " + str(python_std_time))
# print("Cython computaitonal standard deviation time: " + str(cython_std_time))