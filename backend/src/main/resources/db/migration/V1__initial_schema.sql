
CREATE TABLE users (
                       id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                       email VARCHAR(255) NOT NULL UNIQUE,
                       password_hash VARCHAR(255) NOT NULL,
                       first_name VARCHAR(100),
                       last_name VARCHAR(100),
                       phone_number VARCHAR(20),
                       created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                       updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                       email_verified BOOLEAN DEFAULT FALSE,
                       two_factor_enabled BOOLEAN DEFAULT FALSE,
                       status VARCHAR(20) DEFAULT 'ACTIVE'
);


CREATE TABLE user_preferences (
                                  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                                  user_id UUID NOT NULL REFERENCES users(id),
                                  theme VARCHAR(50) DEFAULT 'LIGHT',
                                  font_size VARCHAR(20) DEFAULT 'MEDIUM',
                                  layout_type VARCHAR(50) DEFAULT 'DEFAULT',
                                  notification_preferences JSONB DEFAULT '{}',
                                  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                                  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE user_connections (
                                  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                                  user_id UUID NOT NULL REFERENCES users(id),
                                  provider VARCHAR(50) NOT NULL,
                                  provider_user_id VARCHAR(255) NOT NULL,
                                  access_token TEXT,
                                  refresh_token TEXT,
                                  expires_at TIMESTAMP WITH TIME ZONE,
                                  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                                  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
                                  UNIQUE(user_id, provider)
);


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
