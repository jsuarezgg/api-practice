"""Script to generate the API documentation."""
import http.client
import os
import sys
import json
import yaml
import requests


def get_swagger_data():
    r = requests.get("http://localhost:5000/apispec_1.json")
    if r.status_code != http.client.OK:
        raise
    return r.json()


def remove_collection_format(data):
    paths = data["paths"]
    for _, path in paths.items():
        for _, method in path.items():
            params = method.get("parameters", {})
            if len(params):
                for param in params:
                    key = param.pop("collectionFormat", None)
                    if key:
                        print("collectionFormat removed")
    return data


def gen_open_api_swagger():
    data = {}
    docs_path = os.getenv("DOCS_PATH")
    file_name_n_ext = os.getenv("FILE_NAME_N_EXT")
    f_name_json = os.path.join(docs_path, f"{file_name_n_ext}.json")
    f_name_yaml = os.path.join(docs_path, f"{file_name_n_ext}.yml")
    try:
        data = get_swagger_data()
    except Exception as e:
        print(f"Something weird happen. {str(e)}")
    finally:
        print(f"Writing JSON data to: {f_name_json}")
        with open(f_name_json, "w") as f:
            json.dump(data, f, sort_keys=True, indent=4, separators=(',', ': '))
        print(f"Writing YAML data to: {f_name_yaml}")
        with open(f_name_yaml, "w") as f:
            yaml.dump(data, f, sort_keys=True, allow_unicode=True)


if __name__ == "__main__":
    gen_open_api_swagger()
    sys.exit(0)
