
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   This code is written by Nanxin Jin on 2019/4/12   %
%   CNIT581, Purdue University, 2019 Spring           %
%                                                     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function varargout = Lab2GUI(varargin)
% LAB2GUI MATLAB code for Lab2GUI.fig
%      LAB2GUI, by itself, creates a new LAB2GUI or raises the existing
%      singleton*.
%
%      H = LAB2GUI returns the handle to a new LAB2GUI or the handle to
%      the existing singleton*.
%
%      LAB2GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB2GUI.M with the given input arguments.
%
%      LAB2GUI('Property','Value',...) creates a new LAB2GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Lab2GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Lab2GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Lab2GUI

% Last Modified by GUIDE v2.5 12-Apr-2019 22:30:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Lab2GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Lab2GUI_OutputFcn, ...
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


% --- Executes just before Lab2GUI is made visible.
function Lab2GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Lab2GUI (see VARARGIN)

% Choose default command line output for Lab2GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%
% For Arduino use
% Makre sure to update the com port below. 
clear all;
global a;
a = arduino('com3', 'uno');

% --- Outputs from this function are returned to the command line.
function varargout = Lab2GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in increase.
function increase_Callback(hObject, eventdata, handles)
% hObject    handle to increase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
%rotate the left and right motor in push increase button
writeDigitalPin(a, 'D2',1);   % write High to L_CTRL_1 
writeDigitalPin(a, 'D4',0);   % write Low to L_CTRL_1 
writePWMVoltage(a, 'D5', 2);  % write 100 to PWM_L
writeDigitalPin(a, 'D7',1);   % write High to L_CTRL_1 
writeDigitalPin(a, 'D8',0);   % write Low to L_CTRL_1 
writePWMVoltage(a, 'D6', 2);  % write 100 to PWM_L




% --- Executes on button press in decrease.
function decrease_Callback(hObject, eventdata, handles)
% hObject    handle to decrease (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in left.
function left_Callback(hObject, eventdata, handles)
% hObject    handle to left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Let car turn left
global a;
writeDigitalPin(a, 'D2',1);   % write High to L_CTRL_1 
writeDigitalPin(a, 'D4',0);   % write Low to L_CTRL_1 
writePWMVoltage(a, 'D5', 2);  % write 100 to PWM_L
writeDigitalPin(a, 'D7', 0);  % write Low to R_CTRL_1 
writeDigitalPin(a, 'D8', 0);  % write Low to R_CTRL_1

%%Using LED to test this function
%writeDigitalPin(a, 'D13', 1);   %LED
%writePWMVoltage(a, 'D9', 3);    %Buzzer

% --- Executes on button press in right.
function right_Callback(hObject, eventdata, handles)
% hObject    handle to right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Let car turn right
global a;
writeDigitalPin(a, 'D7',1);   % write High to L_CTRL_1 
writeDigitalPin(a, 'D8',0);   % write Low to L_CTRL_1 
writePWMVoltage(a, 'D6', 2);  % write 100 to PWM_L
writeDigitalPin(a, 'D2', 0);  % write Low to R_CTRL_1 
writeDigitalPin(a, 'D4', 0);  % write Low to R_CTRL_1


%%Using LED to test this function
%writeDigitalPin(a, 'D13', 0);   %LED
%writePWMVoltage(a, 'D9', 0);    %Buzzer


% --- Executes on button press in autoNavigation.
function autoNavigation_Callback(hObject, eventdata, handles)
% hObject    handle to autoNavigation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in manualControl.
function manualControl_Callback(hObject, eventdata, handles)
% hObject    handle to manualControl (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all;
global a;
a = arduino('com3', 'uno');

