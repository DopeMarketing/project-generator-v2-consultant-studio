import Link from 'next/link'

export default function HomePage() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100">
      {/* Header */}
      <header className="bg-white shadow-sm">
        <div className="max-w-7xl mx-auto px-4 py-6">
          <div className="flex justify-between items-center">
            <div>
              <h1 className="text-2xl font-bold text-gray-900">Project Generator</h1>
              <p className="text-gray-600">Consultant Studio</p>
            </div>
            <div className="space-x-4">
              <Link href="/login" className="text-blue-600 hover:text-blue-800">
                Sign In
              </Link>
              <Link href="/signup" className="btn-primary">
                Get Started
              </Link>
            </div>
          </div>
        </div>
      </header>

      {/* Hero Section */}
      <main className="max-w-7xl mx-auto px-4 py-16">
        <div className="text-center mb-16">
          <h2 className="text-5xl font-bold text-gray-900 mb-6">
            Transform Ideas into 
            <span className="text-blue-600"> Deployable Prototypes</span>
          </h2>
          <p className="text-xl text-gray-600 mb-8 max-w-3xl mx-auto">
            Purpose-built for AI implementation consultants who need to rapidly prototype 
            client solutions and demonstrate technical feasibility during PE/VC sales cycles.
          </p>
          <Link href="/signup" className="btn-primary text-lg px-8 py-3">
            Start Building Prototypes
          </Link>
        </div>

        {/* Features Grid */}
        <div className="grid md:grid-cols-3 gap-8 mb-16">
          <div className="card text-center">
            <div className="w-12 h-12 bg-blue-100 rounded-lg flex items-center justify-center mx-auto mb-4">
              <svg className="w-6 h-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
              </svg>
            </div>
            <h3 className="text-lg font-semibold mb-2">Structured Intake</h3>
            <p className="text-gray-600">
              Multi-step interview process with API integration mapping to capture complete project requirements
            </p>
          </div>

          <div className="card text-center">
            <div className="w-12 h-12 bg-green-100 rounded-lg flex items-center justify-center mx-auto mb-4">
              <svg className="w-6 h-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 7v10c0 2.21 1.79 4 4 4h8c2.21 0 4-1.79 4-4V7c0-2.21-1.79-4-4-4H8c-2.21 0-4 1.79-4 4z" />
              </svg>
            </div>
            <h3 className="text-lg font-semibold mb-2">Smart Data Modeling</h3>
            <p className="text-gray-600">
              Automated Postgres schema generation with external ID columns and proper relationships
            </p>
          </div>

          <div className="card text-center">
            <div className="w-12 h-12 bg-purple-100 rounded-lg flex items-center justify-center mx-auto mb-4">
              <svg className="w-6 h-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4" />
              </svg>
            </div>
            <h3 className="text-lg font-semibold mb-2">Complete Code Generation</h3>
            <p className="text-gray-600">
              Full scaffold with migrations, typed queries, API stubs, and three professional UI templates
            </p>
          </div>
        </div>

        {/* Stats Section */}
        <div className="bg-white rounded-xl shadow-lg p-8 mb-16">
          <div className="text-center mb-8">
            <h3 className="text-2xl font-bold text-gray-900 mb-2">Built for Speed</h3>
            <p className="text-gray-600">Optimize your consulting workflow with rapid prototyping</p>
          </div>
          <div className="grid md:grid-cols-3 gap-8 text-center">
            <div>
              <div className="text-3xl font-bold text-blue-600 mb-1">&lt;10 min</div>
              <div className="text-gray-600">To Deployable Prototype</div>
            </div>
            <div>
              <div className="text-3xl font-bold text-green-600 mb-1">100%</div>
              <div className="text-gray-600">Automated Setup</div>
            </div>
            <div>
              <div className="text-3xl font-bold text-purple-600 mb-1">3</div>
              <div className="text-gray-600">Professional UI Templates</div>
            </div>
          </div>
        </div>

        {/* CTA Section */}
        <div className="text-center bg-gradient-to-r from-blue-600 to-purple-600 text-white rounded-xl p-12">
          <h3 className="text-3xl font-bold mb-4">Ready to 10x Your Prototype Speed?</h3>
          <p className="text-xl mb-8 opacity-90">
            Join AI consultants who are winning more deals with faster prototypes
          </p>
          <Link href="/signup" className="bg-white text-blue-600 px-8 py-3 rounded-lg font-semibold hover:bg-gray-100 transition-colors">
            Start Your First Project
          </Link>
        </div>
      </main>

      {/* Footer */}
      <footer className="bg-gray-900 text-white py-8">
        <div className="max-w-7xl mx-auto px-4 text-center">
          <p>&copy; 2024 Project Generator - Consultant Studio. Built for AI implementation consultants.</p>
        </div>
      </footer>
    </div>
  )
}