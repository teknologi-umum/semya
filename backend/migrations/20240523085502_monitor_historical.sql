-- +goose Up
-- +goose StatementBegin
CREATE TABLE monitor_historical (
    monitor_id VARCHAR(255) NOT NULL,
    status SMALLINT NOT NULL,
    latency INTEGER NOT NULL DEFAULT 0,
    timestamp TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX monitor_historical_monitor_id_idx ON monitor_historical (monitor_id);

CREATE TABLE monitor_historical_hourly_aggregate (
    timestamp TIMESTAMPTZ NOT NULL,
    monitor_id VARCHAR(255) NOT NULL,
    status SMALLINT NOT NULL,
    latency INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX monitor_historical_hourly_aggregate_monitor_id_timestamp_idx ON monitor_historical_hourly_aggregate (monitor_id, timestamp);

CREATE TABLE monitor_historical_daily_aggregate (
    timestamp TIMESTAMPTZ NOT NULL,
    monitor_id VARCHAR(255) NOT NULL,
    status SMALLINT NOT NULL,
    latency INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX monitor_historical_daily_aggregate_monitor_id_timestamp_idx ON monitor_historical_daily_aggregate (monitor_id, timestamp);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE monitor_historical;
DROP TABLE monitor_historical_hourly_aggregate;
DROP TABLE monitor_historical_daily_aggregate;
-- +goose StatementEnd
