
local p = import '../params.libsonnet';
local params = p.components.front;

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
                  name: 'BASE_URL',
                  value: 'http://backend:9000',
                },
              ],
            },
          ],
        },
      },
    },
  },
]
