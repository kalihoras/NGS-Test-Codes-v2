import glob
import pandas as pd
import numpy as np
BINS = 1000

coverage_files_list = [f for f in glob.glob("*.coverage")]
print(coverage_files_list)
for cov_file in coverage_files_list:
    file_name=cov_file+"."+str(BINS)+".parsed.csv"
    print(file_name)
    chr_dfs={}
    df=pd.read_csv(cov_file, sep="\t", header=None, names=["Chr","Pos","Depth"] )
    for chrom in [c for c in list(df['Chr'].unique()) if 'chr' in c]:
        print(chrom)
        dg = df.copy()
        df_chr=dg[dg['Chr']==chrom]
        df_v2 = df_chr.groupby(pd.cut(df_chr['Pos'], np.arange(0, df_chr['Pos'].max()+BINS, BINS))).sum()[['Depth']].reset_index(drop=True)
        df_v2.columns = ['Sum_Depth']
        df_v2['Million_Norm']         = (df_v2['Sum_Depth'] / df_v2['Sum_Depth'].sum() *100000)
        df_v2['Chr']=chrom
        chr_dfs[file_name+chrom]=df_v2
    pd.concat(list(chr_dfs.values())).to_csv(file_name,index=True)
