%twostateViterbi.m
%prior : prior probability scalar
%trans : 2x2 transition matrix
%p_so : p(s|o) at a pitch ( 1xT vector (score ratio)

%on : state 1
%off: state 2
% pitch = 28;
% prior = prior_probability(pitch);
% trans = transition_probability;
% p_so = prob_pitchon(pitch,:);

function path = twostateViterbi(prior,p_so,trans)


K=2;
T=length(p_so);

prior_ = prior;
prior_(prior_(1,:)==0) = 10^(-10); %指数小さくし過ぎるとおかしくなる？
prior_ = repmat([prior_;(1-prior_)],1,T);

p_so_ = p_so;
p_so_(p_so_==0) = 10^(-100);%ここはかなーり小さくても良い
p_so_ = [p_so_;(1-p_so_)];
%p_so : onになる確率(observed
%prior(states,frame)

for itr = 1:size(trans,1)
    trans(1,:) = trans(1,:)/sum(trans(1,:));
end

T1 = zeros(K,T);
T2 = zeros(K,T);

T1(:,1) = p_so_(:,1);
T2(:,1) = [0;0];

%今回の状態jの観測から得られる確率と今回の状態jへの遷移確率の積が最大になる前回の状態kを求める
for t = 2:T
    for j = 1:K %jは状態番号
        [T1(j,t), T2(j,t)] = max( T1(:,t-1).*trans(:,j)*(p_so_(j,t)/prior_(j,t)) );
    end
    T1(:,t) = T1(:,t)/sum(T1(:,t));
end

z = zeros(1,T);%状態番号
[~,z(T)] = max(T1(:,T));

for t = T:(-1):2
    z(t-1) = T2(z(t),t);
end
    path = mod(z,2); %状態番号から状態へ

