-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Projects table to store consultant project generations
CREATE TABLE projects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    
    -- Intake interview data
    target_user TEXT,
    problem_statement TEXT,
    success_metrics JSONB,
    
    -- Technical specifications
    data_model JSONB, -- Generated Postgres schema
    site_map JSONB, -- Generated site structure with auth requirements
    api_integrations JSONB, -- External API mappings
    ui_template VARCHAR(50), -- 'clean_saas', 'dashboard_heavy', 'marketing_plus_app'
    
    -- Generation status
    status VARCHAR(50) DEFAULT 'intake' CHECK (status IN ('intake', 'generating', 'complete', 'deployed')),
    generation_progress INTEGER DEFAULT 0,
    
    -- File generation metadata
    generated_files JSONB, -- List of generated files and their metadata
    deployment_url VARCHAR(500),
    
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Project feedback/notes table for collaboration
CREATE TABLE project_notes (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id) ON DELETE CASCADE NOT NULL,
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    content TEXT NOT NULL,
    note_type VARCHAR(50) DEFAULT 'general' CHECK (note_type IN ('general', 'technical', 'feedback', 'requirement')),
    
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- API integration templates/presets
CREATE TABLE integration_templates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    api_type VARCHAR(100) NOT NULL, -- 'rest', 'graphql', 'webhook', etc.
    
    -- Template configuration
    auth_method VARCHAR(50), -- 'api_key', 'oauth', 'bearer_token', etc.
    endpoint_patterns JSONB, -- Common endpoint structures
    data_mapping JSONB, -- Standard field mappings
    
    -- External service details
    service_name VARCHAR(100),
    documentation_url VARCHAR(500),
    
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    is_active BOOLEAN DEFAULT true
);

-- Indexes for performance
CREATE INDEX idx_projects_user_id ON projects(user_id);
CREATE INDEX idx_projects_status ON projects(status);
CREATE INDEX idx_projects_created_at ON projects(created_at);
CREATE INDEX idx_project_notes_project_id ON project_notes(project_id);
CREATE INDEX idx_project_notes_user_id ON project_notes(user_id);
CREATE INDEX idx_integration_templates_service_name ON integration_templates(service_name);

-- Row Level Security policies
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE project_notes ENABLE ROW LEVEL SECURITY;
ALTER TABLE integration_templates ENABLE ROW LEVEL SECURITY;

-- Projects policies
CREATE POLICY "Users can view their own projects"
    ON projects FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Users can create their own projects"
    ON projects FOR INSERT
    WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can update their own projects"
    ON projects FOR UPDATE
    USING (auth.uid() = user_id);

CREATE POLICY "Users can delete their own projects"
    ON projects FOR DELETE
    USING (auth.uid() = user_id);

-- Project notes policies
CREATE POLICY "Users can view notes on their projects"
    ON project_notes FOR SELECT
    USING (EXISTS (
        SELECT 1 FROM projects 
        WHERE projects.id = project_notes.project_id 
        AND projects.user_id = auth.uid()
    ));

CREATE POLICY "Users can create notes on their projects"
    ON project_notes FOR INSERT
    WITH CHECK (
        auth.uid() = user_id AND
        EXISTS (
            SELECT 1 FROM projects 
            WHERE projects.id = project_notes.project_id 
            AND projects.user_id = auth.uid()
        )
    );

-- Integration templates are publicly readable
CREATE POLICY "Integration templates are publicly readable"
    ON integration_templates FOR SELECT
    USING (is_active = true);

-- Insert some default integration templates
INSERT INTO integration_templates (name, description, api_type, auth_method, service_name, endpoint_patterns, data_mapping, documentation_url) VALUES
(
    'Stripe Payments',
    'Standard Stripe payment processing integration',
    'rest',
    'api_key',
    'Stripe',
    '{"base": "https://api.stripe.com/v1", "endpoints": ["/customers", "/subscriptions", "/invoices", "/payment_intents"]}',
    '{"customer_id": "external_stripe_id", "subscription_id": "stripe_subscription_id", "payment_status": "stripe_status"}',
    'https://stripe.com/docs/api'
),
(
    'SendGrid Email',
    'Email delivery via SendGrid API',
    'rest',
    'api_key',
    'SendGrid',
    '{"base": "https://api.sendgrid.com/v3", "endpoints": ["/mail/send", "/templates", "/contacts"]}',
    '{"email": "email", "template_id": "sendgrid_template_id", "status": "delivery_status"}',
    'https://docs.sendgrid.com/api-reference'
),
(
    'Salesforce CRM',
    'Salesforce REST API integration',
    'rest',
    'oauth',
    'Salesforce',
    '{"base": "https://[instance].salesforce.com/services/data/v58.0", "endpoints": ["/sobjects/Account", "/sobjects/Contact", "/sobjects/Opportunity"]}',
    '{"account_id": "salesforce_account_id", "contact_id": "salesforce_contact_id", "opportunity_id": "salesforce_opp_id"}',
    'https://developer.salesforce.com/docs/atlas.en-us.api_rest.meta/api_rest/'
);