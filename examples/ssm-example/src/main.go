package main

import (
	"github.com/aws/aws-lambda-go/lambda"
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
)

func handler() {
	config := NewConfig()
	session.NewSession(&aws.Config{
		Region: config.Region},
	)
}

func main() {
	lambda.Start(handler)
}
