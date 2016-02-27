#!/bin/bash

server=$(cat server.txt)

traffic=$(cat ip-field.txt | wc -l)

if [ $traffic == 0 ]; then
	exit 0
else

awk 'NR==FNR{_[$1];next}$1 in _' server.txt ip-field.txt | awk -v h=$server '{if ($1 == h) print $0;}' | cut -f 2 | sort | uniq > incoming.txt

IP_COUNT=$(cat incoming.txt | wc -l)

TOT_TCP=$(cat ip-field.txt | awk -v s=$server '{if ($1 == s) print $0;}' | cut -f 4 | grep "TCP" | wc -l)

AVE_TCP_COUNT=$(($TOT_TCP/$IP_COUNT))

TOT_UDP=$(cat ip-field.txt | awk -v s=$server '{if ($1 == s) print $0;}' | cut -f 4 | grep "UDP" | wc -l)

AVE_UDP_COUNT=$(($TOT_UDP/$IP_COUNT))

TOT_ICMP=$(cat ip-field.txt | awk -v s=$server '{if ($1 == s) print $0;}' | cut -f 4 | grep "ICMP" | wc -l)

AVE_ICMP_COUNT=$(($TOT_ICMP/$IP_COUNT))

TOT_OTH=$(cat ip-field.txt | awk -v s=$server '{if ($1 == s) print $0;}' | cut -f 4 | grep "OTHER" | wc -l)

AVE_OTH_COUNT=$(($TOT_OTH/$IP_COUNT))


TOT_TCP_BYTES_IN=$(cat ip-field.txt | awk -v s=$server '{if ($1 == s) print $0;}' | cut -f 3,4 | grep "TCP" | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

AVE_TCP_BYTES_IN=$(($TOT_TCP_BYTES_IN/$IP_COUNT))

TOT_UDP_BYTES_IN=$(cat ip-field.txt | awk -v s=$server '{if ($1 == s) print $0;}' | cut -f 3,4 | grep "UDP" | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

AVE_UDP_BYTES_IN=$(($TOT_UDP_BYTES_IN/$IP_COUNT))

TOT_ICMP_BYTES_IN=$(cat ip-field.txt | awk -v s=$server '{if ($1 == s) print $0;}' | cut -f 3,4 | grep "ICMP" | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

AVE_ICMP_BYTES_IN=$(($TOT_ICMP_BYTES_IN/$IP_COUNT))

TOT_OTH_BYTES_IN=$(cat ip-field.txt | awk -v s=$server '{if ($1 == s) print $0;}' | cut -f 3,4 | grep "OTHER" | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

AVE_OTH_BYTES_IN=$(($TOT_OTH_BYTES_IN/$IP_COUNT))


TOT_TCP_BYTES_OUT=$(cat ip-field.txt | awk -v s=$server '{if ($2 == s) print $0;}' | cut -f 3,4 | grep "TCP" | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

AVE_TCP_BYTES_OUT=$(($TOT_TCP_BYTES_OUT/$IP_COUNT))

TOT_UDP_BYTES_OUT=$(cat ip-field.txt | awk -v s=$server '{if ($2 == s) print $0;}' | cut -f 3,4 | grep "UDP" | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

AVE_UDP_BYTES_OUT=$(($TOT_UDP_BYTES_OUT/$IP_COUNT))

TOT_ICMP_BYTES_OUT=$(cat ip-field.txt | awk -v s=$server '{if ($2 == s) print $0;}' | cut -f 3,4 | grep "ICMP" | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

AVE_ICMP_BYTES_OUT=$(($TOT_ICMP_BYTES_OUT/$IP_COUNT))

TOT_OTH_BYTES_OUT=$(cat ip-field.txt | awk -v s=$server '{if ($2 == s) print $0;}' | cut -f 3,4 | grep "OTHER" | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

AVE_OTH_BYTES_OUT=$(($TOT_OTH_BYTES_OUT/$IP_COUNT))


while read line
do
        host=$line

		TCP_COUNT=$(cat ip-field.txt | awk -v h=$host -v s=$server '{if ($2 == h && $1 == s) print $0;}' | cut -f 2,3- | grep "TCP" | wc -l)

		UDP_COUNT=$(cat ip-field.txt | awk -v h=$host -v s=$server '{if ($2 == h && $1 == s) print $0;}' | cut -f 2,3- | grep "UDP" | wc -l)

		ICMP_COUNT=$(cat ip-field.txt | awk -v h=$host -v s=$server '{if ($2 == h && $1 == s) print $0;}' | cut -f 2,3- | grep "ICMP" | wc -l)  
		
		OTH_COUNT=$(cat ip-field.txt | awk -v h=$host -v s=$server '{if ($2 == h && $1 == s) print $0;}' | cut -f 2,3- | grep "OTHER" | wc -l)


		TCP_BYTES_IN=$(cat ip-field.txt | awk -v h=$host -v s=$server '{if ($2 == h && $1 == s) print $0;}' | cut -f 2,3- | grep "TCP" | cut -f 2 | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

		UDP_BYTES_IN=$(cat ip-field.txt | awk -v h=$host -v s=$server '{if ($2 == h && $1 == s) print $0;}' | cut -f 2,3- | grep "UDP" | cut -f 2 | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

		ICMP_BYTES_IN=$(cat ip-field.txt | awk -v h=$host -v s=$server '{if ($2 == h && $1 == s) print $0;}' | cut -f 2,3- | grep "ICMP" | cut -f 2 | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

		OTH_BYTES_IN=$(cat ip-field.txt | awk -v h=$host -v s=$server '{if ($2 == h && $1 == s) print $0;}' | cut -f 2,3- | grep "OTHER" | cut -f 2 | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}') 


		TCP_BYTES_OUT=$(cat ip-field.txt | awk -v h=$host -v s=$server '{if ($1 == h && $2 == s) print $0;}' | cut -f 3- | grep "TCP" | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

		UDP_BYTES_OUT=$(cat ip-field.txt | awk -v h=$host -v s=$server '{if ($1 == h && $2 == s) print $0;}' | cut -f 3- | grep "UDP" | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

		ICMP_BYTES_OUT=$(cat ip-field.txt | awk -v h=$host -v s=$server '{if ($1 == h && $2 == s) print $0;}' | cut -f 3- | grep "ICMP" | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')

		OTH_BYTES_OUT=$(cat ip-field.txt | awk -v h=$host -v s=$server '{if ($1 == h && $2 == s) print $0;}' | cut -f 3- | grep "OTHER" | awk '{ sum += $1 }; END {if (sum==0 || sum==" ") print 0; else print sum}')


echo "$host " "$TCP_COUNT " "$AVE_TCP_COUNT " "$UDP_COUNT " "$AVE_UDP_COUNT " "$ICMP_COUNT " "$AVE_ICMP_COUNT " "$OTH_COUNT " "$AVE_OTH_COUNT " "$TCP_BYTES_IN " "$AVE_TCP_BYTES_IN " "$UDP_BYTES_IN " "$AVE_UDP_BYTES_IN " "$ICMP_BYTES_IN " "$AVE_ICMP_BYTES_IN " "$OTH_BYTES_IN " "$AVE_OTH_BYTES_IN " "$TCP_BYTES_OUT " "$AVE_TCP_BYTES_OUT " "$UDP_BYTES_OUT " "$AVE_UDP_BYTES_OUT " "$ICMP_BYTES_OUT " "$AVE_ICMP_BYTES_OUT " "$OTH_BYTES_OUT " "$AVE_OTH_BYTES_OUT" >> traffic-features.txt


done < incoming.txt

fi

exit 0
