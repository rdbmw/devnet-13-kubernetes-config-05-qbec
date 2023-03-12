
local p = import '../params.libsonnet';
local params = p.components.ep;

[
  {
    apiVersion: 'v1',
    kind: 'Endpoints',
    metadata: {
      name: params.name,
    },
    subsets: [
      {
        addresses: [
          {
            ip: params.ip,
          }
        ],
        ports: [
          {
            port: params.port,
            name: params.name,
          },
        ],
      },
   ],
  },
]