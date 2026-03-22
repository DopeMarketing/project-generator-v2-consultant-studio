# Project Generator - Consultant Studio

A consultant's product studio that transforms project ideas into deployable prototypes through structured intake, data modeling, and intelligent code generation. Built for AI implementation consultants who need to rapidly prototype client solutions for PE/VC engagements.

## Features

### 🚀 Rapid Prototyping
- **Target**: Under 10 minutes to deployable prototype
- Multi-step structured intake interview with API integration mapping
- Complete site map generation with auth requirements and API call mapping

### 🗃️ Smart Data Modeling
- Automated Postgres data model generation
- External ID columns for API integrations
- Proper relationship mapping and constraints

### 🎨 Professional UI Templates
- **Clean SaaS**: Modern, minimal interface for B2B tools
- **Dashboard Heavy**: Analytics-focused with rich data visualization
- **Marketing Plus App**: Landing page + application combo

### 🔧 Complete Code Generation
- Migration files and typed database queries
- API integration stubs with authentication
- Project feedback notes system for collaboration

## Tech Stack

- **Framework**: Next.js 15 with App Router
- **Database**: Supabase (PostgreSQL)
- **Authentication**: Supabase Auth
- **Styling**: Tailwind CSS
- **Language**: TypeScript

## Getting Started

### Prerequisites

- Node.js 18+ 
- A Supabase project

### Installation

1. Clone the repository:
```bash
git clone https://github.com/your-org/project-generator-consultant-studio.git
cd project-generator-consultant-studio
```

2. Install dependencies:
```bash
npm install
```

3. Set up environment variables:
```bash
cp .env.example .env.local
```

Fill in your Supabase credentials:
- `NEXT_PUBLIC_SUPABASE_URL`: Your Supabase project URL
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`: Your Supabase anon key
- `SUPABASE_SERVICE_ROLE_KEY`: Your Supabase service role key

4. Run the database migrations:
```bash
# Using Supabase CLI (recommended)
npx supabase db reset

# Or run the migration file directly in your Supabase dashboard
```

5. Start the development server:
```bash
npm run dev
```

Open [http://localhost:3000](http://localhost:3000) to see the application.

## Project Structure

```
├── app/
│   ├── (auth)/
│   │   ├── login/
│   │   └── signup/
│   ├── dashboard/
│   ├── layout.tsx
│   ├── page.tsx
│   └── globals.css
├── lib/
│   └── supabase/
│       ├── client.ts
│       └── server.ts
├── supabase/
│   └── migrations/
│       └── 001_initial.sql
└── middleware.ts
```

## Database Schema

### Core Tables

- **projects**: Store project generations with intake data, technical specs, and generation status
- **project_notes**: Feedback and collaboration notes for each project
- **integration_templates**: Predefined API integration patterns (Stripe, SendGrid, Salesforce, etc.)

### Key Features

- Row Level Security (RLS) for data isolation
- UUID primary keys with external ID columns for API integrations
- JSONB fields for flexible schema storage
- Built-in templates for common integrations

## Development Workflow

1. **Intake Phase**: Multi-step interview to capture requirements
2. **Generation Phase**: Automated schema and code generation
3. **Review Phase**: Collaborative feedback and refinement
4. **Deployment Phase**: One-click deployment to staging/production

## Target Metrics

- ⏱️ **Time to Prototype**: Under 10 minutes
- 📊 **Automation Level**: 100% automated setup
- 🎯 **Success Rate**: Minimal manual customization required

## Contributing

This is a specialized tool built for AI implementation consultants. Contributions should focus on:

- Additional API integration templates
- New UI template options
- Code generation improvements
- Deployment automation enhancements

## License

Private - Built for consultant use only.

---

Built for AI consultants who win deals with faster prototypes. 🚀