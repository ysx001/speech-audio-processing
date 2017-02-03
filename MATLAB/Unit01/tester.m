% Tester file for sinetone, recttone and tenttone


FS=8000;
S1=sinetone(50,FS,0.1,pi);
t1=(0:length(S1)-1)/FS;
S2=recttone(75,FS,0.1,-pi/2);
t2=(0:length(S2)-1)/FS;
S3=tenttone(100,FS,0.1,pi/2);
t3=(0:length(S3)-1)/FS;
subplot(3,1,1); h=plot(t1,S1);
set(h,'Color',[1 0 0],'LineWidth',2)
axis([0 0.1 -1.2 1.2]); grid on
title('Sinusoidally Shaped Tone');
subplot(3,1,2); h=plot(t2,S2);
set(h,'Color',[0 0.5 0],'LineWidth',2)
axis([0 0.1 -1.2 1.2]); grid on
title('Rectangularly Shaped Tone');
subplot(3,1,3); h=plot(t3,S3);
set(h,'Color',[0 0 1],'LineWidth',2)
axis([0 0.1 -1.2 1.2]); grid on
title('Triangularly Shaped Tone');