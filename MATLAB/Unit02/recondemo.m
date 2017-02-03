%RECON_DEMO Reconstruction demo. 

% load the data
load recondemo;

% plot a segment of the data
plot(t4,S4,'k*',tf,SR,'b-',tf,SL,'g-',tf,SS,'r-');
h=line([ 0.965 0.9675 ],[ 0 0 ]); set(h,'Color','k');

% plot data annotations
axis([ 0.965 0.9675 -0.6 0.6 ]);
xlabel('time [sec]'); title('Various Signal Reconstructions');
legend('Signal Samples','Rectangular Interpolation',...
   'Linear Interpolation','Sinc Interpolation');

% define the callback strings for the pushbuttons
CLC='S=get(gco,''UserData''); soundsc(S,44100)';
CL2='S=get(gco,''UserData''); soundsc(S,4000)';

% generate the pushbuttons
ph1=uicontrol('Style','Pushbutton','Units','Pixel');
set(ph1,'Position',[ 100 60 50 20 ],'String','Original',...
   'UserData',S4,'CallBack',CL2);
ph2=uicontrol('Style','Pushbutton','Units','Pixel');
set(ph2,'Position',[ 100+50+5 60 50 20 ],'String','Rect',...
   'UserData',SR,'CallBack',CLC);
ph3=uicontrol('Style','Pushbutton','Units','Pixel');
set(ph3,'Position',[ 100+100+10 60 50 20 ],'String','Linear',...
   'UserData',SL,'CallBack',CLC);
ph4=uicontrol('Style','Pushbutton','Units','Pixel');
set(ph4,'Position',[ 100+150+15 60 50 20 ],'String','Sinc',...
   'UserData',SS,'CallBack',CLC);
