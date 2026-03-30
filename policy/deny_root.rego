package main

deny[msg] {
  input.kind == "Deployment"
  container := input.spec.template.spec.containers[_]
  container.securityContext.runAsUser == 0
  msg := sprintf(
    "ERREUR SÉCURITÉ : le conteneur '%v' tourne en root (runAsUser=0). Utiliser un UID > 0.",
    [container.name]
  )
}

deny[msg] {
  input.kind == "Deployment"
  container := input.spec.template.spec.containers[_]
  container.securityContext.runAsNonRoot == false
  msg := sprintf(
    "ERREUR SÉCURITÉ : le conteneur '%v' a runAsNonRoot=false. Mettre runAsNonRoot=true.",
    [container.name]
  )
}
