
local p = import '../params.libsonnet';
local params = p.components.back;

[
  {
    apiVersion: 'apps/v1',
    kind: 'Deployment',
    metadata: {
      name: params.name,
      namespace: params.namespace,
      labels: {
        app: params.name,
      },
    },
    spec: {
      replicas: params.replicas,
      selector: {
        matchLabels: {
          app: params.name,
        },
      },
      template: {
        metadata: {
          labels: {
            app: params.name,
          },
        },
        spec: {
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
                  name: 'DATABASE_URL',
                  value: 'postgres://postgres:postgres@db:5432/news',
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
