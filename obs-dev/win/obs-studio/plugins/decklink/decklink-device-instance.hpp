#pragma once

#include "decklink-device.hpp"

class DeckLinkDeviceInstance : public IDeckLinkInputCallback {
protected:
	struct obs_source_frame currentFrame;
	struct obs_source_audio currentPacket;
	DeckLink                *decklink = nullptr;
	DeckLinkDevice          *device = nullptr;
	DeckLinkDeviceMode      *mode = nullptr;
	BMDPixelFormat          pixelFormat = bmdFormat8BitYUV;
	ComPtr<IDeckLinkInput>  input;
	volatile long           refCount = 1;

	void HandleAudioPacket(IDeckLinkAudioInputPacket *audioPacket,
			const uint64_t timestamp);
	void HandleVideoFrame(IDeckLinkVideoInputFrame *videoFrame,
			const uint64_t timestamp);

public:
	DeckLinkDeviceInstance(DeckLink *decklink, DeckLinkDevice *device);
	virtual ~DeckLinkDeviceInstance();

	inline DeckLinkDevice *GetDevice() const {return device;}
	inline long long GetActiveModeId() const
	{
		return mode ? mode->GetId() : 0;
	}

	inline BMDPixelFormat GetActivePixelFormat() const {return pixelFormat;}

	inline DeckLinkDeviceMode *GetMode() const {return mode;}

	bool StartCapture(DeckLinkDeviceMode *mode);
	bool StopCapture(void);

	HRESULT STDMETHODCALLTYPE VideoInputFrameArrived(
			IDeckLinkVideoInputFrame *videoFrame,
			IDeckLinkAudioInputPacket *audioPacket);
	HRESULT STDMETHODCALLTYPE VideoInputFormatChanged(
			BMDVideoInputFormatChangedEvents events,
			IDeckLinkDisplayMode *newMode,
			BMDDetectedVideoInputFormatFlags detectedSignalFlags);

	ULONG STDMETHODCALLTYPE AddRef(void);
	HRESULT STDMETHODCALLTYPE QueryInterface(REFIID iid, LPVOID *ppv);
	ULONG STDMETHODCALLTYPE Release(void);
};
