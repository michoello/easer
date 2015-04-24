pushd d:\ObjectStore\OneBox
rem Client\Microsoft.ObjectStore.SchemaManager.exe  /e:Schema\Environment.ini /n:SD://BSDSearchGold:7727/depot/deploy/builds/data/ObjectStore/Schema/Test/NamespaceList.ini /o:Server\bin /b
Client\Microsoft.ObjectStore.SchemaManager.exe  /e:Schema\Environment.ini /n:SD://BSDSearchGold:7727/depot/deploy/builds/data/ObjectStore/NamespaceList.ini /o:Server\bin /b
popd

rem echo SLEEPING FOREVER, PRESS CTRL+C WHEN YOU GET AN EYEFUL OF THIS MESSAGE
rem sleep 3600
