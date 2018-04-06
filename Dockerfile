# ---- Black Duck Scan ----
# Conduct a Black Duck scan based on requirements
FROM openjdk:8-jre as blackduck
COPY . /app
COPY --from=python:3.6 / /
RUN cd ../ && \
    mkdir detect-download && \
    cd detect-download && \
    cd ../
ADD https://test-repo.blackducksoftware.com/artifactory/bds-integrations-release/com/blackducksoftware/integration/hub-detect/3.0.1/hub-detect-3.0.1.jar /detect-download
WORKDIR /app
RUN pip install -r requirements.txt && \
    java -jar ../detect-download/hub-detect-3.0.1.jar --blackduck.hub.url=https://huburl.com --blackduck.hub.username=test --blackduck.hub.password=test --detect.pip.requirements.path=requirements.txt --detect.project.name="python-deps"

# ---- Release Image ----
# Will not reach this step if policy violations fail
# Will create final image based off of below
# No dependencies from previous step will be included
FROM python:3.6 as release
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
