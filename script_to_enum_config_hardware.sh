#sudo lshw | grep memory -C 4
#sudo lshw | grep description
#sudo lshw | grep cpu -C 2
sudo lshw > info_hardware.txt
grep "memory" -A 4  info_hardware.txt | head -n 5 > ram.txt
grep "cpu" -A 2 info_hardware.txt  > cpu.txt
grep "product" cpu.txt > cpu2.txt 

grep "description" -A 2 info_hardware.txt | head -n 3 | cut -d":" -f1,2  > computer_name_and_brand.txt

cat computer_name_and_brand.txt
echo "Computer name : $(hostname)"
echo "Memory (RAM) :"  $(cat ram.txt | grep size -C 0 | head -n 2) 
echo "cpu : "  $(cat cpu2.txt)

#cat info_hardware.txt | grep cpu  -A 2 | tee cpu.txt
#cat ram.txt



#cat cpu.txt


rm ram.txt
rm cpu.txt
rm cpu2.txt
rm computer_name_and_brand.txt
rm info_hardware.txt
