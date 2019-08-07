apiVersion: batch/v1beta1
kind: CronJob
metadata:
  labels:
    project: pod-startup
    role: cronjob
  name: pod-startup
spec:
  concurrencyPolicy: Forbid
  failedJobsHistoryLimit: 1
  jobTemplate:
    metadata:
      creationTimestamp: null
      labels:
        project: pod-startup
        role: cronjob
      name: pod-startup
    spec:
      template:
        metadata:
          creationTimestamp: null
          labels:
            project: pod-startup
            role: cronjob
          name: pod-startup
        spec:
          containers:
          - env:
            - name: PROJECT
              value: pod-startup
            image: ${DOCKERREPO}
            imagePullPolicy: Always
            name: pod-startup
            resources:
              limits:
                cpu: 100m
                memory: 100Mi
              requests:
                cpu: 50m
                memory: 50Mi
            securityContext: {}
            terminationMessagePath: /dev/termination-log
            terminationMessagePolicy: File
          dnsPolicy: ClusterFirst
          dnsConfig:
            options:
              - name: single-request-reopen
          restartPolicy: Never
          schedulerName: default-scheduler
          securityContext: {}
          terminationGracePeriodSeconds: 60
  schedule: '*/1 * * * *'
  successfulJobsHistoryLimit: 3
  suspend: false