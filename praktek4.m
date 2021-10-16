function varargout = praktek4(varargin)
% PRAKTEK4 MATLAB code for praktek4.fig
%      PRAKTEK4, by itself, creates a new PRAKTEK4 or raises the existing
%      singleton*.
%
%      H = PRAKTEK4 returns the handle to a new PRAKTEK4 or the handle to
%      the existing singleton*.
%
%      PRAKTEK4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRAKTEK4.M with the given input arguments.
%
%      PRAKTEK4('Property','Value',...) creates a new PRAKTEK4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before praktek4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to praktek4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help praktek4

% Last Modified by GUIDE v2.5 10-Sep-2021 08:05:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @praktek4_OpeningFcn, ...
                   'gui_OutputFcn',  @praktek4_OutputFcn, ...
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


% --- Executes just before praktek4 is made visible.
function praktek4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to praktek4 (see VARARGIN)

% Choose default command line output for praktek4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes praktek4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = praktek4_OutputFcn(hObject, eventdata, handles) 
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
% handles    structure with handles and user data (see GUIDATA)
open = guidata(gcbo);
[namafile, direktori] = uigetfile('*.jpg;*.bmp;*.tif', 'OpenImage');
I = imread(namafile);
I = rgb2gray(I);
set(open.figure1, 'CurrentAxes', open.axes1);
set(imagesc(I));
colormap('gray');
set(open.axes1, 'Userdata', I);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open = guidata(gcbo);
I = get(open.axes1, 'Userdata');
[r c] = size(I);
for x = 1 : r
    for y = 1 : c
        J(x,y) = 255 - I(x,y);
    end
end
set(open.figure1, 'CurrentAxes', open.axes2);
set(imagesc(J));
colormap('gray');
set(open.axes2, 'Userdata', J);
