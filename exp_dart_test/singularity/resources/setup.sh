#!/bin/bash

./waf configure --exp example_dart_exp --dart /workspace --kdtree /workspace/include --robot_dart /workspace
./waf --exp example_dart_exp
