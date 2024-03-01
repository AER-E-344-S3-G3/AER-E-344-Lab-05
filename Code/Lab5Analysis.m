clear; clc; close all;

figure_dir = "../Figures/";

%% port Cordinates

coords = [0.0000, 0.0036, 0.0306, 0.0494, 0.0735, 0.0962, 0.1201, ...
    0.1452, 0.1921, 0.2944, 0.3746, 0.4365, 0.5023, 0.6130, 0.6569, ...
    0.7093, 0.8004, 0.8348, 0.8759, 0.9367, 1.0000 0.9321, 0.8549, ...
    0.8059, 0.7552, 0.7042, 0.6551, 0.6013, 0.5496, 0.5003, 0.4492, ...
    0.3982, 0.3503, 0.2992, 0.2493, 0.2040, 0.1487, 0.1256, 0.0980, ...
    0.0734, 0.0385, 0.0207, 0.0063, 0; ...
    0.0000, -0.0126, -0.0293, -0.0355, -0.0418, -0.0462, -0.0502, ...
    -0.0539, -0.0585, -0.0641, -0.0653, -0.0640, -0.0609, -0.0486, ...
    -0.0415, -0.0322, -0.0158, -0.0105, -0.0056, -0.0023, 0.0000, ...
    0.0177, 0.0386, 0.0514, 0.0639, 0.0755, 0.0851, 0.0935, 0.0992, ...
    0.1027, 0.1045, 0.1047, 0.1036, 0.1015, 0.0979, 0.0930, 0.0838, ...
    0.0792, 0.0725, 0.0651, 0.0503, 0.0383, 0.0227,0];

coordsplot = [0.0000, 0.0036, 0.0306, 0.0494, 0.0735, 0.0962, 0.1201, ...
    0.1452, 0.1921, 0.2944, 0.3746, 0.4365, 0.5023, 0.6130, 0.6569, ...
    0.7093, 0.8004, 0.8348, 0.8759, 0.9367, 1.0000 0.9321, 0.8549, ...
    0.8059, 0.7552, 0.7042, 0.6551, 0.6013, 0.5496, 0.5003, 0.4492, ...
    0.3982, 0.3503, 0.2992, 0.2493, 0.2040, 0.1487, 0.1256, 0.0980, ...
    0.0734, 0.0385, 0.0207, 0.0063; ...
    0.0000, -0.0126, -0.0293, -0.0355, -0.0418, -0.0462, -0.0502, ...
    -0.0539, -0.0585, -0.0641, -0.0653, -0.0640, -0.0609, -0.0486, ...
    -0.0415, -0.0322, -0.0158, -0.0105, -0.0056, -0.0023, 0.0000, ...
    0.0177, 0.0386, 0.0514, 0.0639, 0.0755, 0.0851, 0.0935, 0.0992, ...
    0.1027, 0.1045, 0.1047, 0.1036, 0.1015, 0.0979, 0.0930, 0.0838, ...
    0.0792, 0.0725, 0.0651, 0.0503, 0.0383, 0.0227];

%% Average upload
deg4N = readtable('-4dg_updated - -4dg (1).csv','Range',"B1:AR1");
deg0 = readtable("0dg_updated - 0dg.csv",'Range',"B1:AR1");
deg4 = readtable("4dg_updated - 4dg.csv",'Range',"B1:AR1");
deg6 = readtable("6dg_updated - 6dg.csv",'Range',"B1:AR1");
deg8 = readtable("8dg_updated  - 8dg.csv",'Range',"B1:AR1");
deg10 = readtable("10dg_updated  - 10dg.csv",'Range',"B1:AR1");
deg12 = readtable("12dg_updated - 12dg.csv",'Range',"B1:AR1");
deg14 = readtable("14dg_updated - 14dg.csv",'Range',"B1:AR1");
deg16 = readtable("16dg_updated - 16dg.csv",'Range',"B1:AR1");

Average = [deg4N;deg0;deg4;deg6;deg8;deg10;deg12;deg14;deg16];

FirstC = Average(:,1);
FirstC.Properties.VariableNames{1} = 'FirstC_Var1';

Averagedata = [Average,FirstC];

deg4NAE = readmatrix('-4dg_updated - -4dg (1).csv','Range',"AS1:AT1");
deg0AE = readmatrix("0dg_updated - 0dg.csv",'Range',"AS1:AT1");
deg4AE = readmatrix("4dg_updated - 4dg.csv",'Range',"AS1:AT1");
deg6AE = readmatrix("6dg_updated - 6dg.csv",'Range',"AS1:AT1");
deg8AE = readmatrix("8dg_updated  - 8dg.csv",'Range',"AS1:AT1");
deg10AE = readmatrix("10dg_updated  - 10dg.csv",'Range',"AS1:AT1");
deg12AE = readmatrix("12dg_updated - 12dg.csv",'Range',"AS1:AT1");
deg14AE = readmatrix("14dg_updated - 14dg.csv",'Range',"AS1:AT1");
deg16AE = readmatrix("16dg_updated - 16dg.csv",'Range',"AS1:AT1");

AverageAE = [deg4NAE;deg0AE;deg4AE;deg6AE;deg8AE;...
    deg10AE;deg12AE;deg14AE;deg16AE];

%% Finding average pressure for each Pannel 
for i=1:43
    j = i+1;
    % Extract the variables for addition
    var_i = Averagedata.(Averagedata.Properties.VariableNames{i});
    var_j = Averagedata.(Averagedata.Properties.VariableNames{j});
    
    % Calculate average and store in result matrix
    average_pressure(:, i) = (var_i + var_j) / 2;
end

for i=1:43
    j = i+1;
    % Extract the variables for addition
    % Calculate average and store in result matrix
    middle_coord(:, i) = (coords(:,j) - coords(:,i));
    half_coord(:,i) = 0.5*(coords(:,j) + coords(:,i));
end

for i = 1:9
    delN(i,:) = average_pressure(i,:).*middle_coord(1,:);
    delA(i,:) = -average_pressure(i,:).*middle_coord(2,:);
    delM(i,:) = (-(average_pressure(i,:).*middle_coord(1,:)) ...
        .*half_coord(1,:)-(average_pressure(i,:).*middle_coord(2,:)) ...
        .*half_coord(2,:));
end

NSum = sum(delN,2);
ASum = sum(delA,2);
MSum = sum(delM,2);

AOA = [-4;0;4;6;8;10;12;14;16];

for i = 1:9
    Lift_per_unit(i,:) = NSum(i,:).*cosd(AOA(i,:))...
        -ASum(i,:).*sind(AOA(i,:)); 
    Drag_per_unit(i,:) = NSum(i,:).*sind(AOA(i,:))...
        +ASum(i,:).*cosd(AOA(i,:)); 
    q(i,:) = 1.1.*(AverageAE(i,1) - AverageAE(i,2));
end

C_l = Lift_per_unit./q;
C_d = Drag_per_unit./q;
C_m = MSum./q;

Averagedata_pressure = Average;

for i=1:9
    C_p_table(i,:) = (Averagedata_pressure(i,:) - AverageAE(i,2))./q(i,:);
    C_p = table2array(C_p_table);
end

%% Graphs
figure
plot(AOA,C_l,"k","LineWidth",2)
title_str = "C_L vs. Angle of Attack";
title(title_str)
xlabel("AoA [°]")
ylabel("C_L [ ]")
grid on
saveas(gcf, figure_dir + title_str + ".svg");

figure
plot(AOA,C_d,"k","LineWidth",2)
title_str = "C_D vs. Angle of Attack";
title(title_str)
xlabel("AoA [°]")
ylabel("C_D [ ]")
grid on
saveas(gcf, figure_dir + title_str + ".svg");

figure
plot(AOA,C_m,"k","LineWidth",2)
title_str = "C_M vs. Angle of Attack";
title(title_str)
xlabel("AoA [°]")
ylabel("C_M [ ]")
grid on
saveas(gcf, figure_dir + title_str + ".svg");

figure
hold on
scatter(coordsplot(1,(1:21)),(C_p(1,1:21)),"Blue","filled")
scatter(coordsplot(1,(22:43)),(C_p(1,22:43)),"Red","filled")
hold off
set (gca,'YDir','reverse')
title_str = "C_p vs. -4° Angle of Attack";
title(title_str)
xlabel("normalized x-coordinate []")
ylabel("C_P [ ]")
grid on
legend("Bottom Surface","Upper Surface")
saveas(gcf, figure_dir + title_str + ".svg");

figure
hold on
scatter(coordsplot(1,(1:21)),(C_p(2,1:21)),"Blue","filled")
scatter(coordsplot(1,(22:43)),(C_p(2,22:43)),"Red","filled")
hold off
set (gca,'YDir','reverse')
title_str = "C_P vs. 0° Angle of Attack";
title(title_str)
xlabel("normalized x-coordinate []")
ylabel("C_P [ ]")
grid on
legend("Bottom Surface","Upper Surface")
saveas(gcf, figure_dir + title_str + ".svg");

figure
hold on
scatter(coordsplot(1,(1:21)),(C_p(3,1:21)),"Blue","filled")
scatter(coordsplot(1,(22:43)),(C_p(3,22:43)),"Red","filled")
hold off
set (gca,'YDir','reverse')
title_str = "C_P vs. 4° Angle of Attack";
title(title_str)
xlabel("normalized x-coordinate []")
ylabel("C_P [ ]")
grid on
legend("Bottom Surface","Upper Surface")
saveas(gcf, figure_dir + title_str + ".svg");

figure
hold on
scatter(coordsplot(1,(1:21)),(C_p(4,1:21)),"Blue","filled")
scatter(coordsplot(1,(22:43)),(C_p(4,22:43)),"Red","filled")
hold off
set (gca,'YDir','reverse')
title_str = "C_P vs. 6° Angle of Attack";
title(title_str)
xlabel("normalized x-coordinate []")
ylabel("C_P [ ]")
grid on
legend("Bottom Surface","Upper Surface")
saveas(gcf, figure_dir + title_str + ".svg");

figure
hold on
scatter(coordsplot(1,(1:21)),(C_p(5,1:21)),"Blue","filled")
scatter(coordsplot(1,(22:43)),(C_p(5,22:43)),"Red","filled")
hold off
set (gca,'YDir','reverse')
title_str = "C_P vs. 8° Angle of Attack";
title(title_str)
xlabel("normalized x-coordinate []")
ylabel("C_P [ ]")
grid on
legend("Bottom Surface","Upper Surface")
saveas(gcf, figure_dir + title_str + ".svg");

figure
hold on
scatter(coordsplot(1,(1:21)),(C_p(6,1:21)),"Blue","filled")
scatter(coordsplot(1,(22:43)),(C_p(6,22:43)),"Red","filled")
hold off
set (gca,'YDir','reverse')
title_str = "C_P vs. 10° Angle of Attack";
title(title_str)
xlabel("normalized x-coordinate []")
ylabel("C_P [ ]")
grid on
legend("Bottom Surface","Upper Surface")
saveas(gcf, figure_dir + title_str + ".svg");

figure
hold on
scatter(coordsplot(1,(1:21)),(C_p(7,1:21)),"Blue","filled")
scatter(coordsplot(1,(22:43)),(C_p(7,22:43)),"Red","filled")
hold off
set (gca,'YDir','reverse')
title_str = "C_P vs. 12° Angle of Attack";
title(title_str)
xlabel("normalized x-coordinate []")
ylabel("C_P [ ]")
grid on
legend("Bottom Surface","Upper Surface")
saveas(gcf, figure_dir + title_str + ".svg");

figure
hold on
scatter(coordsplot(1,(1:21)),(C_p(8,1:21)),"Blue","filled")
scatter(coordsplot(1,(22:43)),(C_p(8,22:43)),"Red","filled")
hold off
set (gca,'YDir','reverse')
title_str = "C_P vs. 14° Angle of Attack";
title(title_str)
xlabel("normalized x-coordinate []")
ylabel("C_P [ ]")
grid on
legend("Bottom Surface","Upper Surface")
saveas(gcf, figure_dir + title_str + ".svg");

figure
hold on
scatter(coordsplot(1,(1:21)),(C_p(9,1:21)),"Blue","filled")
scatter(coordsplot(1,(22:43)),(C_p(9,22:43)),"Red","filled")
hold off
set (gca,'YDir','reverse')
title_str = "C_P vs. 16° Angle of Attack";
title(title_str)
xlabel("normalized x-coordinate []")
ylabel("C_P [ ]")
grid on
legend("Bottom Surface","Upper Surface")
saveas(gcf, figure_dir + title_str + ".svg");
