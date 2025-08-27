make grid_clean
ls
sbatch tailored.loki 
tailR
sqme
scancel 157205
ls
make grid_clean
ls
vim input.inp 
sbatch tailored.loki 
tailR
vim mix_simple.inp 
ls
make grid_clean
ls
cp mix* simple.* input.inp tailored.loki $stef/test/.
pushd
cd test/
ls
clean_back.sh 
mv input.inp tailored.loki cyl-tailor/
mv simple.inp simple.loki cyl/
mkdir cyl-mix
mv mix* cyl-mix/
ls
cd cyl
ls
mv simple.inp input.inp 
mv simple.loki submit.loki 
diff submit.loki submit.loki.backup 
vim submit.loki
ls
diff input.inp input.inp.backup 
rm input.inp.backup 
ls
cp *.scr ../cyl-mix/
..
ls
cd cyl-tailor/
ls
mv tailored.loki submit.loki 
vim submit.loki
diff submit.loki submit.loki.backup 
clean_back.sh 
ls
cd ../cyl-mix/
ls
ls ../cyl
cp ../cyl/Makefile .
ls
ls ../cyl
cp ../cyl/Gas-Park .
ls
mv mix.loki submit.loki
mv mix_simple.inp input.inp
vim submit.loki 
ls
..
ls
clean_back.sh 
ls
..
ls
sq
sinfop
exit
cd sphere-cone/test/park/stefan-tests/
pushd /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell
stef="/project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell"
ls
us3d_load loki
pushd
ls
cd cyl/
ls
sbatch mix.loki 
sqme
vim RUN.stdout 
vim RUN.stderr 
pushd
ls
make clean
make
pushd
ls
make grid_clean
rm libus3d_user-general.so 
cp $stef/libus3d_user-general.so .
ls
sbatch mix.loki 
tailR
sqme
scancel 157214
ls
vim RUN.stderr 
pushd
make clean
make
pushd
ls
rm libus3d_user-general.so 
make grid_clean
cp $stef/libus3d_user-general.so .
ls
sbatch mix.loki 
tailR
pushd
make clean
make
pushd
ls
make grid_clean
ls
rm libus3d_user-general.so 
cp $stef/libus3d_user-general.so .
ls
sbatch mix.loki 
tailR
pushd
make clean
make
ls
pushd
make grid_clean
cp $stef/libus3d_user-general.so .
sbatch mix.loki 
tailR
vim RUN.stderr 
pushd
make clean
make
pushd
ls
make grid_clean
ls
rm libus3d_user-general.so*
cp $stef/libus3d_user-general.so .
ls
sbatch mix.loki 
tailR
vim mix_simple.inp 
make grid_clean
ls
rm libus3d_user-general.so 
pushd
make clean
make
ls
pushd
ls
cp $stef/libus3d_user-general.so .
ls
vim mix_simple.inp 
sbatch mix.loki 
tailR
ls
vim RUN.stderr 
make grid_clean
sbatch mix.loki 
ls
tailR
sq
vim mix_simple.inp 
vim simple.inp 
vim mix_simple.inp 
ls
vim mix_simple.inp 
ls
rm libus3d_user-general.so 
make grid_clean
ls
sbatch mix.loki 
tailR
sqme
scancel 157227
ls
make grid_clean
ls
cp $stef/libus3d_user-general.so .
sbatch mix.loki 
tailR
sqme
scancel 157229
make grid_clean
ls
vim mix_simple.inp 
sbatch mix.loki 
tailR
vim mix_simple.inp 
make grid_clean
sbatch mix.loki 
tailR
vim mix_simple.inp 
make grid_clean
ls
sbatch mix.loki 
tailR
vim mix_simple.inp 
make grid_clean
ls
sbatch mix.loki 
tailR
ls
cd ../cell-sym/
ls
rm libus3d_user-general.so 
vim simple.inp 
cp $stef/libus3d_user-general.so .
ls
sbatch simple.loki 
tailR
vim simple.loki 
vim simple.inp 
gnuplot resid.plt 
vim simple.inp 
ls
make grid_clean
sbatch simple.loki 
tailR
vim simple.inp 
vim RUN.stdout 
make grid_clean
ls
rm libus3d_user-general.so 
pushd
ls
make clean
make
ls
pushd
ls
cp $stef/libus3d_user-general.so .
ls
sbatch simple.loki 
tailR
rm libus3d_user-general.so 
ls
make grid_clean
pushd
ls
make clean
make
pushd
ls
cp $stef/libus3d_user-general.so .
ls
sbatch simple.loki 
tailR
ls
vim RUN.stderr 
make grid_clean
ls
rm libus3d_user-general.so 
pushd
ls
make
make clean
make
pushd
ls
cp $stef/libus3d_user-general.so .
make simple.loki 
tailR
sbatch simple.loki 
tailR
make grid_clean
rm libus3d_user-general.so 
pushd
make clean
make
ls
pushd
ls
cp $stef/libus3d_user-general.so .
sbatch simple.loki 
tailR
vim RUN.stderr 
cd sphere-cone/test/park/stefan-tests/cell-sym/
ls
pushd /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell
us3d_load loki
make clean
make
pushd
ls
make grid_clean
stef="/project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell"
cp $stef/libus3d_user-general.so .
ls
rm libus3d_user-general.so.backup 
sbatch simple.loki 
tailR
vim RUN.stdout 
make grid_clean
rm libus3d_user-general.so 
pushd
make clean
make
cd ../seans_plugin/
ls
cd src/
ls
vim seans_plugin.f08 
ls
..
ls
ls build/
vim build/built_plugin_code.f08 
ls
..
ls
cd seans_plugin/src/
vim seans_plugin.f08 
ls
..
ls
ls build/
..
ls
cd us3d-slip-wall/
ls
vim src/us3d_user-slip.f90 
cd ../us3d-stefan-maxwell/
vim ../us3d-slip-wall/src/us3d_user-slip.f90 
vim us3d_user_SM.f90 
pushd
ls
pushd
make clean
make
pushd
ls
cp $stef/libus3d_user-general.so .
sbatch simple.loki 
tailR
ls
vim primitives.stdout 
vim RUN.stderr 
vim RUN.stdout 
mkdir old
mv RUN.* primitives.stdout old/
ls
make grid_clean
mv libus3d_user-general.so old/
pushd
make clean
make
make clean
make
pushd
cp $stef/libus3d_user-general.so .
ls
sbatch simple.loki 
tailR
vim RUN.stderr 
cd old/
vim RUN.stderr 
..
pushd
make clean
make
make 
make
pushd
ls
make grid_clean
rm libus3d_user-general.so 
cp $stef/libus3d_user-general.so .
sbatch simple.loki 
tailR
vim RUN.stderr 
pushd
make clean
make
pushd
make grid_clean
rm libus3d_user-general.so 
cp $stef/libus3d_user-general.so .
sbatch simple.loki 
tailR
vim RUN.stderr 
ls
vim primitives.stdout 
vim RUN.stdout 
vim RUN.stderr 
pushd
make clean
make
pushd
ls
make grid_clean
rm libus3d_user-general.so 
cp $stef/libus3d_user-general.so .
sbatch simple.loki 
tailR
vim RUN.stderr 
pushd
make clean
make
pushd
ls
make grid_clean
ls
rm libus3d_user-general.so 
cp $stef/libus3d_user-general.so .
sbatch simple.loki 
tailR
vim primitives.stdout 
vim RUN.stderr 
vim primitives.stdout 
vim RUN.stdout 
pushd
make clean
make
pushd
make grid_clean
rm libus3d_user-general.so 
cp $stef/libus3d_user-general.so .
sbatch simple.loki 
tailR
vim RUN.stderr 
vim RUN.stdout 
vim primitives.stdout 
vim simple.inp 
pushd
make clean
make
pushd
ls
cd ../cyl/
ls
vim mix_simple.inp 
ls
vim mix_simple.inp 
ls
make grid_clean
ls
sbatch mix.loki 
tailR
sqme
tailR
tail -n 50 RUN.stdout 
vim simple.inp 
vim mix_simple.inp 
make grid_clean
ls
mkdir store
mv libus3d_user-general.so store/
ls
sbatch mix.loki 
tailR
gnuplot resid.plt 
vim mix_simple.inp 
make grid_clean
sbatch mix.loki 
tailR
gnuplot resid.plt 
vim mix_simple.inp 
tailR
tail -n 40 RUN.stdout 
gnuplot resid.plt 
vim mix_simple.inp 
make total_clean
ls
sbatch mix.loki 
tailR
gnuplot resid.plt 
tail -n 40 RUN.stdout 
tail -n 80 RUN.stdout 
vim mix_simple.inp 
make total_clean
sbatch mix.loki 
tailR
gnuplot resid.plt 
vim mix_simple.inp 
make total_clean
sbatch mix.loki 
gnuplot resid.plt 
vim mix_simple.inp 
make total_clean
sbatch mix.loki 
tailR
gnuplot resid.plt 
vim mix_simple.inp 
sqme
make total_clean
sbatch mix.loki 
tailR
gnuplot resid.plt 
sqme
vim mix_simple.inp 
make total_clean
sbatch mix.loki 
tailR
gnuplot resid.plt 
vim mix_simple.inp 
sbatch mix.loki 
gnuplot resid.plt 
vim mix_simple.inp 
make total_clean
ls
cp mix_simple.inp tmix_simple.inp 
cat input.inp 
vim tmix_simple.inp 
vim input.inp 
vim tmix_simple.inp 
ls
cp mix.loki tmix.loki
vim tmix.loki 
sbatch tmix.loki 
tailR
ls
..
pushd
ls
ls test/
pushd
ls
cp -r cyl/ cyl-mix
cp -r cyl cyl-tailor
cp -r cyl cyl-mix-tailor
cd cyl-mix-tailor/
ls
make grid_clean
ls
rm grid.h5.bak 
rm simple.* mix* input.inp tailored.loki 
ls
mv tmix.loki submit.loki
mv tmix_simple.inp input.inp
vim submit.loki 
ls
sqme
ls
cd ../cyl
gnuplot resid.plt 
cd ../cyl-mix-tailor/
vim input.inp 
sbatch submit.loki 
tailR
cd ../cyl-mix
make total_clean
ls
make grid_clean
rm grid.h5.bak 
ls
rm tailored.loki tmix* input.inp simple.*
ls
mv mix.loki submit.loki
mv mix_simple.inp input.inp
vim submit.loki 
ls
sbatch submit.loki 
cd ../cyl-mix-tailor/
gnuplot resid.plt 
cd ../cyl-tailor/
ls
make grid_clean
ls
rm grid.h5.bak mix* tmix* simple.*
mv tailored.loki submit.loki
vim submit.loki 
ls
..
ls
cd cyl-mix-tailor/
gnuplot resid.plt 
vim input.inp 
make grid_clean
sbatch submit.loki 
ls
vim submit.loki 
cd ../cyl-mix
vim input.inp 
cd ../cyl-tailor/
vim input.inp 
cd ../cyl-mix
gnuplot resid.plt 
ls
make grid_clean
ls
cd ../
ls
cd cyl
ls
make grid_clean
rm grid.h5.bak tmix* mix* tailored.loki input.inp 
ls
mv simple.loki submit.loki
mv simple.inp input.inp
vim submit.loki 
ls
cd ../cyl-tailor/
vim submit.loki 
cd ../cyl-mix
vim submit.loki 
cd ../cyl-mix-tailor/
vim submit.loki 
gnuplot resid.plt 
vim input.inp 
gnuplot resid.plt 
vim input.inp 
make total_clean
ls
sbatch submit.loki 
cd ../cyl-mix
vim input.inp 
ls
cd ../cyl
l
ls
vim input.inp 
cd ../cell-sym/
ls
make grid_clean
ls
mv simple.inp input.inp
mv simple.loki submit.loki
vim submit.loki 
ls
..
rm -r cell-wall/
cp -r cell-sym/ cell-sym-mix
cd cell-sym-mix/
ls
vim ../cyl-mix/input.inp 
vim input.inp 
vim ../cyl-mix/input.inp 
vim input.inp 
ls
cd ../cyl-mix-tailor/
gnuplot resid.plt 
vim input.inp 
make total_clean
sbatch submit.loki 
vim input.inp 
vim ../cyl-mix/input.inp 
vim ../cyl/input.inp 
vim ../cyl-tailor/input.inp 
ls
..
ls
cd cell-sym-mix/
ls
vim input.inp 
vim ../cell-sym/input.inp 
ls
vim input.inp 
cd ../cyl-mix-tailor/
gnuplot resid.plt 
sqme
scancel 157318
vim input.inp 
ls
make total_clean
make grid_clean
ls
rm grid.h5.bak 
rm Gas-Park 
ls
sbatch submit.loki 
cd ../cyl-mix
ls
rm Gas-Park 
cd ../cell-sym-mix/
ls
rm Gas-Park 
ls
cd ../cyl-mix-tailor/
ls
gnuplot resid.plt 
vim input.inp 
gnuplot resid.plt 
vim input.inp 
gnuplot resid.plt 
vim input.inp 
make grid_clean
ls
sbatch submit.loki 
gnuplot resid.plt 
ls
tailR
vim input.inp 
make clean
ls
make grid_clean
rm data.h5.old 
ls
sbatch submit.loki 
gnuplot resid.plt 
vim input.inp 
gnuplot resid.plt 
vim input.inp 
gnuplot resid.plt 
vim input.inp 
sqme
gnuplot resid.plt 
vim input.inp 
make grid_clean
ls
sbatch submit.loki 
gnuplot resid.plt 
vim input.inp 
gnuplot resid.plt 
vim input.inp 
ls
make grid_clean
ls
sbatch submit.loki 
gnuplot resid.plt 
cd ../cell-sym-mix/
ls
sbatch submit.loki 
taiLR
tailR
vim submit.loki 
make grid_clean
ls
sbatch submit.loki 
tailR
vim input.inp 
vim ../cyl-mix/input.inp 
vim input.inp 
ls
make grid_clean
ls
sbatch submit.loki 
tailR
vim RUN.stderr 
vim primitives.stdout 
ls
rm libus3d_user-general.so 
pushd
make clean
make
pushd
ls
make grid_clean
cp $stef/libus3d_user-general.so .
ls
vim input.inp 
sbatch submit.loki 
tailR
vim input.inp 
ls
cd ../cyl-mix-tailor/
gnuplot resid.plt 
vim input.inp 
ls
make grid_clean
ls
cd ../cell-sym-mix/
ls
rm libus3d_user-general.so 
make grid_clean
vim input.inp 
sbatch submit.loki 
tailR
gnuplot resid.plt 
make grid_clean
vim input.inp 
ls
cp $stef/libus3d_user-general.so .
ls
cd ../cyl-mix-tailor/
ls
vim input.inp 
exit
cd sphere-cone/test/park/stefan-tests/
pushd /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell
ls
stef="/project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell"
pushd
ls
pushd
ls
cd test/
ls
pushd
ls
rsw cell-sym /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell/test/
ls
rsw cell-sym-mix /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell/test/
ls
rsw cyl /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell/test/
rsw cyl-mix /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell/test/
rsw cyl-tailor /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell/test/
rsw cyl-mix-tailor /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell/test/
pushd
ls
cd cell-sym
ls
rm libus3d_user-general.so 
rm -r old/
clean_back.sh 
ls
cd ../cell-sym-mix/
ls
rm libus3d_user-general.so
rm -r old/
ls
..
cd cyl
ls
clean_back.sh 
rm -r store/
ls
cd ../cyl-mix
l
sls
ls
rm Gas-Park 
clean_back.sh 
ls
rm -r store/
ls
vim submit.loki 
cd ../cyl-tailor/
ls
clean_back.sh 
ls
rm -r store/
ls
vim submit.loki 
cd ../cyl-mix-tailor/
ls
rm -r store/
..
ls
ls *
cd cell-sym
rm primitives.stdout 
cd ../cell-sym-mix/
rm primitives.stdout 
..
ls
pushd
ls
vim Makefile 
cd cyl-tailor/
ls
cd sphere-cone/test/park/stefan-tests/
pushd /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell/test
ls
..
ls
make clean
make
us3d_load loki
make
vim test/cyl/Makefile 
ls
make clean
make
make clean
make
make clean
make debug
make clean
make vhs
make clean
ls
make 
sq
exit
pushd $COMMON
ls $COMMON
exit
cd sphere-cone/test/park/
ls
cp -r /project/cranf014/PROJECTS/sphere-cone/RUNDIRS/from_sean/ .
cd from_sean/park/
ls
cd 40km/
ls
vim input.inp 
cp input.inp origin.inp
vim input.inp 
vim origin.inp 
vim input.inp 
vim ../../../stefan-tests/opts/input-blocks/verbose.inp 
ls
sbatch submit.loki 
tailR
pushd /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell
ls
pushd
tail -n 50 RUN.stdout 
vim input.inp 
ls
cp /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell/libus3d_user-general.so 
cp /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell/libus3d_user-general.so .
ls
sbatch submit.loki 
tailR
vim RUN.stderr 
ls
vim primitives.stdout 
vim RUN.stdout 
ls
..
ls
..
ls
..
ls
..
ls
sq
exit
pushd /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell
ls
make clean
us3d_load loki
make
ls
pushd
ls
cd sphere-cone/test/park/stefan-tests/cell-sym
ls
rm libus3d_user-general.so 
cp /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell/libus3d_user-general.so .
ls
rm primitives.stdout 
sbatch submit.loki 
tailR
vim primitives.stdout 
make grid_clean
ls
rm primitives.stdout 
rm libus3d_user-general.so 
pushd
make clean
make
pushd
ls
cp /project/cranf014/local/codes/us3d-files/plugins/src-files/src/us3d-stefan-maxwell/libus3d_user-general.so .
ls
sbatch submit.loki 
tailR
vim primitives.stdout 
vim RUN.stdout 
vim primitives.stdout 
gnuplot resid.plt 
vim RUN.stdout 
ls
make grid_clean
ls
rm primitives.stdout 
exit
ls
cd sphere-cone/test/park/from_sean/
ls
cd park/
ls
cd 40km/
ls
vim RUN.stdout 
vim input.inp 
cd ../75km/
ls
cp ../40km/libus3d_user-general.so .
vim input.inp
ls
sbatch submit.loki 
tailR
vim RUN.stderr 
vim RUN.stdout 
ls
make total_clean
ls
..
ls
..
ls
..
ls
cd stefan-tests/cyl
ls
cp store/libus3d_user-general.so .
vim input.inp 
sbatch submit.loki 
tailR
ls
us3d_load loki
us3d-postpar --defaults --script=post-nan.scr
ls
make total_clean
ls
exit
pwd
source .bashrc
sq
sinfo
cd
ls
la
vim .nfs00000000000002a300000154 
exit
