# OOV_StrGen
Script for generating various vacancy patterns in perovskite matrix. 

Unlike conventional structure-generation algorithms, this code starts from close-packed planes in *AB*O<sub>3</sub> perovskite, which is (111) plane. Poeppelmeier *et al.* made an elegant observation of oxygen-deficient perovskites that each phase possesses a specific layer vacancy pattern on *A*O<sub>3</sub> layers. By reversing this finding, we generate planer vacancy patterns and stack along [100] perovskite direction to construct 3-dimensional atomic structure. We adopt the sample stoichiometry of *AB*O<sub>2.5</sub>, and the 50 structures generated with this algorithm covers prototypical examples of oxygen-deficient perovskites with ordered vacancies.

### GUI
We additionally developed GUI-version of this code on MATLAB environment.
You can run *StructureGenerator.m*, which will generate a POSCAR file (structure file for VASP) of oxygen-deficient *AB*O<sub>2.5</sub> structure with input parameters of your choice. Among parameters shown in the figure below, the pattern length, pattern, and translational vector are key parameters determining vacancy pattern.</br>
![alt text](https://github.com/MTD-group/OOV_StrGen/blob/main/GUI_Matlab/GUI_outlook.png?raw=true)


### Structure data
The parameters covered by this code can generate 50 structures of oxygen-deficient perovskites, which are collected in *Generated_structures* folder. The filename of structure is defined based on the *length of unit later*, *vacancy pattern*, *translation vector upon stacking*, and *the use of alternative stacking*.

For example *L2_vac1_t0.17_alt.vasp* is generated from vacancy pattern 1 with length of L=2 (double vertical length of atomic plane shown in GUI), and translation vector of L\*1/6 (=0.17L). And the 'alt' in the filename implies that layer pattern is mirrored upon every stacking layer.

We note that the structures are defined by *A*O<sub>2.5</sub> layer and stacking, which makes the outlook of structures parallelopied regardless of space group of each structure. To use them for first-principles calculations, we recommend users to convert the generated structures to cif file and export to POSCAR format so that structures to have conventional unit cell shape with corresponding symmetry.

