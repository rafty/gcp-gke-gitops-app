apiVersion: apps/v1
kind: Deployment
metadata:
  name: gke-gitops
  labels:
    app: gke-gitops
spec:
  replicas: 1
  selector:
    matchLabels:
      app: gke-gitops
  template:
    metadata:
      labels:
        app: gke-gitops
    spec:
      containers:
        - name: gke-gitops
          image: gcr.io/GOOGLE_CLOUD_PROJECT/MY_SERVICE_NAME:COMMIT_SHA
          ports:
            - containerPort: 8080
---
kind: Service
apiVersion: v1
metadata:
  name: gke-gitops
spec:
  selector:
    app: gke-gitops
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
  type: LoadBalancer