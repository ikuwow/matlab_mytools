%L: frame length
%wav:音声ファイル？
%FM:区切りの周波数(8000)カットオフ？
%Fs:サンプリング周波数

function X = magspec(wav,FrameLength,CutoffFrequency,SamplingFrequency,overlap) %overlapは0以上１以下

FrameLength=2*floor(FrameLength/2); %フレーム長を偶数に調整(オーバーラップ50%だから）
FrequencyUnit = SamplingFrequency/FrameLength; %周波数プロットの最小単位
window = hamming(FrameLength); %ハミング窓wを作成

FrameNumber = floor(size(wav,1)/(FrameLength*overlap)-(1/overlap)-1);%注意！！！！！！エラーの温床はここだ。
x=zeros(FrameLength,FrameNumber); %先に行列Xのサイズを決定

for itr=1:FrameNumber
    x(:,itr) = wav( ((itr-1)*(FrameLength*overlap)+1):((itr-1)*(FrameLength*overlap)+FrameLength) );
    %フレームで切って並べる（オーバーラップ50%)
end

Windows=repmat(window,1,FrameNumber); %窓関数を増やす
X = fft(x.*Windows,FrameLength); %窓かけしてFFT。FFTは各列のFFTを出力する
X = abs(X(2:floor(CutoffFrequency/FrequencyUnit)+1,1:size(X,2))); %magnitudeだから絶対値だ
X(X==0) = 10^-60; %ゼロを修正x

