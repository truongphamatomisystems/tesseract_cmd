from google.cloud import speech
import io
import datetime

def transcribe_and_save_to_srt(audio_file, srt_file):
    # Initialize the Speech-to-Text client
    client = speech.SpeechClient()

    # Load the audio file
    with io.open(audio_file, "rb") as audio_file:
        content = audio_file.read()

    # Configure the audio and recognition settings
    audio = speech.RecognitionAudio(content=content)
    config = speech.RecognitionConfig(
        encoding=speech.RecognitionConfig.AudioEncoding.LINEAR16,
        sample_rate_hertz=16000,
        language_code="en-US",
        enable_word_time_offsets=True,  # Enables word time offsets
    )

    # Perform speech recognition on the audio file
    response = client.recognize(config=config, audio=audio)

    # Open the SRT file for writing
    with open(srt_file, "w", encoding="utf-8") as f:
        index = 1

        for result in response.results:
            # Iterate over each alternative transcription
            for alternative in result.alternatives:
                # Get the first and last word's start and end time
                start_time = alternative.words[0].start_time
                end_time = alternative.words[-1].end_time

                # Convert time to SRT time format
                start = format_time_srt(start_time)
                end = format_time_srt(end_time)

                # Write the SRT entry (index, time range, and transcript)
                f.write(f"{index}\n")
                f.write(f"{start} --> {end}\n")
                f.write(f"{alternative.transcript}\n\n")
                
                index += 1

def format_time_srt(time_obj):
    """Format a time object from the Google API to SRT time format (HH:MM:SS,mmm)"""
    seconds = time_obj.seconds + time_obj.nanos / 1e9
    time_delta = datetime.timedelta(seconds=seconds)
    total_seconds = time_delta.total_seconds()
    
    # Format to SRT-style timestamp: hours, minutes, seconds, milliseconds
    hours = int(total_seconds // 3600)
    minutes = int((total_seconds % 3600) // 60)
    seconds = int(total_seconds % 60)
    milliseconds = int((total_seconds % 1) * 1000)

    return f"{hours:02}:{minutes:02}:{seconds:02},{milliseconds:03}"

# Specify the path to the audio file and the output SRT file
audio_file_path = "path_to_your_audio_file.wav"
srt_file_path = "output_subtitle.srt"

# Call the function to transcribe and save to SRT
transcribe_and_save_to_srt(audio_file_path, srt_file_path)
print("done")