# OOV_StrGen
Script for generating various vacancy patterns in perovskite matrix


This script is designed to generate *AB*O<sub>2.5</sub> with various oxygen vacancy arrangement.



We utilize the approach introduced in paper Poeppelmeier et al.

Unlike conventional structure-generation algorithms, this code start from 

### GUI
We additionally implemented GUI-version of this code in MATLAB.
You can run *StructureGenerator.m*, which will guide you to selections of layer vacancy patterns and compatible translation vectors.

### Structure data
Generated structures are collected in *Generated_structures* folder. We note that the structures are defined by *A*<sub>2.5</sub> layer and stacking, which makes the outlook of structures parallelopied regardless of space group of each structure. For first-principles calculations, we recommend users to convert the generated structures to cif file and export to POSCAR format.

