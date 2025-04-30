clc; clear; close all;

% Given probabilities
symbols = {'m1', 'm2', 'm3', 'm4', 'm5'};
probabilities = [0.4, 0.19, 0.16, 0.15, 0.1];

% Sort symbols based on probabilities in descending order
[probabilities, idx] = sort(probabilities, 'descend');
symbols = symbols(idx);

% Shannon-Fano encoding function
function codewords = shannon_fano(probabilities)
    n = length(probabilities);
    codewords = repmat({''}, 1, n);
    
    if n == 1
        return;
    end
    
    % Find partition index
    total = sum(probabilities);
    cumulative = 0;
    for i = 1:n
        cumulative = cumulative + probabilities(i);
        if cumulative >= total / 2
            break;
        end
    end
    
    % Assign '0' to the first group and '1' to the second
    for j = 1:i
        codewords{j} = '0';
    end
    for j = i+1:n
        codewords{j} = '1';
    end
    
    % Recursively apply Shannon-Fano coding
    leftCodes = shannon_fano(probabilities(1:i));
    rightCodes = shannon_fano(probabilities(i+1:end));
    
    for j = 1:i
        codewords{j} = strcat(codewords{j}, leftCodes{j});
    end
    for j = 1:(n-i)
        codewords{i+j} = strcat(codewords{i+j}, rightCodes{j});
    end
end

% Generate Shannon-Fano code
codewords = shannon_fano(probabilities);

% Calculate code lengths
codelengths = cellfun(@length, codewords);

% Calculate entropy
entropy = -sum(probabilities .* log2(probabilities));

% Calculate average code length
avg_code_length = sum(probabilities .* codelengths);

% Calculate efficiency
efficiency = (entropy / avg_code_length) * 100;

% Display results
disp('Shannon-Fano Coding:');
for i = 1:length(symbols)
    fprintf('%s: %s (Length: %d)\n', symbols{i}, codewords{i}, codelengths(i));
end

fprintf('\nEntropy: %.4f bits\n', entropy);
fprintf('Average Code Length: %.4f bits\n', avg_code_length);
fprintf('Efficiency: %.2f%%\n', efficiency);