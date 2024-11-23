#!/usr/bin/env bash

kind create cluster --config kind-config.yaml

kubectl create namespace argocd
kubectl apply -n argocd-f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl port-forward service/argocd-server -n argocd 8080:443
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
