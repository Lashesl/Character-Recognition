clear all
c=imread('2.jpg'); %���������64*64ͼƬ
figure(1);
imshow(c); %��ʾ����ǰ���ַ�ͼƬ
b=rgb2gray(c); %ʹ�ú�����c�������ֵתΪ�Ҷ�ֵ
[h,w]=size(b); %��ûҶ�ֵb���ھ�������е�ַ
for i=1:h;
    for j=1:w;
        if b(i,j)<127;%���Ҷ�ֵ��127�Ա� �����ֵ��
            a(i,j)=0;
        else
            a(i,j)=255;
        end 
    end
end
figure(2);
imshow(a) %��ʾ��ֵ�����ͼƬ

%ʶ�������ַ�ͼƬ���������ұ߽�
[high,wide]=size(a);
temph_l=0;
temph_r=0;
sum=0;
sum_l=0;
for j=1:wide
    for i=1:high
        if a(i,j)==0;
           sum=sum+1;
        end
    end
sum_l=[sum_l,sum];
sum=0;
end
for j=1:wide-1
    if sum_l(j)<4 & sum_l(j+1)>=4
        temph_l=j;
    end
    if sum_l(j)>=4 & sum_l(j+1)<4
        temph_r=j;
    end
end
n=length(temph_r);
templ_g=0;
templ_d=0;
tmp=[];
    for i=1:high
        for j=temph_l:temph_r
            if a(i,j)==0
                sum=sum+1;
            end
        end 
        tmp=[tmp,sum];
        sum=0;
    end
    for i=1:high-1
        if tmp(i)<3 & tmp(i+1)>=3
            templ_g=i-1;
        end
        if tmp(i)>=3 & tmp(i+1)<3
            templ_d=i+1;
        end
    end
fprintf('ͼƬ�����ֵ���߽��е�ַ%d\n', temph_l);
fprintf('ͼƬ�����ֵ��ұ߽��е�ַ%d\n', temph_r);
fprintf('ͼƬ�����ֵ��ϱ߽��е�ַ%d\n', templ_g);
fprintf('ͼƬ�����ֵ��±߽��е�ַ%d\n', templ_d);
result=0;
y=0;
x1=0;
x2=0;
%��ʾʶ����߽���ַ�ͼ��
figure(3)
imshow(b((templ_g:templ_d),(temph_l:temph_r)));
num=0;
    for i=templ_g:templ_d
       if(a(i,round((temph_l+temph_r)/2))==255 & a(i+1,round((temph_l+temph_r)/2))==0)|(a(i,round((temph_l+temph_r)/2))==0 & a(i+1,round((temph_l+temph_r)/2))==255)
           y=y+1;
       end
    end
    for j=temph_l:temph_r
       if(a(round((templ_g+templ_d)*3/8),j)==255 & a(round((templ_g+templ_d)*3/8),j+1)==0)|(a(round((templ_g+templ_d)*3/8),j)==0 & a(round((templ_g+templ_d)*3/8),j+1)==255)
           x1=x1+1;
           num=num+1;
           if(num==1)
               x1axieleft=j;
           end
       end
       num=0;
    end
    for j=temph_l:temph_r
       if(a(round((templ_g+templ_d)*11/16),j)==255 & a(round((templ_g+templ_d)*11/16),j+1)==0)|(a(round((templ_g+templ_d)*11/16),j)==0 & a(round((templ_g+templ_d)*11/16),j+1)==255)
           x2=x2+1;
           num=num+1;
           if(num==1)
               x1axieleft=j;
           end
       end
    end
fprintf('y=%d\n', y);
fprintf('x1=%d\n', x1);
fprintf('x2=%d\n', x2);
result=0;
width_half=(0.5*(temph_l+temph_r));
%ƥ���Ӧ�����ַ�
if(x1==4&x2==4&y==4)
    result=0;
else
if(x1==2&x2==2&y==2)
    result=1;
else
if(x1==4&x2==2&y==4)
    result=4;
else
if(x1==2&x2==4&y==6)
    result=6;
else
if(x1==2&x2==2&y==4)
    result=7;
else
if(x1==4&x2==4&y==6)
    result=8;
else
if(x1==4&x2==2&y==6)
    result=9;
else
if(x1==2&x2==2&y==6)
    if(x1aixeleft<width_half)
        result=5;
    end
    if(x2aixeleft<width_half)
        result=2;
    end
    if(x1aixeleft>width_half&x2aixeleft>width_half)
        result=3;
    end
end
end
end
end
end
end
end
end
fprintf('ͼƬ�е�������%d\n', result);