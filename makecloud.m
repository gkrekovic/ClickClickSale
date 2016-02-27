## Author: Gordan Kreković
## Created: 2015-08-08

function [retval] = makecloud (filename, duration, fs, ch, dataduration, typ)
  % Lenght of the whole piece in samples
  plen = duration*fs;
  
  % Initialization of ch audio channels
  piece = double(zeros(plen, ch));

  %% Open the file
  fid = fopen (filename);
  inputline = fgetl(fid);
  
  inittime = parsetime("2015-08-03 10:00:00.000");
  
  while 1
     %% Load a row from the file
    inputline = fgetl(fid);
	if ~ischar(inputline), break, end

	% Parse a data row
	parsedline = strsplit(inputline, ";");
	tstamp = parsedline{1};
	network = str2double(parsedline{2});
	aff = str2double(parsedline{3});
	off = str2double(parsedline{4});
	adv = str2double(parsedline{5});
	country = parsedline{6};
	deviceos = parsedline{7};
	devicetype = parsedline{8};
	brand = parsedline{9};
	model = parsedline{10};
	conn = parsedline{11};
	operator = parsedline{12};

    %% Calculate time offset
    eventtime = parsetime(tstamp);
    offset = round(((eventtime - inittime)/dataduration) * duration * fs);
    
    grainsize = determinesize(network, fs, typ);
    window = makewindow(conn, grainsize, typ);
    grain = window .* makesignal(network, aff, adv, operator, model, grainsize, fs, typ);
    sp = spatialize(country, ch);
    amp = determineamplitude(network);

	% Synthesize each grain separately and add them together to the common array which presents the whole composition
	% Unefficient solution which should be refactored
    for j = 1:ch  
      ends = offset+grainsize;
      if ends < plen
        piece(1+offset:ends, j) = piece(1+offset:ends, j) + amp*sp(j,1)*grain;
        % piece(:, j) = piece(:, j) + [zeros(offset, 1); amp*sp(j,1)*grain; zeros(plen-offset-grainsize, 1)];
      end
    end   
  end

fclose(fid);

retval = piece;

end
