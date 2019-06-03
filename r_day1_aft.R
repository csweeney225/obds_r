df <- read.csv("sample_info.txt", header=TRUE, sep="\t")
View(df)
dim(df)
df_5 <- df[5,]
View(df_5)
df_sub <- df$sample_title[4]
View(df_sub)
df$mill_reads <- df$read_count/10000000
barplot(df$mill_reads, main="mill_reads", names.arg=df$sample_title, las=2)

reads <- read.csv("joined_final.txt", header=TRUE, sep=" ")
View(reads)
summary <- summary(reads)

reads$sum <- rowSums(reads[,(2:7)])
exp_reads <- reads[reads$sum > 0,]
exp_reads <- exp_reads[,-c(8)]

exp_reads$sum <- rowSums(exp_reads[-1])
exp_reads2 <- exp_reads[order(exp_reads$sum),]
View(exp_reads2)
tail(exp_reads2)

#or:
#expressed <- reads[rowSums(counts[-1]>0),]
#not that [-1] is all except first column
