FROM python:3.11-slim

# Create working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Cloud Run will inject PORT environment variable (default 8080)
ENV PORT=8080

# Expose the port (not strictly required for Cloud Run, but good practice)
EXPOSE 8080

# Start Streamlit, binding to 0.0.0.0 and using the PORT env
CMD streamlit run app.py --server.port $PORT --server.address 0.0.0.0
