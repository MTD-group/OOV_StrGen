# python version of structure generator
# Author: Yongjin Shin
# Advisor: James M. Rondinelli

import numpy as np
import copy
from StrGen_functions import Write_POSCAR


###################################
######### INPUT PARAMETERS ########
###################################

####### STRUCTURE FILE EXPORT #####

#file name: PatternLength_PatternNumber_TransVector.vasp
# pattern_length=1
# pattern_index=1
# pattern=pattern_list[pattern_index]
pattern='AO VO AO VO AO OO AO OO'  # Define one pattern from 'pattern_list' below
trans_vector=1/6       # Define one translation vector from 't_list' below
alternative_staking=True # Whether will apply opposite handedness upon stacking
a=4   # default pseudocubic lattice parameter
A = 'Sr' # A-cation element appearing in POSCAR
B = 'Fe' # B-cation element appearing in POSCAR



#########################################
######### Data for OOV structure ########
#########################################
t=trans_vector
# Layer vacancy pattern on AO3 layer, where 'V' denotes oxygen vacancy
# B-cation is omitted as they are positioned between AO3 layers
# Pristine layer is "AO OO AO OO' for L=1, and "AO OO AO OO AO OO AO OO" for L=2
pattern_list=['AV OO AO OO',					# pattern1 (L1_vac1)
			  'AO VO AO OO',					# pattern2 (L1_vac2) alt-possible
			  'AV VO AO OO AO OO AO OO',		# pattern3 (L2_vac1) alt-possible
			  'AV OO AV OO AO OO AO OO',		# pattern4 (L2_vac2) 
			  'AV OO AO VO AO OO AO OO',		# pattern5 (L2_vac3) alt-possible
			  'AO VV AO OO AO OO AO OO',		# pattern6 (L2_vac4) 
			  'AO VO AO VO AO OO AO OO',		# pattern7 (L2_vac5) alt-possible
			  'AO VO AO OV AO OO AO OO',		# pattern8 (L2_vac6) alt-possible
			  'AO VO AO OO AO OV AO OO']		# pattern9 (L2_vac7) 
# translational vectors along L direction.
# L=1 is compatible with t=1/6 and 2/3 only because of the shorter length

t_list=[1/6, 2/3, 7/6, 5/3]

#### A_array_default data
A_array_data=np.array([[0,0,0],[0.5,0.5,0]])    

#### Atomic position of oxygens in ABO3 chemistry. Vacancy sites will be removed from this full list
O_array_data=np.array([[0.5,0,0], [0.75,0.25,0], 
                  [0.25, 0.25, 0], [0, 0.5, 0],
                   [0.75, 0.75, 0], [0.25, 0.75, 0]])
# B-cation positions for each translation vector
B_t1=np.array([[0.75,0.25,0.5],[0.25,0.75,0.5]])
B_t2=np.array([[0,0,0.5],[0.5,0.5,0.5]])
B_t3=np.array([[0.25,0.125,0.5],[0.75,0.375,0.5],[0.25,0.625,0.5],[0.75,0.875,0.5]])
B_t4=np.array([[0.5,0,0.5],[0,0.25,0.5],[0.5,0.5,0.5],[0,0.75,0.5]])
B_sets=[B_t1,B_t2,B_t3,B_t4]

### Function
# Find a specific character in string
def find(s, ch):
    return [i for i, ltr in enumerate(s) if ltr == ch]

### File name
# Change file name based on whether alternative stacking is applied
# if flag_handed==0: # Structure generated without alternative stacking
pattern_length=int(len(find(pattern,'A'))/2)
L=pattern_length
# index starts from 1. restarts for different length
if pattern_length == 2:
    pattern_index=pattern_list.index(pattern)-1
else:
    pattern_index=pattern_list.index(pattern)+1
filename="L{0}_vac{1}_t{2:.2f}".format(pattern_length,
                                            pattern_index,
                                            trans_vector)


B_array_data=B_sets[t_list.index(t)]
# Modify atomic positions if L=2
if L ==2: 
    # A_array
    temp_Aarray1=copy.deepcopy(A_array_data)
    temp_Aarray2=copy.deepcopy(A_array_data)
    temp_Aarray1[:,1]=temp_Aarray1[:,1]/2
    temp_Aarray2[:,1]=temp_Aarray2[:,1]/2+0.5
    A_array=np.concatenate((temp_Aarray1,temp_Aarray2),axis=0)
    # B_array
    if len(B_array_data) == 2:
        temp_Barray1=copy.deepcopy(B_array_data)
        temp_Barray2=copy.deepcopy(B_array_data)
        temp_Barray1[:,1]=temp_Barray1[:,1]/2
        temp_Barray2[:,1]=temp_Barray2[:,1]/2+0.5
        B_array=np.concatenate((temp_Barray1,temp_Barray2),axis=0)
    # O_array
    temp_Oarray1=copy.deepcopy(O_array_data)
    temp_Oarray2=copy.deepcopy(O_array_data)
    temp_Oarray1[:,1]=temp_Oarray1[:,1]/2
    temp_Oarray2[:,1]=temp_Oarray2[:,1]/2+0.5
    O_array=np.concatenate((temp_Oarray1,temp_Oarray2),axis=0)
else:
    A_array=A_array_data
    B_array=B_array_data
    O_array=O_array_data        


### Remove Oxygen depending on the pattern
vacancy_indicies=find(pattern.replace(" ", ""),'V')
### Oxygen indicies in pattern
O_labels=[-1,0, 1,2, -1,3,4,5, -1,6,7,8, -1,9, 10, 11]
rows_to_delete=[O_labels[v] for v in vacancy_indicies]
O_array=np.delete(O_array,rows_to_delete,axis=0)

### Identify CN array
# coordination array: size is equal to the number of B-cations
coordination_list=[ 0 for i in range(2*pattern_length)]
t_index=t_list.index(t)
shift_array=np.array([1,2,3,4])
for v in vacancy_indicies:
    O_labels[v] = -1
O_indicies=np.array([int(x!=-1) for x in O_labels])
O_indicies=np.concatenate((O_indicies,O_indicies))
shift_value=shift_array[t_index]
# this array represent the next layer
shifted_O_indicies=np.roll(O_indicies,4*shift_value-2)
for i in range(len(coordination_list)):
    coordination_list[i] = \
        sum(O_indicies[4*i+2:4*i+6])+sum(shifted_O_indicies[4*i+2:4*i+6])
coordination_list.sort(reverse=True)
CN_str=" ".join('%i' % entry for entry in coordination_list)

# Alternative stacking
# If alternative stacking is possible, that case will be also covered
flag_handed=0
handed_list=[1,2,4,6,7]
if pattern_list.index(pattern) in handed_list:
    flag_handed=1
    ###### in case of alternative handedness is possible
    ###### A,B,O sites are modified accordingly
    ###### filename will be also modified
    A_array[:,2]=A_array[:,2]/2
    temp_A=copy.deepcopy(A_array)
    temp_A[:,2]=temp_A[:,2]+0.5
    A_array=np.concatenate((A_array,temp_A),axis=0)
    B_array[:,2]=B_array[:,2]/2
    temp_B=copy.deepcopy(B_array)
    temp_B[:,2]=temp_B[:,2]+0.5
    B_array=np.concatenate((B_array,temp_B),axis=0)
    temp_O=copy.deepcopy(O_array)
    temp_O[:,0]=1-temp_O[:,0]-np.floor((1-temp_O[:,0]))
    temp_O[:,2]=temp_O[:,2]+0.5
    filename+='_alt'



## Definition of lattice vectors
lattice = np.array([[a*np.sqrt(2), 0, 0],
                    [0, a*np.sqrt(6), 0],
                    [a*np.sqrt(2)*((t*3)%1),a*np.sqrt(6)*t,a/np.sqrt(3)]])
# c-vector should be doubled for alternative stacking            
lattice[2,:]=lattice[2,:]*(flag_handed+1)

## Write_POSCAR
Write_POSCAR(filename+'.vasp',CN_str,lattice,A_array,B_array,O_array, A='Sr', B='Fe')