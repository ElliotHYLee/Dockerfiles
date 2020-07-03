cd python35
docker build -t temp .
docker tag temp hylee101001/pythons:python35
docker push hylee101001/pythons:python35
cd ..

cd python36
docker build -t temp .
docker tag temp hylee101001/pythons:python36
docker push hylee101001/pythons:python36
cd ..

cd python37
docker build -t temp .
docker tag temp hylee101001/pythons:python37
docker push hylee101001/pythons:python37
cd ..


