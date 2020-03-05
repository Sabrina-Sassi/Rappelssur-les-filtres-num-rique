%Application 1: g�n�ration d'une impulsion de Dirac et tracer de la rep imp du filtre consid�rer 
% g�n�ration d'une Dirac

N=128;
n=-64:63;
x=zeros(1,N);
x(65)=1;

subplot(2,1,1)
grid on
stem(n,x)
title('G�n�ration de impulsion de entr�e');
xlabel('Valeurs de n');
ylabel('Amplitudes de impulsion');



%%tracer de la reponse impulsionnelle 
b=[0.3 0.6 0.3];
a=[1 0 0.9];
h=filter(b,a,x);
subplot(2,1,2)
stem(n,h)
title('trac� de la r�ponse impulsionnelle');

xlabel('Valeurs de n');
ylabel('Amplitudes de la reponse impulsionnelle');


%Application 1: g�n�ration de la s�quence d'entr�e et de sortie:
N=30;
n=-15:14;
w=rectwin(30);
subplot(2,1,1);
stem(n,w);
xlabel('Valeurs de n');
ylabel('Amplitudes ');
title('G�n�ration de las�quence rectangulair');



b=[1 0];
a=[1 -0.8 ];
h=filter(b,a,w);
subplot(2,1,2)
stem(n,h);
title('trac� de la sortie');
xlabel('Valeurs de n');
ylabel('Amplitudes de la reponse impulsionnelle');


%g�n�ration du signal filtr�:
n=-10:100;
b=[1 0.5 0];
a=[1 -1.8*cos(pi/16) 0.81];
x=zeros(1,111);
x(11)=1;
subplot(2,1,1);
stem(n,x);
title('G�n�ration un Dirac');
xlabel('Valeurs de n');
ylabel('Amplitudes de impulsion de Dirac');
%%Generation de la reponse impulsionnelle 
y=filter(b,a,x);
subplot(2,1,2)
stem(y)
title('trac� de la r�ponse impulsionnelle');

xlabel('Valeurs de n');
ylabel('Amplitudes de la reponse impulsionnelle');






%autres fa�on de tracer une r�ponse impulsionnelle sans g�n�rer une imp de
%dirac:
b2=[1 0 5 0];
a2=[1 -1.8*cos(pi/16) 0.81];
h=impz(b2,a2);
figure(1)
stem(h);



%tracer le spectre d'amplutude et de phase de H(jw):
N=512;
b2=[1 0 5 0];
a2=[1 -1.8*cos(pi/16) 0.81];
[h,w]=freqz(b,a,N);
figure;
plot(w,fftshift(abs(h)));
grid on;
xlabel('valeur de w en rad/s');
ylabel('amplitude en UA');
title('tracer du spectre d amplitude');

plot(w,(angle(h)));

xlabel('valeur de w en rad/s');
ylabel('phase');
title('phase de la r�ponse en fr�quence');

%g�n�ration d'impulsion dirac:
N=100;
n=0:1:99;
x=zeros(1,100);
x(2)=1;
stem(x);xlabel('n');ylabel('amplitude');title('impulsion de dirac');
%g�n�ration de la r�ponse imp
b=[1 0 0 0 0 0.8];%coefficient de num
a=[1 0 0 0 0 0];%coefficient de dem

y=filter(b,a,x);
figure(1);
%rep imp%
stem(y);
xlabel('n');ylabel('amplitude');title('r�ponse impul')
[h,w]=freqz(b,a,n,'whole');
figure(2);

plot(w,fftshift(abs(h)));
xlabel('valeur de w en rad/s');
ylabel('amplitude en UA');

title('le module de la r�ponse en fr�quence');
figure(3);
plot(w,(angle(h)));
xlabel('valeur de w en rad/s');
ylabel('phase');
title('phase de la r�ponse en fr�quence');

%localiser les zeros :
figure(4);
zplane(b,a);

