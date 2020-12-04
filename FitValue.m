function [fitvalue, boxrecord, ErrrorRecord] = FitValue(chrom, OrderData, w1, w2)
NIND = size(chrom, 1);
Objvalue = zeros(NIND,2);                %记录数量和体积
boxrecord = zeros(NIND,30);
ErrorRecord = [];

for i = 1: NIND 
    [Objvalue(i,1),Objvalue(i,2),Tempboxrecord,TempErrorRecord] = Load(chrom(i, :), OrderData);
     j =  size(Tempboxrecord, 2);
     TempRecord = [ErrorRecord ;TempErrorRecord];
     boxrecord(i,1 : j) = Tempboxrecord;
     ErrrorRecord = TempRecord;
end
fitvalue = zeros(NIND,1);
for i = 1 : NIND
    if size(ErrorRecord, 1) > 0
        fitvalue(i) = 1 / Objvalue(i,1) + 10;
    else
        fitvalue(i) = 1 / Objvalue(i,1);
    end
end
