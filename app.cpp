#include <iostream>
#include <fstream>
#include <string>
#include <cmath>
#include <time.h>
#include <pybind11/pybind11.h>
#include <chrono>
#include <stdio.h>
#include<stdlib.h>
#include <pybind11/embed.h>
using namespace std;


struct doIt {
	doIt() {}
	float calcStdDev(float data[]) {
		float sum = 0.0, mean, standardDeviation = 0.0;
		int i;
		for (i = 0; i < 10; ++i)
		{
			sum += data[i];
		}
		mean = sum / 10;
		for (i = 0; i < 10; ++i)
			standardDeviation += pow(data[i] - mean, 2);
		return sqrt(standardDeviation / 10);
	}

	float calcAverage(float data[]) {
		float sum = 0.0, mean, standardDeviation = 0.0;
		int i;
		for (i = 0; i < 10; ++i)
		{
			sum += data[i];
		}
		mean = sum / 10;
		return mean;
	}
	void read_from_file() {
		ifstream file("C:\\Users\\rya_c\\Desktop\\RL2 CMPE 275\\vsstudio\\numbers.txt");
		int i = 0;
		float *arr = (float*)malloc(1000000 * sizeof(float));
		while (file >> arr[i])
		{
			i++;
		}
		float sd = calcStdDev(arr);
		float avg = calcAverage(arr);
		auto start_sd = std::chrono::high_resolution_clock::now();
		cout << "The standard deviation is " << sd << endl;
		auto stop_sd = std::chrono::high_resolution_clock::now();
		auto sd_time = std::chrono::duration_cast<std::chrono::nanoseconds>(stop_sd - start_sd);
		auto start_avg = std::chrono::high_resolution_clock::now();
		cout << "The average is " << avg << endl;
		auto stop_avg = std::chrono::high_resolution_clock::now();
		auto avg_time = std::chrono::duration_cast<std::chrono::nanoseconds>(stop_avg - start_avg);
		printf("Time to calculate average: %.7f seconds.\n", avg_time.count() * 1e-9);
		printf("Time to calculate standard deviation: %.7f seconds.\n", sd_time.count() * 1e-9);
		free(arr);
	}
};
PYBIND11_EMBEDDED_MODULE(pybind11module, module)
{
	module.doc() = "Pybind11Module";
	pybind11::class_<doIt>(module, "doIt")
		.def(pybind11::init<>())
		.def("calcStdDev", &doIt::calcStdDev)
		.def("calcAverage", &doIt::calcAverage)
		.def("read_from_file", &doIt::read_from_file)
		;
}

void main() {
	pybind11::scoped_interpreter guard{};

	{
		auto read_module = pybind11::module::import("script");
	}
	printf("end\n");
}