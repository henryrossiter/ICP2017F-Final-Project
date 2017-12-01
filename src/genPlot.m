hold on
load('cells.mat')
clear title
for timeIndex = 1:7
    posArray = [];
f = figure(timeIndex);
set(gcf,'rend','painters','pos',[10 10 900 600]);
z = [1,2,3,4,6,7,8,9,11,12,13,14,16,17,18,19];
for i = 1:16
subplot(4,5,z(i));
imagesc(cells(:,:,i,timeIndex),[0 40000]);
title(['Z = ', num2str(i)])
if i<13
    set(gca,'XTick',[]);
end
if mod(i,4)~=1
    set(gca,'YTick',[])
end
end
h = colorbar;
set(h,'Position',[0.76,0.115,.045,.78])
ax=axes('position',[.12 .1 .75 .84],'visible','off');
xlabel('Voxel Number in X Direction','visible','on')
ylabel('Voxel Number in Y Direction','visible','on')
ax2=axes('position',[.12 .1 .675 .84],'visible','off');
ylabel('Tumor Cell Count per Voxel','visible','on')
set(ax2,'YAxisLocation','right')
title(['Time equals ',num2str(timeIndex*2+8),' days. Brain MRI slices along Z-direction, Rat W09. No radiation treatment.'],'visible','on')
FileFolder = 'C:\Users\Henry\Git\final project\results';
baseFileName = ['tumorDay',num2str(timeIndex*2+8)];
saveas(figure(timeIndex),fullfile(FileFolder,baseFileName),'jpeg');
end