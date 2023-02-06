% last edited by CV, February 2023
% intro to making a video using the videoWriter

xs = linspace(0,2*pi,100);
ys = sin(xs*2);

% create video object
writerObj = VideoWriter("testvideo.mp4", 'MPEG-4'); % see VideoWriter docs for other formats
writerObj.FrameRate = 10; % set frame rate for video
open(writerObj)


figure
for i = 1:100
    clf % clear current frame

    % plot current time in red, previous blue
    plot(xs(1:i), ys(1:i), "blue")
    hold on
    scatter(xs(i), ys(i), "red")

    % set axis limits so they don't change through movie frames
    xlim([0,2*pi])
    ylim([-1, 1])

    hold off

    % write this figure to the video as a new frame
    currentframe = getframe(gcf);
    writeVideo(writerObj, currentframe)
end

% close video (saves video)
close(writerObj)