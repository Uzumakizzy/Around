# Lightweight alpine OS, weight only 5mb, everything else is Go # # environment
# Define the system and language environment
FROM golang:1.11.5

# Dockerfile can predefine environment variables


# Define working directory
WORKDIR /go/src/github.com/Uzumakizzy/around

# Add files from your laptop to WORKDIR inside the docker image
# '.' means all the files under current directory
ADD . /go/src/github.com/Uzumakizzy/around

# Install dependencies
RUN go get -v \
cloud.google.com/go/bigtable \
cloud.google.com/go/storage \
github.com/auth0/go-jwt-middleware \
github.com/dgrijalva/jwt-go \
github.com/go-redis/redis \
github.com/gorilla/mux \
github.com/olivere/elastic \
github.com/pborman/uuid \
github.com/pkg/errors \
golang.org/x/oauth2/google

# Expose port
# the port inside the docker
EXPOSE 8080

# Entrypoint
CMD ["/usr/local/go/bin/go", "run", "user.go", "ml.go", "main.go"]
