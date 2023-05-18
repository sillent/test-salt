job1:
  schedule.present:
    - function: state.sls
    - seconds: 15
    - job_args:
      - wildcard
