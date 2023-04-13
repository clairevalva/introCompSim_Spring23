tiledlayout(2,2); % declaring format, 2 cols, 2 rows
[X,Y,Z] = peaks(20); % get data (built in function)

% Tile 1
nexttile % move to the next tile
surf(X,Y,Z)

% Tile 2
nexttile
contour(X,Y,Z)

% Tile 3
nexttile
imagesc(Z)

% Tile 4
nexttile
plot3(X,Y,Z)

% replace Tile 2
nexttile(2)
plot3(X,Y,Z)

