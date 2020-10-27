import math
from functools import reduce


def getAvg(input_list: list) -> float:
    return reduce((lambda x, y: x + y), [float(x) for x in input_list]) / len(input_list)


def getSTD(input_list: list) -> float:
    av = getAvg(input_list)
    return math.sqrt(reduce((lambda x, y: x + y), [(float(x) - av) ** 2 for x in input_list]) / (len(input_list) - 1))
