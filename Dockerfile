FROM golang:1.23.5

WORKDIR /usr/src/jobportal
COPY go.mod go.mod
COPY go.sum go.sum
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 go build -o app ./cmd

CMD ["/usr/src/jobportal/app"]
