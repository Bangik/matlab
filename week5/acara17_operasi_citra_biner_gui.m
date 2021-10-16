function varargout = acara17_operasi_citra_biner_gui(varargin)
% ACARA17_OPERASI_CITRA_BINER_GUI MATLAB code for acara17_operasi_citra_biner_gui.fig
%      ACARA17_OPERASI_CITRA_BINER_GUI, by itself, creates a new ACARA17_OPERASI_CITRA_BINER_GUI or raises the existing
%      singleton*.
%
%      H = ACARA17_OPERASI_CITRA_BINER_GUI returns the handle to a new ACARA17_OPERASI_CITRA_BINER_GUI or the handle to
%      the existing singleton*.
%
%      ACARA17_OPERASI_CITRA_BINER_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ACARA17_OPERASI_CITRA_BINER_GUI.M with the given input arguments.
%
%      ACARA17_OPERASI_CITRA_BINER_GUI('Property','Value',...) creates a new ACARA17_OPERASI_CITRA_BINER_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before acara17_operasi_citra_biner_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to acara17_operasi_citra_biner_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help acara17_operasi_citra_biner_gui

% Last Modified by GUIDE v2.5 06-Oct-2021 18:07:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @acara17_operasi_citra_biner_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @acara17_operasi_citra_biner_gui_OutputFcn, ...
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


% --- Executes just before acara17_operasi_citra_biner_gui is made visible.
function acara17_operasi_citra_biner_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to acara17_operasi_citra_biner_gui (see VARARGIN)

% Choose default command line output for acara17_operasi_citra_biner_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes acara17_operasi_citra_biner_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = acara17_operasi_citra_biner_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA
[name_file1,name_path1] = uigetfile( ...
 {'*.bmp;*.jpg;*.tif','Files of type (*.bmp,*.jpg,*.tif)';
 '*.bmp','File Bitmap (*.bmp)';...
 '*.jpg','File jpeg (*.jpg)';
 '*.tif','File Tif (*.tif)';
 '*.*','All Files (*.*)'},...
 'Open Image');
if ~isequal(name_file1,0)
 handles.data1 = imread(fullfile(name_path1,name_file1));
 guidata(hObject,handles);
 axes(handles.axes1);
 imshow(handles.data1);
else
 return;
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image1 = handles.data1;
gray = rgb2gray(image1);
axes(handles.axes2);
imshow(gray);
handles.data2 = gray;
guidata(hObject,handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gray = handles.data2;
value = graythresh(gray);
thresh = im2bw(gray,value);
thresh = imcomplement(thresh);
axes(handles.axes2);
imshow(thresh);
handles.data3 = thresh;
guidata(hObject,handles);
set(handles.edit1,'String',value)

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[name_file_save,path_save] = uiputfile( ...
 {'*.bmp','File Bitmap (*.bmp)';...
 '*.jpg','File jpeg (*.jpg)';
 '*.tif','File Tif (*.tif)';
 '*.*','All Files (*.*)'},...
 'Save Image');
thresh = handles.data3;
if ~isequal(name_file_save,0)
 imwrite(thresh,fullfile(path_save,name_file_save));
else
 return
end


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
