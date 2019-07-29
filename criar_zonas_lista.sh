#!/bin/bash
#---------------------------------------
#  Arquivo: criar_zonas_lista.sh
#
#  Descrição: script Shell para criar os diretorios no Hadoop HDFS a partir de uma lista de diretorios definida em um arquivo.
#  Parametros:
#      $1: arquivo com os diretórios que serão criados.
#  Autor: Tiago Rodrigues Lopes dos Santos
#  Data de criacao: 30/04/2019

#variavel para guardar o nome do arquivo informado pelo usuário.
file=$1

#loop para percorrer cada linha do arquivo passado como parametro e executar o comando hadoop de criar um diretório.
while IFS= read line
do

  #comando para testar se o diretório existe ou não.
  sudo -u hdfs hadoop fs -test -df $line 
  #if para testar se o diretório não existe.
  if [ $? != 0 ]
   then
	sudo -u hdfs hadoop fs -mkdir -p "$line"
	echo "Diretório $line criado com sucesso!!"
   else
	echo "Diretório $line já existe"
   fi

done < "$file"
