# WAV2TEXT
🎶  Kaldi-ASR Speech to Text Scripts

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Syzygianinfern0/WAV2TEXT.git/master) ![Trigger-Binder-build](https://github.com/Syzygianinfern0/WAV2TEXT/workflows/Trigger-Binder-build/badge.svg)

Choose the first badge to view this repo on Binder with Kaldi-ASR all it's dependencies already setup.
I have chosen `Binder` over something such as `Colab` as the setup of the environment is to be done just once and on every usage request, it just reuses the same environment.
To view how the environemnt is set-up have a look at the Dockerfile. 

If the Binder is under a "building" stage please wait for atleast 20 minutes. The Binder is updated
for every push view a GitHub action trigger to be always up-to-date and maintained.

The `speech_to_text.sh` script follows through the entire decoding. For using the script on your local machine, just changing the `KALDI_ROOT` env variable would
get you setup entirely. Please open an issue if there are any crashes or bugs so that it can be resolved as soon as possible. 

The pre-trained weights are already loaded into this repo under the `exp/*` and can be used as such (results can be found [here](https://github.com/Syzygianinfern0/ASR-NPTEL-Challenge/tree/master/models)).
The script must work out of the box for such weights trained with the Kaldi-ASR framework.
