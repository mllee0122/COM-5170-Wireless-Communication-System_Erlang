%Wireless Communication Network
%Homework1_20181022
%107064522

clc;
clear;

%%%%% 1-1 %%%%%
load_1 = zeros();
i=1;
j=1;
for BP = [0.01,0.03,0.05,0.1]
	for m = 1:20
		load_1(i, j) = ErlangB(m, BP);
        i = i+1;
	end
	j = j+1;
    i = 1;
end

xlsFile = 'trafficload_1.xls';
%%%data = {'m', '1%', '3%', '5%', '10%' };
xlswrite(xlsFile, load_1);

figure(1);
hold on
plot(1:20, load_1(:, 1), 'O')
plot(1:20, load_1(:, 2), 'k:+')
plot(1:20, load_1(:, 3), 'b:X')
plot(1:20, load_1(:, 4), '*')
xlabel('Channel Number')
ylabel('Traffic Load')
legend('1%', '3%', '5%', '10%')
hold off;

%%%%% 1-2 %%%%%
load_2 = zeros();
i=1;
j=1;
for BP = [0.01,0.03,0.05,0.1]
	for m = 200:220
		load_2(i, j) = ErlangB(m, BP);
        i = i+1;
	end
	j = j+1;
    i = 1;
end

xlsFile = 'trafficload_2.xls';
%%%data = {'m', '1.0%', '3.0%', '5.0%', '10%' };
xlswrite(xlsFile, load_2);

figure(2);
hold on
plot(200:220, load_2(:, 1), 'O');
plot(200:220, load_2(:, 2), 'k:+');
plot(200:220, load_2(:, 3), 'b:X');
plot(200:220, load_2(:, 4), '*');
xlabel('Channel Number')
ylabel('Traffic Load')
legend('1%', '3%', '5%', '10%')
hold off;

%%%%% 2 %%%%%
%Blocking Probability
BP = zeros();
i=1;
j=1;
for m = [1, 5, 10, 20]
	for Gc = 0:0.1:1.5
		BP(i, j) = blockrate(Gc*m, m);
        i = i+1;
	end
	j = j+1;
    i = 1;
end

xlsFile = 'blockrate.xls';
xlswrite(xlsFile, BP);

figure(3);
hold on
plot(0:0.1:1.5, BP(:, 1), 'O')
plot(0:0.1:1.5, BP(:, 2), 'k:+')
plot(0:0.1:1.5, BP(:, 3), 'b:X')
plot(0:0.1:1.5, BP(:, 4), '*')
set(gca,'Yscale','log');
xlabel('Offered Traffic Per Channel Gc (Erlangs)')
ylabel('Blocking Probability')
legend('m = 1', 'm = 5', 'm = 10', 'm = 20')
hold off;

%%%%% 3-1 %%%%%
load_3 = zeros();
i=1;
j=1;
for BP = [0.01,0.03,0.05,0.1]
	for m = [40, 60, 120]
		load_3(i, j) = ErlangB(m, BP);
        i = i+1;
	end
	j = j+1;
    i = 1;
end

xlsFile = 'trafficload_3.xls';
%%%data = {'m', '1.0%', '3.0%', '5.0%', '10%' };
xlswrite(xlsFile, load_3);

figure(4)
hold on;
plot([40, 60, 120], load_3(:, 1), 'O');
plot([40, 60, 120], load_3(:, 2), 'k:+');
plot([40, 60, 120], load_3(:, 3), 'b:X');
plot([40, 60, 120], load_3(:, 4), '*');
xlabel('Channel Number')
ylabel('Traffic Load')
legend('1%', '3%', '5%', '10%')
hold off;

%%%%% 3-2 %%%%%
load_4 = zeros(3, 4);
load_4(1, :) = 3*load_3(1, :);
load_4(2, :) = 2*load_3(2, :);
load_4(3, :) = 1*load_3(3, :);

xlsFile = 'trafficload_4.xls';
%%%data = {'m', '1.0%', '3.0%', '5.0%', '10%' };
xlswrite(xlsFile, load_4);

