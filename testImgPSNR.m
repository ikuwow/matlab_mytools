% testImgPSNR.m

clear all
close all

X = rand(512,512,3,'double');
Y = rand(512,512,3,'double');

imgPSNR(X,Y)

imgPSNR(uint8(255*X),uint8(255*Y))

