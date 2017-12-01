time = [0,10,12,14,16,18,20,22];
sums = zeros(1,length(time));
for index = 2:length(sums)
	sums(index) = sum(sum(sum(cells(:,:,:,index-1))));
end
%x(1) = lam;
%x(2) = c;
F = @(x,xdata) 100000 * exp(x(1)*(1-exp(-x(2)*xdata)));
figure(1);
x0 =  [10,.1];
[x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,time,sums);
hold on;
a1 = plot(time, sums,'-o','MarkerSize',7,'MarkerFaceColor','b','linewidth',2,'Color','b'); 
l1 = 'Experimental Data';
a2 = plot(0:.2:25,F(x,0:.2:25),'r','linewidth',2); 
l2 = 'Gompertzian Fit';
title('Gompertzian Fit to Rat''s Brain Tumor Growth');
xlabel('Time [Days]');
ylabel('Tumor Cell Count');
legend([a1,a2], l1, l2, 'location','northwest');
xlim([0 24])
ylim([0 200000000])
FileFolder = 'C:\Users\Henry\Git\final project\results';
baseFileName = 'ModelPlot';
saveas(figure(1),fullfile(FileFolder,baseFileName),'jpeg');
textName = 'parameters.txt';
fileID = fopen(fullfile(FileFolder,textName),'w');
fprintf(fileID,['lambda: ' num2str(x(1)) '\nc: ' num2str(x(2))]);
fclose(fileID);