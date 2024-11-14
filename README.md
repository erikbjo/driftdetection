# Weekly assignment - Week 45

Create a small Terraform project that represents a real-world infrastructure setup (example project from the videos can
be used). Add a GitHub Actions workflow to monitor for infrastructure drift, which helps maintain consistency between
the actual resources deployed and your Terraform code.

To simulate drift, make a manual change to your resource directly in the Azure portal/or with script file available in
the github repo. Re-run the workflow to confirm that the drift is detected. Review the generated drift report, which
will detail any discrepancies found between the actual and desired infrastructure states.

Extra: Try to implement email notification for drift detection