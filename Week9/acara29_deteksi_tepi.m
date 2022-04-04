function varargout = acara29_deteksi_tepi(varargin)
% ACARA29_DETEKSI_TEPI MATLAB code for acara29_deteksi_tepi.fig
%      ACARA29_DETEKSI_TEPI, by itself, creates a new ACARA29_DETEKSI_TEPI or raises the existing
%      singleton*.
%
%      H = ACARA29_DETEKSI_TEPI returns the handle to a new ACARA29_DETEKSI_TEPI or the handle to
%      the existing singleton*.
%
%      ACARA29_DETEKSI_TEPI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ACARA29_DETEKSI_TEPI.M with the given input arguments.
%
%      ACARA29_DETEKSI_TEPI('Property','Value',...) creates a new ACARA29_DETEKSI_TEPI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before acara29_deteksi_tepi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to acara29_deteksi_tepi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help acara29_deteksi_tepi

% Last Modified by GUIDE v2.5 03-Nov-2021 09:16:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @acara29_deteksi_tepi_OpeningFcn, ...
                   'gui_OutputFcn',  @acara29_deteksi_tepi_OutputFcn, ...
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


% --- Executes just before acara29_deteksi_tepi is made visible.
function acara29_deteksi_tepi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to acara29_deteksi_tepi (see VARARGIN)

% Choose default command line output for acara29_deteksi_tepi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes acara29_deteksi_tepi wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = acara29_deteksi_tepi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1,'Value',1) %untuk sobel
set(handles.radiobutton4,'Value',0) %untuk prewit
set(handles.radiobutton5,'Value',0) %untuk canny
set(handles.radiobutton6,'Value',0) %untuk robert

% --- Executes on button press in radiobutton1.
function radiobutton4_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1,'Value',0) %untuk sobel
set(handles.radiobutton4,'Value',1) %untuk prewit
set(handles.radiobutton5,'Value',0) %untuk canny
set(handles.radiobutton6,'Value',0) %untuk robert

% --- Executes on button press in radiobutton1.
function radiobutton5_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1,'Value',0) %untuk sobel
set(handles.radiobutton4,'Value',0) %untuk prewit
set(handles.radiobutton5,'Value',1) %untuk canny
set(handles.radiobutton6,'Value',0) %untuk robert

% --- Executes on button press in radiobutton1.
function radiobutton6_Callback(hObject, eventdata, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton1
set(handles.radiobutton1,'Value',0) %untuk sobel
set(handles.radiobutton4,'Value',0) %untuk prewit
set(handles.radiobutton5,'Value',0) %untuk canny
set(handles.radiobutton6,'Value',1) %untuk robert

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile({'*.*'});
if ~isequal(filename,0)
    Info = imfinfo(fullfile(pathname,filename));
    if Info.BitDepth == 1
        msgbox('Citra masukan harus citra RGB atau Grayscale');
        return
    else
        img_asli = imread(fullfile(pathname,filename));
        axes(handles.axes1)
        cla('reset')
        imshow(img_asli)
    end
else
    return
end

handles.img_asli = img_asli;
guidata(hObject,handles);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img_asli = handles.img_asli;
img_asli = rgb2gray(img_asli);

val1 = get(handles.radiobutton1,'Value');
val2 = get(handles.radiobutton4,'Value');
val3 = get(handles.radiobutton5,'Value');
val4 = get(handles.radiobutton6,'Value');

if val1 == 1
    citra_proses = edge(img_asli, 'sobel');  
elseif val2 == 1
    citra_proses = edge(img_asli, 'prewitt');
elseif val3 == 1
    citra_proses = edge(img_asli, 'canny');
elseif val4 == 1
    citra_proses = edge(img_asli, 'roberts');
end

axes(handles.axes2)
cla('reset')
imshow(citra_proses)
title('Grayscale Image')


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
cla('reset')
set(gca,'XTick',[])
set(gca,'YTick',[])
axes(handles.axes2)
cla('reset')
set(gca,'XTick',[])
set(gca,'YTick',[])

set(handles.radiobutton1,'Value',1)
set(handles.radiobutton4,'Value',0)
set(handles.radiobutton5,'Value',0)
set(handles.radiobutton6,'Value',0)
