-- Backup Strategy

-- Objective
Ensure data availability, integrity, and quick recovery in case of failure.

-- Backup Type

- Full database backups
- Logical backups using `mysqldump`

-- Schedule

- Daily full backup at 01:00 AM
- Retention: 7 days

-- Storage

- Local backup directory
- Optional off-site or cloud storage

-- Security

- Restrict file permissions
- Encrypt backups when stored off-site

-- Recovery Testing

- Monthly restore test to staging environment
