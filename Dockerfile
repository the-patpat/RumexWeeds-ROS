FROM rumexweeds_ros:melodic-desktop-full-bionic

#Copy the yolor folder, including weights
COPY ./yolor /yolor
COPY best_ap.pt /yolor/best_ap.pt

COPY ./RumexWeeds /rumexweeds_github

RUN apt update && apt upgrade -q -y

RUN apt install -q -y vim

#RUN apt install python3.7 -q -y

RUN pip3 install --upgrade pip && pip install setuptools && pip install cython && pip install -r /yolor/requirements.txt

RUN pip3 install fiftyone




