
I= imread('lena_gray_256.tif');
I= imresize(I,1);
bandWidth=10;

bandWidth=bandWidth/255; % 255 for 8 bit (2^n)-1=S
I = im2double(I);

X = reshape(I,size(I,1)*size(I,2),[]);

%Initialization

clusterNum=0;
stoppingThreshold=1e-3*bandWidth;
clusterCenters=[];
visitedPoints=zeros(size(X,1),1);
initPointIndxs=1:size(X,1);
initPoints=size(X,1);
clusterVotes    = zeros(1,size(X,1));

while initPoints

    tempInd = ceil( (initPoints-1e-6)*rand);
    startingInd=initPointIndxs(tempInd);
    myMean=X(startingInd,:);
    myMembers=[];
    thisClusterVotes=zeros(1,size(X,1));

    while 1

        A=repmat(myMean,size(X,1),1);
        sqDistToAll= sum((A -X).^2,2);
        inCluster=find(sqDistToAll<bandWidth^2);
        thisClusterVotes(inCluster) = thisClusterVotes(inCluster)+1;


        myOldMean=myMean;
        myMean=mean(X(inCluster,:),1);
        myMembers=[myMembers ;inCluster];
        visitedPoints(myMembers)=1;





        if(norm(myMean-myOldMean)<stoppingThreshold)

            mergeWith=0;
            for cN=1:clusterNum
                distToOther=norm(myMean-clusterCenters(cN,:));
                if(distToOther<2*bandWidth)
                   mergeWith=cN;
                   break;
                end

            end

            if mergeWith > 0

               clusterCenters(mergeWith,:)=0.5*(myMean+clusterCenters(mergeWith,:));

               clusterVotes(mergeWith,:)=clusterVotes(mergeWith,:)+ thisClusterVotes;

            else
                clusterNum=clusterNum+1;
                clusterCenters=[clusterCenters ;myMean];
                clusterVotes(clusterNum,:)=thisClusterVotes;

            end

            break;
        end
    end

    initPointIndxs=find(visitedPoints == 0);
    initPoints=length(initPointIndxs);
end

[val data2cluster]=max(clusterVotes,[],1);

cluster2dataCell=cell(clusterNum,1);

for cN=1:clusterNum;
   myMembers=find(data2cluster==cN);
   cluster2dataCell{cN}=myMembers;

end

for i = 1:length(cluster2dataCell)
X(cluster2dataCell{i},:) = repmat(clusterCenters(i,:),size(cluster2dataCell{i},2),1);

end
Ims = reshape(X,size(I,1),size(I,2),[]);
figure;

imshow(Ims); title('Segmented Image');
