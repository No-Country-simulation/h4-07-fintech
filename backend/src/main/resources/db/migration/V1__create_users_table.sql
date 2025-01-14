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