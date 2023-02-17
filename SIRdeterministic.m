% Edited by CV, February 2023 — from notes here: https://math.nyu.edu/~peskin/ics_lecture_notes/SIR_notes.pdf

b = 1/7; %recovery rate, i.e. 7 days to recover
a = 2.3 * b; %reproduction number * b
N = 1000; % population
I = 3; % initial infected
R = 0;
tmax = 200; % days
dt = 1/24; % timestep

% compute other quantities
nT = tmax / dt;
S = N - I - R; 
tsave = (0:nT)*dt;

% make arrays to save quantities, initialize arrays
Ssave = zeros(nT + 1);
Isave = zeros(nT + 1);
Rsave = zeros(nT + 1);

Ssave(1) = S;
Isave(1) = I;
Rsave(1) = R;

% run simulation
for tstep = 1:nT
    t = tstep*dt;
    
    % compute new infections/recovery
    newI = dt*a*(I/N)*S;
    newR = dt*N*I;
    
    % update quantities
    S = S - newI;
    I = I + newI - newR;
    R = R + newR;
    
    % save quantities
    Ssave(tstep + 1) = S;
    Isave(tstep + 1) = I;
    Rsave(tstep + 1) = R;
end

