%% github：https://github.com/MichaelBeechan
%% CSDN：https://blog.csdn.net/u011344545
%% Time：2019.6.16
%% Function：数值积分和微分方程

% MATLAB中的常微分方程 (ODE) 求解器可对具有各种属性的初始值问题进行求解
% 求解器可以处理刚性或非刚性问题、具有质量矩阵的问题、差分代数方程 (DAE) 或完全隐式问题

%% 非刚性求解器
%{
ode45	求解非刚性微分方程 - 中阶方法
ode23	求解非刚性微分方程 - 低阶方法
ode113	求解非刚性微分方程 - 变阶方法
%}

%% 刚性求解器
%{
ode15s	求解刚性微分方程和 DAE - 变阶方法
ode23s	求解刚性微分方程 - 低阶方法
ode23t	求解中等刚性的 ODE 和 DAE - 梯形法则
ode23tb	求解刚性微分方程 - 梯形法则 + 后向差分公式
%}

%% 完全隐式求解器
%{
ode15i	解算全隐式微分方程 - 变阶方法
decic	为 ode15i 计算一致的初始条件
%}

%% Get/Set 选项
%{
odeget	提取 ODE 选项值
odeset	为 ODE 求解器创建或修改 options 结构体
%}

%% 计算和扩展解
%{
deval	计算微分方程解结构体
odextend	扩展 ODE 的解
%}


