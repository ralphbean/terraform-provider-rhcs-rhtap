package e2e

import (
	. "github.com/onsi/ginkgo/v2"
	. "github.com/onsi/gomega"
	CI "github.com/terraform-redhat/terraform-provider-rhcs/tests/ci"
)

var region = "us-west-2"

var _ = Describe("TF Test", func() {
	Describe("Create cluster test", func() {
		It("CreateClusterByProfile", CI.Day1Prepare,
			func() {

				// Generate/build cluster by profile selected
				profile := CI.LoadProfileYamlFileByENV()
				clusterID, err := CI.CreateRHCSClusterByProfile(token, profile)
				Expect(err).ToNot(HaveOccurred())
				Expect(clusterID).ToNot(BeEmpty())
			})
	})
})
