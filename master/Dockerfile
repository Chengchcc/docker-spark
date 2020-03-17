FROM ubuntu:18.04
LABEL MAINTAINER=chen@theoan.com

# install basic dependence
ADD dependence-install.sh dependence-install.sh

RUN ./dependence-install.sh

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

ENV PATH $JAVA_HOME/bin:$PATH

WORKDIR /root/


# 下载spark
ENV SPARK_HOME=/root/spark-2.3.4-bin-hadoop2.6/
ENV PATH $SPARK_HOME/bin:$PATH



RUN wget -c https://mirrors.tuna.tsinghua.edu.cn/apache/spark/spark-2.3.4/spark-2.3.4-bin-hadoop2.6.tgz \
    && tar zxvf spark-2.3.4-bin-hadoop2.6.tgz  \
    && rm -rf spark-2.3.4-bin-hadoop2.6.tgz \
    && mv $SPARK_HOME/conf/spark-env.sh.template  $SPARK_HOME/conf/spark-env.sh \
    && echo "JAVA_HOME=$JAVA_HOME\nexport SPARK_LOCAL_HOST=0.0.0.0\nexport SPARK_MASTER_HOST=0.0.0.0" >> $SPARK_HOME/conf/spark-env.sh

# 配置 ssh

RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa

RUN  cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys \
    && mkdir /run/sshd \
    && echo "StrictHostKeyChecking no\nUserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config

ADD start-pseudo-distributed.sh start-pseudo-distributed.sh

EXPOSE  7077
EXPOSE  8081
EXPOSE  8080

CMD ./start-pseudo-distributed.sh

