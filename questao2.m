%% P1 - Novas Tecnologias de Manufatura - SEM0406 2021.2
% Alessandro Melo de Oliveira - 10788662
% Guilherme Beppu de Souza - 10696681
%%
import ETS3.*;
% Medidas dos braços, em [cm]
H1 = 100;
H2 = 70;
H3 = 60;
D1 = 40;
D2 = 50;

% Elos do robo
ELO1 = Link([0 H1 0 0 0]);

ELO2 = Link([0 H2 0 -pi/2 0]);
ELO2.jointtype='P';
ELO2.qlim = [0 H1];

ELO3 = Link([0 H3 0 0 0]);
ELO3.jointtype='P';
ELO3.qlim = [10 D2];

ELO4 = Link([0 0 0 -pi/2]);
ELO5= Link([0 0 40 0]);
                  
robo_prova = SerialLink([ELO1 ELO2 ELO3 ELO4 ELO5], 'name', 'PROVA'); 

%Posicoes
q1 = [-pi/2 H3 0 0 0];
q2 = [-pi/2 H2 0 0 0];
q3 = [-pi/2 H2 D2 0 0];
q4 = [-pi/2 H2 D2 pi/2 0];
q5 = [-pi/2 H2 D1 pi/2 0];
q6 = [pi H2 D1 pi/2 0];
q7 = [pi/2 H2 D1 pi/2 0];
q8 = [pi/2 H1 D1 pi/2 0];

Q = {q1; q2; q3; q4; q5; q6; q7; q8};

for i=1:length(Q)
    robo_prova.plot(Q{i})
    pause(1)
end

robo_prova.teach()