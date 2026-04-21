-- ============================================
-- Dominio: Gestión de Notificaciones
-- Descripción: Tablas para administrar notificaciones, canales y plantillas
-- ============================================

CREATE TABLE notificaciones.notification_type (
    notification_type_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    type_code varchar(30) NOT NULL,
    type_name varchar(100) NOT NULL,
    type_description text,
    requires_confirmation boolean NOT NULL DEFAULT false,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uq_notification_type_code UNIQUE (type_code),
    CONSTRAINT uq_notification_type_name UNIQUE (type_name)
);





CREATE TABLE notificaciones.notification_channel (
    notification_channel_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    channel_code varchar(20) NOT NULL,
    channel_name varchar(50) NOT NULL,
    max_retries integer NOT NULL DEFAULT 3,
    retry_delay_seconds integer NOT NULL DEFAULT 300,
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uq_notification_channel_code UNIQUE (channel_code),
    CONSTRAINT uq_notification_channel_name UNIQUE (channel_name),
    CONSTRAINT ck_channel_max_retries CHECK (max_retries >= 0),
    CONSTRAINT ck_channel_retry_delay CHECK (retry_delay_seconds >= 0)
);






CREATE TABLE notificaciones.notification_template (
    notification_template_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    notification_type_id uuid NOT NULL REFERENCES notificaciones.notification_type(notification_type_id),
    notification_channel_id uuid NOT NULL REFERENCES notificaciones.notification_channel(notification_channel_id),
    template_code varchar(50) NOT NULL,
    subject_template varchar(200),
    body_template text NOT NULL,
    language_code varchar(5) NOT NULL DEFAULT 'es',
    is_active boolean NOT NULL DEFAULT true,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT uq_notification_template UNIQUE (notification_type_id, notification_channel_id, language_code),
    CONSTRAINT uq_template_code UNIQUE (template_code)
);







CREATE TABLE notificaciones.notification (
    notification_id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    notification_template_id uuid NOT NULL REFERENCES notificaciones.notification_template(notification_template_id),
    recipient_email varchar(200),
    recipient_phone varchar(20),
    recipient_push_token varchar(255),
    notification_subject varchar(200),
    notification_body text NOT NULL,
    notification_status varchar(50) NOT NULL DEFAULT 'PENDING',
    retry_count integer NOT NULL DEFAULT 0,
    sent_at timestamptz,
    delivered_at timestamptz,
    confirmed_at timestamptz,
    error_message text,
    created_at timestamptz NOT NULL DEFAULT now(),
    updated_at timestamptz NOT NULL DEFAULT now(),
    CONSTRAINT ck_notification_status CHECK (notification_status IN ('PENDING', 'SENDING', 'SENT', 'DELIVERED', 'FAILED', 'CONFIRMED', 'BOUNCED')),
    CONSTRAINT ck_retry_count CHECK (retry_count >= 0),
    CONSTRAINT ck_notification_recipient CHECK (recipient_email IS NOT NULL OR recipient_phone IS NOT NULL OR recipient_push_token IS NOT NULL)
);





