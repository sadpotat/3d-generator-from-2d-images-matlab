function varargout = newgui(varargin)
% NEWGUI MATLAB code for newgui.fig
%      NEWGUI, by itself, creates a new NEWGUI or raises the existing
%      singleton*.
%
%      H = NEWGUI returns the handle to a new NEWGUI or the handle to
%      the existing singleton*.
%
%      NEWGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWGUI.M with the given input arguments.
%
%      NEWGUI('Property','Value',...) creates a new NEWGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before newgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to newgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help newgui

% Last Modified by GUIDE v2.5 17-Oct-2019 02:37:14

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newgui_OpeningFcn, ...
                   'gui_OutputFcn',  @newgui_OutputFcn, ...
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


% --- Executes just before newgui is made visible.
function newgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to newgui (see VARARGIN)

% Choose default command line output for newgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes newgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = newgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in photos.
function photos_Callback(hObject, eventdata, handles)
% hObject    handle to photos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1, 'String', 'Enter top face');
top_face=imread(uigetfile('*.jpg;*.png','Top Image'));

handles.top = ImageSeparateByMode(handles.type, top_face);
guidata(hObject, handles);
axes(handles.axes6);
imshow(handles.top);
 
set(handles.edit1, 'String', 'Enter front face');
front_face=imread(uigetfile('*.jpg;*.png','Front Image'));

handles.front = ImageSeparateByMode(handles.type, front_face);
guidata(hObject, handles);
axes(handles.axes7);
imshow(handles.front);
 
set(handles.edit1, 'String', 'Enter side face');
side_face=imread(uigetfile('*.jpg;*.png','Side Image'));

handles.side = ImageSeparateByMode(handles.type, side_face);
guidata(hObject, handles);
axes(handles.axes8);
imshow(handles.side);
 
set(handles.edit1, 'String', 'All faces scanned!');




% --- Executes on button press in coordinates.
function coordinates_Callback(hObject, eventdata, handles)
% hObject    handle to coordinates (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.sample=str2num(get(handles.edit3,'string'));
[handles.topx,handles.topy,handles.frontx,handles.frontz,handles.sidey,handles.sidez]=mapCoordinates(handles.sample,handles.top,handles.front,handles.side);
[handles.sideheightx, handles.sideheighty] = SidefaceHeight(handles.sample,handles.top);
guidata(hObject, handles);
set(handles.edit1, 'String', 'Coordinates generated');

[handles.mtopx,handles.mtopy,handles.mfrontx,handles.mfrontz,handles.msidey,handles.msidez,handles.msideheightx,handles.msideheighty]= matchVertices(handles.topx,handles.topy,handles.frontx,handles.frontz,handles.sidey,handles.sidez,handles.sideheightx, handles.sideheighty);
[] = getTriplets(handles.topx,handles.topy,handles.frontx,handles.frontz,handles.sidey,handles.sidez,handles.sideheightx, handles.sideheighty)

handles.mtopx=handles.mtopx*handles.f;
handles.mtopy=handles.mtopy*handles.f;
handles.mfrontx=handles.mfrontx*handles.f;
handles.mfrontz=handles.mfrontz*handles.f;
handles.msidey=handles.msidey*handles.f;
handles.msidez=handles.msidez*handles.f;
handles.msideheightx=handles.msideheightx*handles.f;
handles.msideheighty=handles.msideheighty*handles.f;
guidata(hObject, handles);
set(handles.edit1, 'String', 'Matrix formed');


%table
headers1 = {'1','2'};
rownames1 = {'sx','y','z','x','sy','zz'};
colFormat1 = {'short','short'};
tdata = [size(handles.mxs); size(handles.my); size(handles.mz); size(handles.mx); size(handles.mys); size(handles.mzz);]; 
set(handles.uitable1,'Data',tdata,'ColumnName',headers1, 'RowName', rownames1, 'ColumnFormat',colFormat1, 'ColumnWidth','auto');

% --- Executes on button press in model.
function model_Callback(hObject, eventdata, handles)
% hObject    handle to model (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.htop=get(handles.hidetop,'value');
handles.hfront=get(handles.hidefront,'value');
handles.hleft=get(handles.hideleft,'value');
handles.hright=get(handles.hideright,'value');
handles.hbottom=get(handles.hidebottom,'value');
handles.hback=get(handles.hideback,'value');
get3d(handles.htop,handles.hfront,handles.hleft,handles.hright,handles.hback,handles.hbottom,handles.mxs,handles.mys,handles.mx,handles.my,handles.mz,handles.mzz);


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in calibrate.
function calibrate_Callback(hObject, eventdata, handles)
% hObject    handle to calibrate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1, 'String', 'Calibrating...');
handles.length=str2double(get(handles.edit4,'string'));
handles.f=calibrate(handles.cal,handles.length);
set(handles.edit1, 'String', 'Calibrated!');
handles.type=1;
guidata(hObject, handles);


% --- Executes on button press in hidetop.
function hidetop_Callback(hObject, eventdata, handles)
% hObject    handle to hidetop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of hidetop
handles.htop=get(handles.hidetop,'value');
guidata(hObject, handles);



% --- Executes on button press in hidefront.
function hidefront_Callback(hObject, eventdata, handles)
% hObject    handle to hidefront (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of hidefront
handles.hfront=get(handles.hidefront,'value');
guidata(hObject, handles);


% --- Executes on button press in hideleft.
function hideleft_Callback(hObject, eventdata, handles)
% hObject    handle to hideleft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of hideleft
handles.hleft=get(handles.hideleft,'value');
guidata(hObject, handles);


% --- Executes on button press in hideright.
function hideright_Callback(hObject, eventdata, handles)
% hObject    handle to hideright (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of hideright
handles.hright=get(handles.hideright,'value');
guidata(hObject, handles);


% --- Executes on button press in hideback.
function hideback_Callback(hObject, eventdata, handles)
% hObject    handle to hideback (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of hideback
handles.hback=get(handles.hideback,'value');
guidata(hObject, handles);


% --- Executes on button press in hidebottom.
function hidebottom_Callback(hObject, eventdata, handles)
% hObject    handle to hidebottom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of hidebottom
handles.hbottom=get(handles.hidebottom,'value');
guidata(hObject, handles);



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


% --- Executes on button press in enter.
function enter_Callback(hObject, eventdata, handles)
% hObject    handle to enter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cal.
function cal_Callback(hObject, eventdata, handles)
% hObject    handle to cal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.cal=imread(uigetfile('*.png;*.jpg'));
set(handles.edit1, 'String', 'Image Entered');
guidata(hObject, handles);


% --- Executes on button press in type1.
function type1_Callback(hObject, eventdata, handles)
% hObject    handle to type1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1, 'String', 'Mode 1 selected');
handles.type=1;
guidata(hObject, handles);


% --- Executes on button press in type2.
function type2_Callback(hObject, eventdata, handles)
% hObject    handle to type2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1, 'String', 'Mode 2 selected');
handles.type=2;
guidata(hObject, handles);


% --- Executes on button press in type3.
function type3_Callback(hObject, eventdata, handles)
% hObject    handle to type3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1, 'String', 'Mode 3 selected');
handles.type=3;
guidata(hObject, handles);


% --- Executes on button press in type4.
function type4_Callback(hObject, eventdata, handles)
% hObject    handle to type4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1, 'String', 'Mode 4 selected');
handles.type=4;
guidata(hObject, handles);
