% Edited by CV, February 2023 — from notes here: https://math.nyu.edu/~peskin/ics_lecture_notes/SIR_notes.pdf

b = 1/7; %recovery rate, i.e. 7 days to recover
R0 = 2.3; % reproduction number
N = 1000; % population
I = 3; % initial infected
R = 0; % number recovered
tmax = 30; % days
dt = 1/24; % timestep

filename = "SIRdet_R0=" + string(R0) + "_b=" + string(b) + ".mat"; % .mat extension to save matlab data

% compute other quantities
a = R0 * b; %reproduction number * b
nT = tmax / dt;
S = N - I - R;
tsave = (0:nT)*dt;

% make arrays to save quantities, initialize arrays
Ssave = zeros(1, nT + 1);
Isave = zeros(1, nT + 1);
Rsave = zeros(1, nT + 1);

Ssave(1) = S;
Isave(1) = I;
Rsave(1) = R;

% run simulation
for tstep = 1:nT
    t = tstep*dt;
    
    % compute new infections/recovery
    newI = dt*a*(I/N)*S;
    newR = dt*b*I;
    
    % update quantities
    S = S - newI;
    I = I + newI - newR;
    R = R + newR;
    % made_a_bug = plot();

    % save quantities
    Ssave(tstep + 1) = S;
    Isave(tstep + 1) = I;
    Rsave(tstep + 1) = R;
    % Tsave(tstep + 1) = t;
end

% save the data
% save(filename, 'S', 'I', 'R', 'R0');
