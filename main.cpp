#include <tesseract/baseapi.h>
#include <leptonica/allheaders.h>
#include <iostream>
#include <string>
#include <codecvt>
#include <locale>
using namespace std;
std::wstring string_to_wstring(const std::string& str) {
	std::wstring_convert<std::codecvt_utf8_utf16<wchar_t>> converter;
	return converter.from_bytes(str);
}
int main()
{
	char* outText;

	tesseract::TessBaseAPI* api = new tesseract::TessBaseAPI();
	// Initialize tesseract-ocr with English, without specifying tessdata path
	if (api->Init("./traindata", "eng+jpn")) {
		fprintf(stderr, "Could not initialize tesseract.\n");
		exit(1);
	}

	// Open input image with leptonica library
	Pix* image = pixRead("crop.png");
	api->SetImage(image);
	int orient_deg;
	float orient_conf;
	const char* script_name;
	float script_conf;

	api->DetectOrientationScript(&orient_deg, &orient_conf, &script_name, &script_conf);

	// Get OCR result
	outText = api->GetUTF8Text();
	//std::string str = outText;
	//printf("OCR output:\n%s", outText);
	//std::locale::global(std::locale(""));
	//std::wcout.imbue(std::locale());

	std::wstring japaneseText = string_to_wstring(outText);
	std::wcout << japaneseText << std::endl;
	// Destroy used object and release memory
	api->End();
	delete api;
	delete[] outText;
	pixDestroy(&image);
	system("pause");
	return 0;
}