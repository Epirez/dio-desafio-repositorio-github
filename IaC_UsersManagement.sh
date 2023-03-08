#!/bin/bash

        echo "Criando diretórios..."
        sudo mkdir /publico /adm /ven /sec
        echo -e "\n"

        echo "Criando grupos..."
        groupadd GRP_ADM
        groupadd GRP_VEN
        groupadd GRP_SEC
        echo -e "\n"

#Os parâmetros:
# -c inserir comentários;
# -s /bin/bash define shell de logon;
# -m cria o diretório pessoal;
# -p $(openss1 passwd -1 <senha>) senha criptografada;
# -G adiciona usuário no grupo.
 
        echo "Criano usuários e definindo seus respectivos grupos..."

#Grupo adm:
        useradd carlos -c "Carlso de Oliveira" -s /bin/bash -m -p $(openssl passwd -1 123456) -G GRP_ADM
        useradd maria -c "Maria da Silva" -s /bin/bash -m -p $(openssl passwd -1 123456) -G GRP_ADM
        useradd joao -c "João Pereira" -s /bin/bash -m -p $(openssl passwd -1 123456) -G GRP_ADM

#Grupo ven:

        useradd debora -c "Debora Martins da Silva" -s /bin/bash -m -p $(openssl passwd -1 123456) -G GRP_VEN
        useradd sebastiana -c "Sebastiana Sampaio" -s /bin/bash -m -p $(openssl passwd -1 123456) -G GRP_VEN
        useradd robeto -c "Roberto Felicio" -s /bin/bash -m -p $(openssl passwd -1 123456) -G GRP_VEN

#Grupo sec:
        useradd josefina -c "Josefina Silveira" -s /bin/bash -m -p $(openssl passwd -1 123456) -G GRP_SEC
        useradd amanda -c "Amanda do Carmo" -s /bin/bash -m -p $(openssl passwd -1 123456) -G GRP_SEC
	echo -e "\n"

        echo "Definindo permissões..."
#O dono de todos diretórios criados será o root;
        chown root:GRP_ADM /adm
        chown root:GRP_VEN /ven
        chown root:GRP_SEC /sec

#Todos usuários terão permissão total dentro do diretório público;
        chmod 777 /publico

#Os usuários de cada grupo terão permissão total dentro do seu respectivo diretório;e não poderão ter permissão de leitura, escrita e execução em diretórios de departamento>
        chmod 770 /adm
        chmod 770 /ven
        chmod 770 /sec
        echo -e "\n"
        echo "Concluído!!"
