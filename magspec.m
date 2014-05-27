%L: frame length
%wav:�����t�@�C���H
%FM:��؂�̎��g��(8000)�J�b�g�I�t�H
%Fs:�T���v�����O���g��

function X = magspec(wav,FrameLength,CutoffFrequency,SamplingFrequency,overlap) %overlap��0�ȏ�P�ȉ�

FrameLength=2*floor(FrameLength/2); %�t���[�����������ɒ���(�I�[�o�[���b�v50%������j
FrequencyUnit = SamplingFrequency/FrameLength; %���g���v���b�g�̍ŏ��P��
window = hamming(FrameLength); %�n�~���O��w���쐬

FrameNumber = floor(size(wav,1)/(FrameLength*overlap)-(1/overlap)-1);%���ӁI�I�I�I�I�I�G���[�̉����͂������B
x=zeros(FrameLength,FrameNumber); %��ɍs��X�̃T�C�Y������

for itr=1:FrameNumber
    x(:,itr) = wav( ((itr-1)*(FrameLength*overlap)+1):((itr-1)*(FrameLength*overlap)+FrameLength) );
    %�t���[���Ő؂��ĕ��ׂ�i�I�[�o�[���b�v50%)
end

Windows=repmat(window,1,FrameNumber); %���֐��𑝂₷
X = fft(x.*Windows,FrameLength); %����������FFT�BFFT�͊e���FFT���o�͂���
X = abs(X(2:floor(CutoffFrequency/FrequencyUnit)+1,1:size(X,2))); %magnitude�������Βl��
X(X==0) = 10^-60; %�[�����C��x

