pushd d:\ObjectStore
rm -rf OneBox/*
popd
mkdir OneBox
pushd OneBox
unzip \\adrel\Drops\ObjectStore\NonRelease\ObjectStore\469.0.140205-0200\retail\amd64\Public\ObjectStore.OneBox.zip
chmod -R 666 *
popd
