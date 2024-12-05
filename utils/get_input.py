import argparse
import os
import subprocess

from dotenv import load_dotenv

load_dotenv()

# You can find SESSION by using Chrome tools:
# 1) Go to https://adventofcode.com/2024/day/1/input
# 2) right-click -> inspect -> click the "Application" tab.
# 3) Refresh
# 5) Click https://adventofcode.com under "Cookies"
# 6) Grab the value for session. Create .env file and fill it in.
session = os.getenv("SESSION")

useragent = "sodynoizz"
parser = argparse.ArgumentParser(description="Read input")
parser.add_argument("--year", type=int, default=2024)
parser.add_argument("--day", type=int, default=1)
args = parser.parse_args()


cmd = f"curl https://adventofcode.com/{args.year}/day/{args.day}/input --cookie \"session={session}\" -A '{useragent}'"
output = subprocess.check_output(cmd, shell=True)
output = output.decode("utf-8")
output_dir = "../input"

if not os.path.exists(output_dir):
    os.makedirs(output_dir)

output_path = os.path.join(output_dir, f"{args.day}.in")

with open(output_path, "w") as f:
    f.write(output.rstrip("\n"))
    f.close()
    print(f"Input for day {args.day} saved to directory {output_path}.")
