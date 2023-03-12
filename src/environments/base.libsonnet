
// this file has the baseline default parameters
{
  components: {
    front: {
      name: 'frontend',
      namespace: 'default',
      replicas: 1,
      image: 'rdbmw/front-app:1.0.0',
      containerPort: 80,
    },
    back: {
      name: 'backend',
      namespace: 'default',
      replicas: 1,
      image: 'rdbmw/back-app:1.0.0',
      containerPort: 9000,
      port: 9000,
      targetPort: 9000,
      type: 'ClusterIP',
    },
    db: {
      name: 'db',
      namespace: 'default',
      serviceName: 'db',
      replicas: 1,
      minReadySeconds: 10,
      terminationGracePeriodSeconds: 10,
      image: 'postgres:13-alpine',
      containerPort: 5432,
      port: 5432,
      targetPort: 5432,
      type: 'ClusterIP',
    },
  },
}
