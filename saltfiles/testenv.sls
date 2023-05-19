/tmp/testenvfile:
  file.managed:
    - user: root
    - group: root
    - mode: '0400'
    - source:
      - salt://testenv
