{% set cert = salt['vault'].read_secret('secret/certs/common/wildcard/sandbox3/tccenter.ru.crt') %}
{% set key  = salt['vault'].read_secret('secret/certs/common/wildcard/sandbox3/tccenter.ru.key') %}

/tmp/cert.crt:
  file.managed:
    - user: root
    - group: root
    - mode: '0400'
    - contents_newline: true
    - contents: "{{ cert.value|yaml|replace("'","") }}"


/tmp/cert.key:
  file.managed:
    - user: root
    - group: root
    - mode: '0400'
    - contents_newline: true
    - contents: "{{ key.value |yaml|replace("'","")}}"

nginx:
  service.running:
    - enable: true
    - reload: true
    - watch:
      - file: /tmp/sandbox-cert.crt
      - file: /tmp/sandbox-cert.key
