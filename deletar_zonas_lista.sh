#!/bin/bash
#---------------------------------------
#  Arquivo: deletar_zonas_lista.sh
#
#  Descrição: script Shell para deletar os diretorios no Hadoop HDFS a partir de uma lista de diretorios definida em um arquivo.
#  Parametros:
#      $1: arquivo com os diretórios que serão deletados.
#  Autor: Tiago Rodrigues Lopes dos Santos
#  Data de criacao: 30/04/2019

#variavel para guardar o nome do arquivo informado pelo usuário.
file=$1

#loop para percorrer cada linha do arquivo passado como parametro e executar o comando hadoop de deletar um diretório.
while IFS= read line
do
   #comando para testar se o diretório existe ou não.
   sudo -u hdfs hdfs dfs -test -d $line
   #if para testar se o diretório existe.
   if [ $? == 0 ]
   then
	sudo -u hdfs hdfs dfs -rm -R "$line"
	echo "Diretório $line deletado com sucesso!!"
   else
	echo "Diretório $line não existe."
   fi

done < "$file"
