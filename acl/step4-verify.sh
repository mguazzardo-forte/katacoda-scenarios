OUT=$( getfacl /tmp/file1 | grep starbuck | cut -d: -f3 ) &&  [[ $OUT == rw- ]] && echo done