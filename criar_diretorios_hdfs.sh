#!/bin/bash
#---------------------------------------
#  Arquivo: criar_diretorios_hdfs.sh
#
#  Descrição: script Shell para criar os diretorios  no Hadoop HDFS.
#  Parametros: 
#      $1($*): lista de diretorios para serem criados.
#  Autor: Tiago Rodrigues Lopes dos Santos
#  Data de criacao: 17/04/2019

#variavel para armazenar a lista de diretorios a serem criados.
zonas=($*)

#variavel para guardar a quantidade de diretorios a serem criados.
qtdZonas=${#zonas[@]}

#variavel para guardar a contagem de loops feita pelo comando  while.
pos=0

#comando while para execucao de loop.
while [ $pos != $qtdZonas ]
do
  #comando para testar se um diretório existe ou não.
  sudo -u hdfs hadoop fs -test -d ${zonas[$pos]}
  #if para testar se o diretório não existe.
  if [ $? != 0 ]
  then
     #comando para criar o diretorio no Hadoop HDFS.
     sudo -u hdfs  hadoop fs -mkdir -p ${zonas[$pos]}
     echo "Diretorio ${zonas[$pos]} criado com sucesso!"
  fi
  #comando para incrementar a variavel de contagem.
  pos=$(( $pos + 1 ))

done

  echo "Programa finalizado com sucesso!"
