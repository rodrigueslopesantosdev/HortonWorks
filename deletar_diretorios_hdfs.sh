#!/bin/bash
#---------------------------------------
#  Arquivo: deletar_diretorios_hdfs.sh
#
#  Descrição: script Shell para apagar diretorios  no Hadoop HDFS.
#  Parametros: 
#      $1($*): lista de diretorios para serem deletados.
#  Autor: Tiago Rodrigues Lopes dos Santos
#  Data de criacao: 17/04/2019


#variavel para armazenar a lista de diretorios a serem deletados.
zonas=($*)

#variavel para guardar a quantidade de diretorios a serem deletados.
qtdZonas=${#zonas[@]}

#variavel para guardar a contagem de loops feita pelo comando  while.
pos=0

#comando while para execucao de loop.
while [ $pos -ne $qtdZonas ]
do

   #comando para testar se o diretorio existe ou não.
   sudo -u hdfs hadoop fs -test -d ${zonas[$pos]}
   #if para testar se o diretorio existe
   if [ $? == 0 ]
   then
     #comando para deletar o diretorio no Hadoop HDFS.
     sudo -u hdfs hadoop fs -rm -R ${zonas[$pos]}
     echo "Diretorio ${zonas[$pos]} deletado com sucesso!!"
   else
     echo "Diretorio ${zonas[$pos]} não existe."
   fi
  #comando para incrementar a variavel de contagem.
  pos=$(( $pos + 1 ))

done

  echo "Programa finalizado com sucesso!"
