package main

import (
	"fmt"
	"github.com/aws/aws-sdk-go/aws"
	"os"
)

type Config struct {
	Region     *string
	DbPassword *string
}

func NewConfig() *Config {
	return &Config{
		Region:     getEnv("REGION"),
		DbPassword: getEnv("DB_PASSWORD"),
	}
}

func getEnv(key string) *string {
	v := aws.String(os.Getenv(key))
	if len(*v) == 0 {
		exitErrorf("missing env variable: %s\n", key)
	}
	fmt.Println(key, aws.StringValue(v))
	return v
}

func exitErrorf(msg string, args ...interface{}) {
	fmt.Fprintf(os.Stderr, msg+"\n", args...)
	os.Exit(1)
}
