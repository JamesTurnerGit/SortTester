# Sort Benchmarker
Making a sorter to both understand implementations of sorts and also benchmark them in various situations.

two metrics will be used: overall time, and array accesses

## Class archtypes

### Benchmark
Main entry point of program, passes results from array_creator into sorters and times them

### Sorters
a subset of classes to implement various types of sorting algorithm

## Array_creator
generates a number of ordered arrays and then shuffles them, provides both to check the resorted version against

## Array
appended method to count accesses of array_creator
