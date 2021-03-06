function [beta,L]=i_all_o_p(jingdu,weidu,t,month,day,H)%弧度
N = datenum(2015,month,day)-datenum(2015,0,0);%日期转换成天数 
b=2*pi*(N-1)/365; 
delta =deg2rad([0.006918-0.399912*cos(b)+0.070257*sin(b)-0.006758*cos(2*b)+0.000907*sin(2*b)-0.002697*cos(3*b)+0.00148*sin(3*b)]*(180/pi));%赤纬角 
fai = deg2rad(weidu);%纬度 
yita = jingdu;%经度
sc = (120-yita)/15;%时差 
st = t-sc;
omega = [deg2rad((st-12)*15)];%时角 
alpha = [asin(sin(delta)*sin(fai)+cos(delta)*cos(fai)*cos(omega))];%高度角 
%H = 3;%杆长 
beta = [acos((sin(alpha)*sin(fai)-sin(delta))/(cos(alpha)*cos(fai)))]%太阳方位角
L = [H*cot(alpha)];%影长 %曲线拟合
