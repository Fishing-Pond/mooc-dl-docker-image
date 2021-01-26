FROM python:3
RUN apt-get update \
    && apt-get install git ffmpeg sed -y \
    && git clone https://github.com/SigureMo/mooc-dl.git /mooc-dl \
    && sed -i 's/\"\"/download\//g' mooc-dl/config.json \
    && sed -i 's/false/true/g' mooc-dl/config.json
RUN cd mooc-dl \
    && pip install -r requirements.txt
WORKDIR /mooc-dl
ENTRYPOINT [ "python mooc-dl.py" ]
CMD [ "https://www.icourse163.org/course/ZJU-93001?tid=1003997005" ]