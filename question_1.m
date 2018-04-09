


%{
t_class = y(2:end,7);

% r = randperm(310);
% x_train = x(r(1:210),:);
% t_class_train = t_class(r(1:210));
% x_test = x(r(211:end),:);
% t_class_test = t_class(r(211:end));

%apr = [];
%min_leaf = [5 10 15 20 25];
%min_leaf = 25;
%for j = 1:5
    r = randperm(310);
     x_train = x(r(1:210),:);
    t_class_train = t_class(r(1:210));
    x_test = x(r(211:end),:);
    t_class_test = t_class(r(211:end));

    %figure;
    svmStruct = svmtrain(x_train,t_class_train,'Kernel_Function', 'rbf', 'RBF_Sigma', 1);
    %X = svmclassify(svmStruct,x_test);
    %tc = fitctree(x_train, t_class_train, 'MinLeafSize',25);
   %view(tc,'Mode','graph');

p_class = svmclassify(svmStruct, x_test);
svmStruct.SupportVectors
%%{
    [C,order] = confusionmat(t_class_test,p_class);
    C(1,1)
    C(1,2)
    C(2,1)
    C(2,2)
A = 0;
    B = 0;
    E = 0;
    D = 0;
    A = A + C(1,1);
    B = B + C(1,2);
    E = E + C(2,1);
    D = D + C(2,2);
    
end
X = A/5;
Y = B/5;
Z = E/5;
P = D/5;

    
    % Accuracy
    acc1 = X + P;
    t = X+Y+Z+P;
    Accuracy_value = acc1/t;
    Accuracy_value
    
    %Precision
    Precision_value = X/(X+Z);
    Precision_value
    
    % Recall
    Recall_value = X/(X+Y);
     Recall_value
    %apr = [apr; Accuracy_value Precision_value Recall_value];




view(tc,'Mode','graph')
%plot(1:5, apr);
% hold on;
 plot(min_leaf, apr);
 xlabel('MinLeafSize');
%xlabel('Iteration number');
legend('Accuracy', 'Precision', 'Recall');
ylim([0.5 1])
S = std(apr);
M = mean(apr);
%}



