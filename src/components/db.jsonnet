
local p = import '../params.libsonnet';
local params = p.components.db;

[
  {
    apiVersion: 'apps/v1',
    kind: 'StatefulSet',
    metadata: {
      name: params.name,
      namespace: params.namespace,
    },
    spec: {
      selector: {
        matchLabels: {
          app: params.name,
        },
      },
      serviceName: params.serviceName,
      replicas: params.replicas,
      minReadySeconds: params.minReadySeconds,
      template: {
        metadata: {
          labels: {
            app: params.name,
          },
        },
        spec: {
          terminationGracePeriodSeconds: params.terminationGracePeriodSeconds,
          containers: [
            {
              name: params.name,
              image: params.image,
              ports: [
                {
                  containerPort: params.containerPort,
                },
              ],
              env: [
                {
                  name: 'POSTGRES_PASSWORD',
                  value: 'postgres',
                },
                {
                  name: 'POSTGRES_USER',
                  value: 'postgres',
                },
                {
                  name: 'POSTGRES_DB',
                  value: 'news',
                },
              ],
            },
          ],
        },
      },
    },
  },
  {
    apiVersion: 'v1',
    kind: 'Service',
    metadata: {
      name: params.name,
      namespace: params.namespace,
      labels: {
        app: params.name,
      },
    },
    spec: {
      ports: [
        {
          name: params.name,
          port: params.port,
          targetPort: params.targetPort,
        },
      ],
      selector: {
        app: params.name,
      },
      type: params.type,
    },
  },
]
