#!/usr/bin/env python3

import os
import sys
import json
import shutil
import argparse
import subprocess

config = {"root_file_name": "", "output_file_name": ""}
current_dir = os.path.abspath(os.path.dirname(__file__))
parent_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
fonts_dir = os.path.join(current_dir, "fonts")
matadata_file = "metadata.json"


def load_metadata():
    try:
        exist_meta_config = False

        # check if metadata file exists in current dir
        config_path = os.path.join(os.path.dirname(__file__), matadata_file)
        if os.path.exists(config_path):
            exist_meta_config = True
            with open(config_path, "r") as f:
                config.update(json.load(f))

        # check if metadata file exists in parent dir
        config_path = os.path.join(os.path.dirname(__file__), "..", matadata_file)
        if os.path.exists(config_path):
            exist_meta_config = True
            with open(config_path, "r") as f:
                config.update(json.load(f))

        if not exist_meta_config:
            print(
                f"Error: File {matadata_file} not found in current dir and parent dir."
            )
            sys.exit(1)
    except json.JSONDecodeError:
        print(f"Error: Failed to parse JSON file {matadata_file}")
        sys.exit(1)
    # output_file_name must end with '.pdf'
    if not config["output_file_name"].endswith(".pdf"):
        print("Error: output_file_name must end with '.pdf'")
        sys.exit(1)
    # check if any attribute is empty
    empty_values = [key for key, value in config.items() if value == ""]
    if empty_values:
        print(
            f"Error: attribute: {', '.join(empty_values)} is not font in {matadata_file}"
        )
        sys.exit(1)
    # add current dir and parent dir
    config["root_file_name"] = os.path.join(parent_dir, config["root_file_name"])
    config["output_file_name"] = os.path.join(parent_dir, config["output_file_name"])


def compile(output_name):
    if shutil.which("typst"):
        subprocess.run(
            [
                "typst",
                "c",
                config["root_file_name"],
                output_name,
                "--font-path",
                fonts_dir,
            ]
        )
    else:
        print("typst command not found")
        print(" ")
        print("please reference: https://typst.app/")


def watch(output_name):
    if shutil.which("typst"):
        subprocess.run(
            [
                "typst",
                "w",
                config["root_file_name"],
                output_name,
                "--font-path",
                fonts_dir,
            ]
        )
    else:
        print("typst command not found")
        print(" ")
        print("please reference: https://typst.app/")


def format():
    if shutil.which("typstyle"):
        subprocess.run(["typstyle", "format-all"])
    else:
        print("typstyle command not found")
        print(" ")
        print("please reference: https://github.com/Enter-tainer/typstyle")


def main():
    load_metadata()
    parser = argparse.ArgumentParser(description="Process some commands.")
    parser.add_argument(
        "option",
        choices=["c", "w", "f"],
        help="Operation option: c (compile), w (watch), f (format)",
    )
    parser.add_argument(
        "output_name",
        nargs="?",
        default=config["output_file_name"],
        help=f"Output file name (default is {config.get('output_file_name')})",
    )

    args = parser.parse_args()

    if args.option == "c":
        compile(args.output_name)
    elif args.option == "w":
        watch(args.output_name)
    elif args.option == "f":
        format()


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\nCancelled by user.")
        sys.exit(0)