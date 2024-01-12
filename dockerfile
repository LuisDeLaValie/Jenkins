FROM ghcr.io/cirruslabs/flutter:3.13.0

ARG JENKINS_ARG_URL=<URL_de_Jenkins>
ARG JENKINS_ARG_AGENT_NAME=<Nombre_del_agente>
ARG JENKINS_ARG_AGENT_WORKDIR=<Directorio_de_trabajo_del_agente>
ARG JENKINS_ARG_SECRET=<Clave_secreta>

# Instala dependencias necesarias para el agente Jenkins
RUN apt-get update && apt-get install -y openjdk-8-jdk wget git curl

# Configura las variables de entorno para el agente Jenkins
ENV JENKINS_URL=${JENKINS_ARG_URL}
ENV JENKINS_AGENT_NAME=${JENKINS_ARG_AGENT_NAME}
ENV JENKINS_AGENT_WORKDIR=${JENKINS_ARG_AGENT_WORKDIR}
ENV JENKINS_SECRET=${JENKINS_ARG_SECRET}


# Descarga el agente Jenkins
RUN echo ${JENKINS_URL}
RUN curl -sO ${JENKINS_URL}/jnlpJars/agent.jar

# Define el directorio de trabajo
WORKDIR ${JENKINS_AGENT_WORKDIR}

CMD java -jar agent.jar -jnlpUrl ${JENKINS_URL}/computer/${JENKINS_AGENT_NAME}/jenkins-agent.jnlp -secret ${JENKINS_SECRET} -workDir "${JENKINS_AGENT_WORKDIR}"

