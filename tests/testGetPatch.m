% testGetPatch.m
%
%

clear all
close all

sz = [512,512];
p = 5555;

[Hp, rows, cols] = getPatch(sz,p,9);

