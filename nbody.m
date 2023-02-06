% N body example — from CP's notes, February 2023

% dont forget to initialize your simulation!


% set up
nT = ceil(tMax / dt);
pos = zeros(N, 3, nT + 1);
vel = zeros(N, 3, nT + 1);
mass = ones(N);
% initialize positions, and velocities

% run sim
for iT = 1:nT
    for iN = 1:N
        for iM = 1:N
            if iM ~= iN
                dpos = pos(iM, :, iT) - pos(iN, :, iT);
                r = sqrt(sum(dpos.^2));

                vel(iN,:,iT + 1) = vel(iN,:,iT + 1) + dt*G*mass(iM)*dpos / (r^3);
             end
        end

        pos(iN,:,iT + 1) = pos(iN,:,iT) + dt*vel(iN,:,iT);
    end
end