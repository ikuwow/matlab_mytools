%smallranking.m
%2012/12/13 NEW

%data : data vector
%bestwhat : the number of commending

function ranking = smallranking(data, bestwhat) 

if numel(data)<bestwhat
	error('Data size is smaller than comending number.')
end

%次元数が２以上の時にエラーを出したんだけど・・・・

entry = [(1:length(data))' data];

entry = sortrows(entry,2);

entry(:,1) = uint64(entry(:,1));


ranking = entry(1:bestwhat,:);

end
