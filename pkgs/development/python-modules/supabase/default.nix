{ lib
, buildPythonPackage
, fetchPypi
, poetry-core
, gotrue
, postgrest
, realtime
, storage3
, supafunc
, httpx
}:

buildPythonPackage rec {
  pname = "supabase";
  version = "2.15.0";
  pyproject = true;

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-LmYomtdK6cTLBKafneAM0s6IDNiQ3iMmmkCsW2kVHSY=";
  };

  nativeBuildInputs = [ poetry-core ];

  propagatedBuildInputs = [
    postgrest
    realtime
    gotrue
    httpx
    storage3
    supafunc
  ];

  # test aren't in pypi package
  doCheck = false;

  meta = with lib; {
    homepage = "https://github.com/supabase-community/supabase-py";
    license = licenses.mit;
    description = "Supabas client for Python";
    maintainers = with maintainers; [ siegema ];
  };
}
