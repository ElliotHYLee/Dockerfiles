cd p35_update
docker build -t temp .
docker tag temp hylee101001/pythons:python35
docker push hylee101001/pythons:python35
cd ..

cd p36_update
docker build -t temp .
docker tag temp hylee101001/pythons:python36
docker push hylee101001/pythons:python36
cd ..

cd p37_update
docker build -t temp .
docker tag temp hylee101001/pythons:python37
docker push hylee101001/pythons:python37
cd ..


