% MATLAB program to generate a PN sequence with 3 registers
% Define the number of registers
n = 3;
% Define the initial state (should not be all zeros)
state = [1 0 1];
% Define the feedback taps (for a maximal-length LFSR, use taps [3,1])
feedback_taps = [3 1];
% Define the length of the sequence to generate
sequence_length = 2^n - 1; % Maximum length sequence
% Initialize the PN sequence storage
pn_sequence = zeros(1, sequence_length);
% Generate the PN sequence
for i = 1:sequence_length
pn_sequence(i) = state(end); % Output the last register bit
% Compute the new feedback bit (XOR of tapped positions)
feedback_bit = mod(sum(state(feedback_taps)), 2);
% Shift the register
state = [feedback_bit, state(1:end-1)];
end
% Display the generated PN sequence
disp('Generated PN sequence:');
disp(pn_sequence);
% Plot the sequence
stem(pn_sequence, 'filled');
title('PN Sequence with 3 Registers');
xlabel('Bit Index');
ylabel('Bit Value');