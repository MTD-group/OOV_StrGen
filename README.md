# OOV_StrGen
Script for generating various vacancy patterns in perovskite matrix. 

Unlike conventional structure-generation algorithms, this code start from close-packed planes in *AB*O<sub>3</sub> perovskite, which is (111) plane. Poeppelmeier et al. made an elegant observation of oxygen-deficient perovskites that each phase possess a specific layer vacancy pattern. By utilizing this finding, we generate *AB*O<sub>2.5</sub> with various oxygen vacancy arrangements.



### GUI
We additionally implemented GUI-version of this code in MATLAB.
You can run *StructureGenerator.m*, which will guide you to selections of layer vacancy patterns and compatible translation vectors.

### Structure data
Generated structures are collected in *Generated_structures* folder. The filename of structure is defined based on the *length of unit later*, *vacancy pattern*, *translation vector upon stacking*, and *the use of alternative stacking*.

For example *L2_vac1_t0.17_alt.vasp* is generated from vacancy pattern 1 of length2, and translation vector of 1/6. And the layer pattern is mirrored upon every stacking.

We note that the structures are defined by *A*<sub>2.5</sub> layer and stacking, which makes the outlook of structures parallelopied regardless of space group of each structure. For first-principles calculations, we recommend users to convert the generated structures to cif file and export to POSCAR format.

