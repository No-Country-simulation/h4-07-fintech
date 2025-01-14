CREATE TABLE notification_settings (
                                       id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                                       user_id UUID NOT NULL REFERENCES users(id),
                                       type VARCHAR(50) NOT NULL,
                                       enabled BOOLEAN DEFAULT TRUE,
                                       email_enabled BOOLEAN DEFAULT TRUE,
                                       push_enabled BOOLEAN DEFAULT TRUE,
                                       created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                                       updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                                       UNIQUE(user_id, type)
);