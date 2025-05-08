package test

import (
	"testing"
	"os"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformS3(t *testing.T) {
	os.Setenv("AWS_REGION", "us-east-1")
	os.Setenv("AWS_ACCESS_KEY_ID", "test")
	os.Setenv("AWS_SECRET_ACCESS_KEY", "test")
	os.Setenv("AWS_ENDPOINT_URL", "http://localhost:4566")

	opts := &terraform.Options{
		TerraformDir: "../../terraform",
		Vars: map[string]interface{}{
			"bucket_name": "terratest-bucket",
		},
		EnvVars: map[string]string{
			"AWS_REGION": "us-east-1",
		},
	}

	defer terraform.Destroy(t, opts)

	terraform.InitAndApply(t, opts)

	bucket := terraform.Output(t, opts, "bucket_name")
	assert.Equal(t, "terratest-bucket", bucket)
}
