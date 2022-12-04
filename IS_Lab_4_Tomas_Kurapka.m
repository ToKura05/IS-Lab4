clear;

pozymiai = pozymiai_raidems_atpazinti('mokymas.PNG', 5);
% pozymiu celės sudedamos į vieną matricą
% 50 skaičių turi 35 požymius
P = cell2mat(pozymiai);
% sugeneruojamas tinklo isejimas kiekvienam skaiciui
T = {eye(10), eye(10), eye(10), eye(10), eye(10)};
% sudaromas neuronu tinklas
% P - iėjimas
% T - išėjimas
tinklas = newrb(P, T, 0, 1, 13);

% Patikrinimas
% paimamas įėjimo rinkinys - pirmos eilutes visi skaičiai (0...,9)
P2 = P(:,1:10);
Y2 = sim(tinklas, P2);
% a2 - didžiausios reikšmės stulpeliuose, b2 - eilutės skaičius, kuriame
% yra tos reikšmės
[a2, b2] = max(Y2);
simboliai_eiluteje = size (P2, 2);
atsakymas = [];
for idx = 1:simboliai_eiluteje
    number = b2(idx) - 1;
    ats_str = sprintf('%d', number);
    atsakymas = [atsakymas, ats_str];
end

% Tinklo patikrinimas su parašytu skaičiumi

pozymiai_skaicius = pozymiai_raidems_atpazinti('skaicius.PNG', 1);
P_sk = cell2mat(pozymiai_skaicius);
Y_sk = sim(tinklas, P_sk);
[a_sk, b_sk] = max(Y_sk);
simboliai = size (P_sk, 2);
atsakymas_sk = [];

for idx = 1:simboliai
    number = b_sk(idx) - 1;
    ats_str = sprintf('%d', number);
    atsakymas_sk = [atsakymas_sk, ats_str];
end

figure(10);
title('Atpažintas skaičius su 13 neuronų RBFN');
text(0.1,0.5,atsakymas_sk,'FontSize',38), axis off

% Patikrinama kaip tinklas atpažįsta simbolius su 8 neuronais vietoj 13
tinklas_2 = newrb(P, T, 0, 1, 8);
Y_sk_t2 = sim(tinklas_2, P_sk);
[a_sk_t2, b_sk_t2] = max(Y_sk_t2);
simboliai = size (P_sk, 2);
atsakymas_sk_t2 = [];

for idx = 1:simboliai
    number = b_sk_t2(idx) - 1;
    ats_str = sprintf('%d', number);
    atsakymas_sk_t2 = [atsakymas_sk_t2, ats_str];
end

figure(11);
title('Atpažintas skaičius su 8 neuronų RBFN');
text(0.1,0.5,atsakymas_sk_t2,'FontSize',38), axis off

% Patikrinama kaip tinklas atpažįsta simbolius su 5 neuronais vietoj 13
tinklas_3 = newrb(P, T, 0, 1, 5);
Y_sk_t3 = sim(tinklas_3, P_sk);
[a_sk_t3, b_sk_t3] = max(Y_sk_t3);
simboliai = size (P_sk, 2);
atsakymas_sk_t3 = [];

for idx = 1:simboliai
    number = b_sk_t3(idx) - 1;
    ats_str = sprintf('%d', number);
    atsakymas_sk_t3 = [atsakymas_sk_t3, ats_str];
end

figure(12);
title('Atpažintas skaičius su 5 neuronų RBFN');
text(0.1,0.5,atsakymas_sk_t3,'FontSize',38), axis off

