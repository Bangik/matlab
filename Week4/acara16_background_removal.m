function varargout = acara16_background_removal(varargin)
% ACARA16_BACKGROUND_REMOVAL MATLAB code for acara16_background_removal.fig
%      ACARA16_BACKGROUND_REMOVAL, by itself, creates a new ACARA16_BACKGROUND_REMOVAL or raises the existing
%      singleton*.
%
%      H = ACARA16_BACKGROUND_REMOVAL returns the handle to a new ACARA16_BACKGROUND_REMOVAL or the handle to
%      the existing singleton*.
%
%      ACARA16_BACKGROUND_REMOVAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ACARA16_BACKGROUND_REMOVAL.M with the given input arguments.
%
%      ACARA16_BACKGROUND_REMOVAL('Property','Value',...) creates a new ACARA16_BACKGROUND_REMOVAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before acara16_background_removal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to acara16_background_removal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help acara16_background_removal

% Last Modified by GUIDE v2.5 05-Oct-2021 17:53:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @acara16_background_removal_OpeningFcn, ...
                   'gui_OutputFcn',  @acara16_background_removal_OutputFcn, ...
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


% --- Executes just before acara16_background_removal is made visible.
function acara16_background_removal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to acara16_background_removal (see VARARGIN)

% Choose default command line output for acara16_background_removal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes acara16_background_removal wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = acara16_background_removal_OutputFcn(hObject, eventdata, handles) 
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
global Im
[nama_file, nama_path] = uigetfile({'*.*'});
    if ~isequal(nama_file,0)
        Im = imread(fullfile(nama_path, nama_file));
        axes(handles.axes1)
        imshow(Im)
        handles.Img=Im;
        guidata(hObject,handles)
    else
    end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Im
[BW,Img] = remove_bg(Im);
axes(handles.axes2)
imshow(Img)
