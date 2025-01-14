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
