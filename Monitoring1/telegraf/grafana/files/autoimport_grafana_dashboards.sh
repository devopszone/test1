#!/bin/bash

grafana_user=$1
grafana_password=$2
grafana_ip=$3


curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @statefulset-dashboard.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @kubernetes-cluster-status-dashboard.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @kubernetes-control-plane-status-dashboard.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @kubernetes-resource-requests-dashboard.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @kubernetes-capacity-planning-dashboard.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @kubernetes-cluster-health-dashboard.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @nodes-dashboard.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @KubernetesCluster.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @pods-dashboard.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @deployment-dashboard.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @ApplicationMonitoring.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @ContainersOverviewMonitoring.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @KubernetesCluster.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @NetworkMonitoring.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @TelegrafHostMetrics.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @Redis.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @ApplicationServer.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @CustomMetrics.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @EhCache.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @Host.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @JVM.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @Logging.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @RequestMetrics.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @ApplicationServer_Infux.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @Host_Influx.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @JVM_Influx.json

curl -s -H "Content-Type: application/json" -XPOST http://$grafana_user:$grafana_password@$grafana_ip:3000/api/dashboards/db -d @RequestMetrics_influx.json

