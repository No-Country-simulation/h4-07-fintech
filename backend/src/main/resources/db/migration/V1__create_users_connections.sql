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