kubectl create secret generic -n puppet puppetdb-keys --from-file=ca.pem --from-file=private.pem --from-file=public.pem
