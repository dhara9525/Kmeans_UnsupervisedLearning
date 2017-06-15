% MATLAB version : R2017a 9.2.0.538062
F=dlmread('simple_iris_dataset.dat');
%Follwing section is utlized while cration of confusion matrix
actualGroup1=find(F(:,3)==1);
actualSizeGroup1=size(actualGroup1);
actualNumberofElementsG1=actualSizeGroup1(1,1);
actualGroup2=find(F(:,3)==2);
actualSizeGroup2=size(actualGroup2);
actualNumberofElementsG2=actualSizeGroup2(1,1);
%Following section is for selecting 2 random centroid from the given dataset
N=2; % Defining number of centriods required 
c=randperm(length(F),N); 
B=F(c,:);
centroid1=B(1,1:2);
centroid2=B(2,1:2);
 figure
 hold on
 xlabel('Sepal Length')
 ylabel('Sepal Width')
 group1=[];
 group2=[];
 for o=1:15
       group1=[];
       group2=[];
       for i=1:100
         d1= sqrt((F(i,1)-centroid1(1,1))^2+(F(i,2)-centroid1(1,2))^2);
         d2= sqrt((F(i,1)-centroid2(1,1))^2+(F(i,2)-centroid2(1,2))^2);
         if(d1<d2)
            group1(end+1)=i;
         else
            group2(end+1)=i;
        end
       end
       sizeofGroup1=size(group1);
       numberofElementsG1=sizeofGroup1(1,2);
       sizeofGroup2=size(group2);
       numberofElementsG2=sizeofGroup2(1,2); 
        for j=1 : numberofElementsG1
            cluster1=F(group1,1:2);
        end
        for k=1 : numberofElementsG2
            cluster2=F(group2,1:2);
        end
        for l=1 : numberofElementsG1
            sum1=sum(cluster1(:,:));
        end
        for m=1 : numberofElementsG2
            sum2=sum(cluster2(:,:));
        end
    newCentroid1=sum1/numberofElementsG1;
    newCentroid2=sum2/numberofElementsG2;
    temp1=centroid1;
    temp2=centroid2;
    if (abs(newCentroid1(1,1)-temp1(1,1)))<0.0001 && abs((newCentroid1(1,2)-temp1(1,2)))<0.0001 && abs((newCentroid2(1,1)-temp2(1,1)))<0.0001 && abs((newCentroid2(1,2)-temp2(1,2)))<0.0001
        break
    end
    centroid1=newCentroid1;
    centroid2=newCentroid2; 
 end
plot(F(group1,1),F(group1,2),'r.','MarkerSize',12)
plot(F(group2,1),F(group2,2),'b.','MarkerSize',10)
plot(centroid1(:,1),centroid1(:,2), 'kx', 'MarkerSize',12,'LineWidth',2);
plot(centroid2(:,1),centroid2(:,2), 'ko', 'MarkerSize',12,'LineWidth',2);
fprintf("Confusion Matrix :\n\n");
confusion_Matrix=[numberofElementsG1 abs(actualNumberofElementsG1-numberofElementsG1); abs(actualNumberofElementsG1-numberofElementsG2) numberofElementsG2];
disp(confusion_Matrix);
fprintf("Convergence is achieved at iteration number :");
disp(o);
