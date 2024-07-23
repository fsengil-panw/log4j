resource "google_artifact_registry_repository" "test_repo" {
  location = "us-central1"
  repository_id = "test-repo"
  description = "Test Repository"
  format = "DOCKER"
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/artifactregistry.reader"
    members = [
      "user:example@gmail.com"
    ]
  }
}

resource "google_artifact_registry_repository_iam_policy" "policy" {
  repository = google_artifact_registry_repository.test_repo.name
  policy_data = data.google_iam_policy.admin.policy_data
}
