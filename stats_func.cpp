#include <pybind11/pybind11.h>



float getAVG(float *data, int len){
	
	float sum = reduceAdd(data, len);
	float avg = sum/len;
	
	return avg;
	
}

float getSTD(float *data, int len){
	
	float avg = getAVG(data, len);
	float std = reduceSD(avg, data, len);
	
	return sqrt((std/len));
}

float reduceAdd(float *data, int len){
	
	float value = 0.0;
	
	for(int i = 0; i < len; i++){
		value += data[i];
	}	
	return value;	
}


float reduceSD(float avg, float *data, int len){
	
	float value = 0.0;
			
	for(int i = 0; i < len; i++){
		value += pow(data[i] - avg, 2);
	}

	return value;
}

namespace py = pybind11;

PYBIND11_PLUGIN(example) { 
	py::module m("example", "pybind11 example plugin");

	m.def("getSTD", &getSTD, "A function which gets the standard deviation");
	m.def("getAVG", &getAVG, "A function which gets the average");
	m.def("reduceADD", &reduceADD, "A function which gets the sum");
	m.def("reduceSD", &getAVG, "A function which gets sum of square differences");

	return m.ptr();
}
