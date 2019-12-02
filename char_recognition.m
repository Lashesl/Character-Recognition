function [] = char_recogintion()
pictureWord1 = imread([int2str(1),'.jpg']) %分割后的第1个图片
pictureWord1 =  imresize(pictureWord1, [48 24]); 
pictureWord2 = imread([int2str(2),'.jpg']); %分割后的第2个图片
pictureWord2 =  imresize(pictureWord2, [48 24]); 
num(1, 1) = shibiehanzi(pictureWord1);
num(1, 2) = shibiezimu(pictureWord2);
for i =3:7 
    filename = strcat('zifu/', int2str(i), '.jpg');
    pictureWord = imread(filename);%分割后第3-7个图片，分别识别
    pictureWord =  imresize(pictureWord, [48 24]); 
    num(1, i) = shibiehunhe(pictureWord);
end
msgbox(num, '检测结果');
text(200, 200, 'num');
end