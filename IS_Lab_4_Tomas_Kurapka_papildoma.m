clear;

pozymiai = pozymiai_raidems_atpazinti('mokymas.PNG', 5);
% pozymiu celės sudedamos į vieną matricą
% 50 skaičių turi 35 požymius
P = cell2mat(pozymiai);
% sugeneruojamas tinklo isejimas kiekvienam skaiciui
T = {eye(10), eye(10), eye(10), eye(10), eye(10)};
T = cell2mat(T);
% sudaromas neuronu tinklas

tinklas = feedforwardnet(13);
% apmokinamas
tinklas = train(tinklas, P, T);

% Tinklo patikrinimas su parašytu skaičiumi

pozymiai_skaicius = pozymiai_raidems_atpazinti('skaicius.PNG', 1);
P_sk = cell2mat(pozymiai_skaicius);
Y_sk = tinklas(P_sk);
[a_sk, b_sk] = max(Y_sk);
simboliai = size (P_sk, 2);
atsakymas_sk = [];

for idx = 1:simboliai
    number = b_sk(idx) - 1;
    ats_str = sprintf('%d', number);
    atsakymas_sk = [atsakymas_sk, ats_str];
end

figure(10);
title('Atpažintas skaičius su 13 neuronų daugiasluoksniu perceptronu');
text(0.1,0.5,atsakymas_sk,'FontSize',38), axis off

