function varargout = StructureGenerator(varargin)
% STRUCTUREGENERATOR MATLAB code for StructureGenerator.fig
%      STRUCTUREGENERATOR, by itself, creates a new STRUCTUREGENERATOR or raises the existing
%      singleton*.
%
%      H = STRUCTUREGENERATOR returns the handle to a new STRUCTUREGENERATOR or the handle to
%      the existing singleton*.
%
%      STRUCTUREGENERATOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STRUCTUREGENERATOR.M with the given input arguments.
%
%      STRUCTUREGENERATOR('Property','Value',...) creates a new STRUCTUREGENERATOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before StructureGenerator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to StructureGenerator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help StructureGenerator

% Last Modified by GUIDE v2.5 28-Mar-2016 21:18:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @StructureGenerator_OpeningFcn, ...
                   'gui_OutputFcn',  @StructureGenerator_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before StructureGenerator is made visible.
function StructureGenerator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to StructureGenerator (see VARARGIN)

% Choose default command line output for StructureGenerator
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes StructureGenerator wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.popup_pattern,'string',['1. AV OO AO OO'; '2. AO VO AO OO']);
set(handles.popup_t,'string',['1. 1/6'; '2. 2/3']);

% --- Outputs from this function are returned to the command line.
function varargout = StructureGenerator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_A_Callback(hObject, eventdata, handles)
% hObject    handle to edit_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_A as text
%        str2double(get(hObject,'String')) returns contents of edit_A as a double


% --- Executes during object creation, after setting all properties.
function edit_A_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_A (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_B_Callback(hObject, eventdata, handles)
% hObject    handle to edit_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_B as text
%        str2double(get(hObject,'String')) returns contents of edit_B as a double


% --- Executes during object creation, after setting all properties.
function edit_B_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_B (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_lattice_Callback(hObject, eventdata, handles)
% hObject    handle to edit_lattice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_lattice as text
%        str2double(get(hObject,'String')) returns contents of edit_lattice as a double


% --- Executes during object creation, after setting all properties.
function edit_lattice_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_lattice (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_error_Callback(hObject, eventdata, handles)
% hObject    handle to edit_error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_error as text
%        str2double(get(hObject,'String')) returns contents of edit_error as a double


% --- Executes during object creation, after setting all properties.
function edit_error_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_error (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on selection change in popup_pattern.
function popup_pattern_Callback(hObject, eventdata, handles)
% hObject    handle to popup_pattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_pattern contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_pattern
L_length=get(handles.popup_length,{'string','value'});
L_pattern=get(handles.popup_pattern,{'string','value'});
if L_length{2}==1
    if L_pattern{2}==2
        set(handles.checkbox1,'Visible','On');
    else
        set(handles.checkbox1,{'Visible','Value'},{'Off',0});
    end
else
    if L_pattern{2}==2 || L_pattern{2}==4 || L_pattern{2}==7
        set(handles.checkbox1,{'Visible','Value'},{'Off',0});
    else
        set(handles.checkbox1,'Visible','On');
    end
end

% --- Executes during object creation, after setting all properties.
function popup_pattern_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_pattern (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popup_t.
function popup_t_Callback(hObject, eventdata, handles)
% hObject    handle to popup_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_t contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_t


% --- Executes during object creation, after setting all properties.
function popup_t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton.
function pushbutton_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
l_num=get(handles.popup_length,'Value');
L_pattern=get(handles.popup_pattern,{'string','value'});
s=L_pattern{1}(L_pattern{2},4:end);
vac_num=L_pattern{2};
L_t=get(handles.popup_t,{'string','value'});
t=L_t{1}(L_t{2},4:end);
A=get(handles.edit_A,'String');
if isempty(A)
    set(handles.edit_error,'String','Check A element');
else
    B=get(handles.edit_B,'String');
    if isempty(B)
        set(handles.edit_error,'String','Check B element');
    else
        a=str2double(get(handles.edit_lattice,'String'));
        if isempty(a)
            set(handles.edit_error,'String','Check lattice parameter');
        else
            flag_hand=get(handles.checkbox1,'Value');
            filename=StrGen(l_num,s,vac_num,t,a,A,B,flag_hand);
            Message=sprintf('Saved as "%s"',filename);
            set(handles.edit_error,'String',Message);
        end
    end
end

% --- Executes on selection change in popup_length.
function popup_length_Callback(hObject, eventdata, handles)
% hObject    handle to popup_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popup_length contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popup_length
L = get(handles.popup_length,{'string','value'});  % Get the users choice.
if L{2}==1
    set(handles.popup_pattern,'string',['1. AV OO AO OO'; '2. AO VO AO OO']);
    set(handles.popup_t,'string',['1. 1/6'; '2. 2/3']);
else
    set(handles.popup_pattern,'string',['1. AV VO AO OO AO OO AO OO';
        '2. AV OO AV OO AO OO AO OO';        '3. AV OO AO VO AO OO AO OO';
        '4. AO VV AO OO AO OO AO OO';        '5. AO VO AO VO AO OO AO OO';
        '6. AO VO AO OV AO OO AO OO';        '7. AO VO AO OO AO OV AO OO';]);
    set(handles.popup_t,'string',['1. 1/6'; '2. 2/3'; '3. 7/6'; '4. 5/3']);
end

% --- Executes during object creation, after setting all properties.
function popup_length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popup_length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');

end
   

% --- Executes during object creation, after setting all properties.
function axes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes
axes(hObject);
imshow('Picture1.png');
