postgresql-deps:
  pkg.installed:
    - pkgs:
      - libpq-dev

postgresql:
  pkg:
    - name: postgresql-9.1
    - installed
  service.running:
    - enabled: True
    - watch:
        - file: /etc/postgresql/9.1/main/pg_hba.conf
