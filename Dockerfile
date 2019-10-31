ARG TF_VERSION=1.15.0

FROM tensorflow/tensorflow:${TF_VERSION}-py3
LABEL maintainer="egor-jerome.akhanov@zenika.com"
WORKDIR /opt/face_recognition
COPY requirements.txt setup.sh ./
RUN /bin/bash setup.sh

# now we can copy Python files so that code modification will not cause a full build
COPY . .
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["-m", "api.server"]
