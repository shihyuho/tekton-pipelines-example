JAVA_VERSION=11
BOOT_VERSION=2.4.1.RELEASE
BASE_DIR=_example

downloadSource() {
  echo "Downloading spring-boot $BOOT_VERSION for Java $JAVA_VERSION"
  curl https://start.spring.io/starter.zip \
    -d javaVersion=$JAVA_VERSION \
    -d bootVersion=$BOOT_VERSION \
    -d baseDir=$BASE_DIR \
    -d groupId=com.github.shihyuho \
    -d artifactId=tekton-pipelines-example \
    -d dependencies=web,actuator \
    -o example.zip
}

decompress() {
  unzip -o example.zip
  rm example.zip
}

# fail_trap is executed if an error occurs.
fail_trap() {
  exit $?
}

trap "fail_trap" EXIT
set -e
downloadSource
decompress