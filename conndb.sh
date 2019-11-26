# https://github.com/a18marjusfer/projecte03
#!/bin/bash
nomscript=$0   # $0 es el nom del programa
usage() {
cat <<EOF
Usage: nomscript [-u usuari] [-h hostname] [-t]
   -u   usuari de la base de dades (obligatori)
   -h   hostname on es connectarà (obligatori
   -p   port (no obligatori ja que per defecte és 3306, però si existeix ha de ser un numero superior a 1024 i inferior o igual a 65535)
   -t   no es connecta,  només comprova connexió
EOF

}

numero=^-?[0-9]+([.][0-9]+)?$;

while getopts :u:h:p:t o; do
        case "$o" in
                u)
                        usuari=${OPTARG}
                        ;;
                h)
                        hostname=${OPTARG}
                        ;;
		p)
                        port=${OPTARG}
			if ! [ $pot =~ $numero  ] then
				usage
                        ;;
		t)
			t=${OPTARG}
			;;
                \?)
			echo "ERROR: Invalid option -$OPTARG"
                        usage
			exit 1 ;;
		:)
		        echo "ERROR: -$OPTARG requires an argument."
		        exit 1
  		        ;;
        esac
done

shift $((OPTIND-1))


if [[ "${UID}" -eq 0 ]]
then
        if [ ! -z "$usuari" ] 
        then
		echo "conndb.sh -u ${usuari}"
                if [ ! -z "$hostname" ]
                then
			echo "conndb.sh -u ${usuari} -h ${hostname}"
			if [ ! -z "$port"  ]
			then
				echo "conndb.sh -u ${usuari} -h ${hostname} -p ${port}"
			fi
                fi
	else
		usage
        fi

else
        echo 'No tienes los permisos necesarios.'
fi
