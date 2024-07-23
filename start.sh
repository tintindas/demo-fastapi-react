cd frontend
npm run start | tee frontend_logs.txt &
cd ..
cd backend
python3 main.py | tee backend_logs.txt
