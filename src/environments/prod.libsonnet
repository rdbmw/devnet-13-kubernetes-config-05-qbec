
// this file has the param overrides for the default environment
local base = import './base.libsonnet';

base {
  components +: {
    front +: {
      namespace: 'prod',
      replicas: 3,
    },
    back +: {
      namespace: 'prod',
      replicas: 3,
    },
    db +: {
      namespace: 'prod',
      replicas: 3,
    },
    ep: {
      name: 'ep',
      ip: '158.160.32.184',
      port: 80,
    },
  }
}
