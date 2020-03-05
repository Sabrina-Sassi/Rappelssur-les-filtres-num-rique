%Application 1: génération d'une impulsion de Dirac et tracer de la rep imp du filtre considèrer 
% génération d'une Dirac

N=128;
n=-64:63;
x=zeros(1,N);
x(65)=1;

subplot(2,1,1)
grid on
stem(n,x)
title('Génération de impulsion de entrée');
xlabel('Valeurs de n');
ylabel('Amplitudes de impulsion');



%%tracer de la reponse impulsionnelle 
b=[0.3 0.6 0.3];
a=[1 0 0.9];
h=filter(b,a,x);
subplot(2,1,2)
stem(n,h)
title('tracé de la réponse impulsionnelle');

xlabel('Valeurs de n');
ylabel('Amplitudes de la reponse impulsionnelle');


%Application 1: génération de la séquence d'entrée et de sortie:
N=30;
n=-15:14;
w=rectwin(30);
subplot(2,1,1);
stem(n,w);
xlabel('Valeurs de n');
ylabel('Amplitudes ');
title('Génération de laséquence rectangulair');



b=[1 0];
a=[1 -0.8 ];
h=filter(b,a,w);
subplot(2,1,2)
stem(n,h);
title('tracé de la sortie');
xlabel('Valeurs de n');
ylabel('Amplitudes de la reponse impulsionnelle');


%génération du signal filtré:
n=-10:100;
b=[1 0.5 0];
a=[1 -1.8*cos(pi/16) 0.81];
x=zeros(1,111);
x(11)=1;
subplot(2,1,1);
stem(n,x);
title('Génération un Dirac');
xlabel('Valeurs de n');
ylabel('Amplitudes de impulsion de Dirac');
%%Generation de la reponse impulsionnelle 
y=filter(b,a,x);
subplot(2,1,2)
stem(y)
title('tracé de la réponse impulsionnelle');

xlabel('Valeurs de n');
ylabel('Amplitudes de la reponse impulsionnelle');






%autres façon de tracer une réponse impulsionnelle sans générer une imp de
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
title('phase de la réponse en fréquence');

%génération d'impulsion dirac:
N=100;
n=0:1:99;
x=zeros(1,100);
x(2)=1;
stem(x);xlabel('n');ylabel('amplitude');title('impulsion de dirac');
%génération de la réponse imp
b=[1 0 0 0 0 0.8];%coefficient de num
a=[1 0 0 0 0 0];%coefficient de dem

y=filter(b,a,x);
figure(1);
%rep imp%
stem(y);
xlabel('n');ylabel('amplitude');title('réponse impul')
[h,w]=freqz(b,a,n,'whole');
figure(2);

plot(w,fftshift(abs(h)));
xlabel('valeur de w en rad/s');
ylabel('amplitude en UA');

title('le module de la réponse en fréquence');
figure(3);
plot(w,(angle(h)));
xlabel('valeur de w en rad/s');
ylabel('phase');
title('phase de la réponse en fréquence');

%localiser les zeros :
figure(4);
zplane(b,a);

