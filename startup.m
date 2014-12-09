addpath('~/Documents/MATLAB/MyTools');
addpath('~/Documents/MATLAB/AutoShared/Libraries');

%% xlwrite.m
javaaddpath('AutoShared/Libraries/poi_library/poi-3.8-20120326.jar');
javaaddpath('AutoShared/Libraries/poi_library/poi-ooxml-3.8-20120326.jar');
javaaddpath('AutoShared/Libraries/poi_library/poi-ooxml-schemas-3.8-20120326.jar');
javaaddpath('AutoShared/Libraries/poi_library/xmlbeans-2.3.0.jar');
javaaddpath('AutoShared/Libraries/poi_library/dom4j-1.6.1.jar');
javaaddpath('AutoShared/Libraries/poi_library/stax-api-1.0.1.jar');

setenv('PATH',['/usr/local/bin:',getenv('PATH')])
