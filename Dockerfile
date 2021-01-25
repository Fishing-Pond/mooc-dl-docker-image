FROM python:3
RUN apt-get update \
    && apt-get install git ffmpeg sed -y \
    && git clone https://github.com/SigureMo/mooc-dl.git \
    && sed -i 's/base_dir/\/download\//g' mooc-dl/config.json \
    && sed -i 's/false/true/g' mooc-dl/config.json
RUN cd mooc-dl \
    && pip install -r requirements.txt
ENTRYPOINT [ "python mooc-dl/mooc-dl.py" ]
CMD [ "https://www.icourse163.org/course/ZJU-93001?tid=1003997005" ]