import os
import sys

def format_payload(payload):
	print("[*] encoding payload: {}".format(payload))
	encoded = []
	payload = "import os; os.system(\"" + payload + "\")"
	for c in payload:
		encoded.append(ord(c))
	return encoded

def decode_payload(encoded_payload):
	return "".join(chr(int(c)) for c in encoded_payload)

def print_encoded(encoded_payload):
	formatted_payload = """echo 'print("".join(chr(c) for c in ["""
	for idx,o in enumerate(encoded_payload):
		if idx == 0:
			formatted_payload += "{}".format(o)
		else: 
			formatted_payload += ",{}".format(o)
	formatted_payload += "]))' | python | python"
	print("[+] encoded:\n\t{}".format(formatted_payload))
	translated_payload = """echo 'print(\"\"\"{}\"\"\")' | python | python""".format(decode_payload(encoded_payload))
	print("[+] translation:\n\t{}".format(translated_payload))

def main():
	if len(sys.argv) < 2:
		print("[-] need a payload")
		exit(0)

	string_payload = " ".join(sys.argv[1:])
	encoded_payload = format_payload(string_payload)
	print_encoded(encoded_payload)

if __name__ == "__main__":
	main()