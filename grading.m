# [grade weight]
clc

# CSE 100
clear
homework = [0.98 0.2];
labs = [0.97 0.25];
mt1 = 0.89;
mt2 = 0.94;
midterms = [(mt1 + mt2) / 2 0.30];
final = [0.95 0.25];

logic_grade = homework(1) * homework(2) + labs(1) * labs(2) + ...
  midterms(1) * midterms(2) + final(1) * final(2)

# HIST 74A
clear
sa1 = [0.925 0.2];
sa2 = [0.95 0.2];
midterm = [0.95 0.25];
final = [0.95 0.25];
part = [1.0 0.1];

hist_grade = sa1(1) * sa1(2) + sa2(1) * sa2(2) + midterm(1) * midterm(2) + ...
  final(1) * final(2) + part(1) * part(2)

# ECE 103
clear
homework = [1.0 0.05];
mt = [0.76667 0.3];
final = [0.97 0.65]; # I need to get basically a perfect score on my final to pull off an A.

systems_grade = homework(1) * homework(2) + mt(1) * mt(2) + final(1) * final(2)

# ECE 103L
clear
labs = [0.95 0.925 0.8 1 1 1]; # if I get _perfect_ scores on my final 2 labs, I might have a shot at an A.
homework = [sum(labs) / 6 0.6];
final = [0.95 0.4];

systems_lab_grade = homework(1) * homework(2) + final(1) * final(2)