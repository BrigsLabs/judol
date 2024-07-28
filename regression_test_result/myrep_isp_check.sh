#!/bin/bash
START=$(date +%s)
TIMESTAMP=`date -u +"%Y-%m-%d %T"`
PARENTDIR="$(dirname "$(pwd)")"
FILE1="judol_myrepublik_query.txt"
FILE2="judol_biznet_query.txt"
FILE3="judol_indihome_query.txt"
echo "# Title: Regression dns query test against local ISP" > $FILE1
echo "# Homepage: https://github.com/BrigsLabs/judol " >> $FILE1
echo "# Issues: https://github.com/BrigsLabs/judol/issues " >> $FILE1
echo "# Expires: 30 days " >> $FILE1
echo "# TIME :" $TIMESTAMP >> $FILE1
echo ' ' >> $FILE1
dig @192.168.254.254 +noall +answer +comments +timeout=10 +tries=5 -f $PARENTDIR/judol_domains.txt >> $FILE1
echo ' '>> $FILE1
BLOCK=`grep -wc "158.140.186.3" $FILE1`
NX=`grep -wc "NXDOMAIN" $FILE1`
FAIL=`grep -wc "SERVFAIL" $FILE1`
echo "# Counted Result " >> $FILE1
echo ' ' >> $FILE1
echo "BLOCK         : $BLOCK" >> $FILE1
echo "NX            : $NX" >> $FILE1
echo "FAIL          : $FAIL" >> $FILE1
END=$(date +%s)
echo "Time consumed : $(($END-$START)) seconds" >> $FILE1
