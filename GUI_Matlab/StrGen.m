function filename=StrGen(l_num,s,vac_num,t,a,A,B,flag_hand)
%% Input
%flag_hand=1; %0:No, 1:Yes (Alternative stacking)
pattern_reduced=sscanf(s,'%s');
v_index=pattern_reduced=='V';
L=size(pattern_reduced,2)/8;
t_array=[1/6 2/3 7/6 5/3];
t_index=t_array==eval(t);
oxy_number=[0 1 2 3 4 4 5 6 0 7 8 9 10 10 11 12]; %This covers until L=3
vac_index=oxy_number(v_index);
%% Coordination number
o_index=pattern_reduced=='O';
o_index=[o_index o_index]; %Repeat array for easy calculation
coordination_array=zeros(1,2*L); %Size corresponds to #B atoms
% CN includes oxygen atoms two planes, so requires inclusion of t vector
shift_array=[1 2 3 4];
shift_value=shift_array(t_index);
shifted_o_index=circshift(o_index,[0,(4*shift_value-2)]);
for i=1:2*L
    coordination_array(i)=sum(o_index(4*i-1:4*i+2))+sum(shifted_o_index(4*i-1:4*i+2));
end
%% standard sites
%A site positions with L=1; standard
A_standard=[0 0 0; 0.5 0.5 0];
%B site positions
%This should be updated when include L=3 case
B_t1=[0.75 0.25 0.5; 0.25 0.75 0.5];
B_t2=[0 0 0.5; 0.5 0.5 0.5];
B_t3=[0.25 0.125 0.5; 0.75 0.375 0.5; 0.25 0.625 0.5; 0.75 0.875 0.5];
B_t4=[0.5 0 0.5; 0 0.25 0.5; 0.5 0.5 0.5; 0 0.75 0.5];
%O site positions with L=1; standard
O_standard=[0.5 0 0; 0.75 0.25 0; 0.25 0.25 0; 0 0.5 0; 0.75 0.75 0; 0.25 0.75 0];

%% Making layer1 without vacancies
switch t  %Choosing B position based on the translation vector
    case '1/6'
        B_standard=B_t1;
    case '2/3'
        B_standard=B_t2;
    case '7/6'
        B_standard=B_t3;
    case '5/3'
        B_standard=B_t4;
end
%% Making layer1 with different L value
pos_A=A_standard;
pos_B=B_standard;
pos_O=O_standard;
for i=1:L-1
    temp=A_standard;
    temp(:,2)=A_standard(:,2)+i;
    pos_A=[pos_A; temp;];
    temp=O_standard;
    temp(:,2)=O_standard(:,2)+i;
    pos_O=[pos_O; temp;];
    if size(B_standard,1)<=2
        temp=B_standard;
        temp(:,2)=B_standard(:,2)+i;
        pos_B=[pos_B; temp;];
    else
        pos_B(:,2)=pos_B(:,2)*L;
    end
    clear temp
end
pos_A(:,2)=pos_A(:,2)/L;
pos_B(:,2)=pos_B(:,2)/L;
pos_O(:,2)=pos_O(:,2)/L;
%% Applying vacancies; Delete rows
pos_O(vac_index,:)=[];

%% Alternative handness
if flag_hand
    pos_A(:,3)=pos_A(:,3)/2; temp=pos_A; temp(:,3)=temp(:,3)+0.5;
    pos_A=[pos_A;temp];
    pos_B(:,3)=pos_B(:,3)/2; temp=pos_B; temp(:,3)=temp(:,3)+0.5;
    pos_B=[pos_B;temp];
    pos_O(:,3)=pos_O(:,3)/2; 
    temp=pos_O; temp(:,3)=temp(:,3)+0.5; temp(:,1)=1-temp(:,1);
    pos_O=[pos_O;temp];
end
%% Lattice vectors
lattice=[ a*sqrt(2) 0 0;
    0 a*sqrt(6)*L 0;
    a*sqrt(2)*rem(eval(t)*3,1) a*sqrt(6)*eval(t) a/sqrt(3)];
lattice(3,:)=lattice(3,:)*(flag_hand+1);

%% Writing POSCAR
if flag_hand
    filename=sprintf('L%d_vac%d_t%.2f_alt.vasp',l_num,vac_num,sum(t_array(t_index)));
else
    filename=sprintf('L%d_vac%d_t%.2f.vasp',l_num,vac_num,sum(t_array(t_index)));
end
%path=sprintf('C:\Users\Yongjin\Documents\MATLAB');
%fullname=fullfile(path,filename);
fid_w=fopen(filename,'w');
fprintf(fid_w,'%s, CN=',filename);
fprintf(fid_w, '%d ', coordination_array);
fprintf(fid_w, '\n1.0\n');
fprintf(fid_w,'%20.10f %20.10f %20.10f\n', lattice');
fprintf(fid_w,'%5s %5s %5s\n', A, B, 'O');
fprintf(fid_w,'%5d %5d %5d\n', size(pos_A,1), size(pos_B,1), size(pos_O,1)); 
fprintf(fid_w,'Direct\n');
fprintf(fid_w,'%16.10f %19.10f %19.10f\n', pos_A', pos_B', pos_O');
fclose(fid_w);