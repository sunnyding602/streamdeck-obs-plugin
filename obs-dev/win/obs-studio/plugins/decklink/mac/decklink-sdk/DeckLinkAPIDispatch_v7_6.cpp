/* -LICENSE-START-
** Copyright (c) 2009 Blackmagic Design
**
** Permission is hereby granted, free of charge, to any person or organization
** obtaining a copy of the software and accompanying documentation covered by
** this license (the "Software") to use, reproduce, display, distribute,
** execute, and transmit the Software, and to prepare derivative works of the
** Software, and to permit third-parties to whom the Software is furnished to
** do so, all subject to the following:
**
** The copyright notices in the Software and this entire statement, including
** the above license grant, this restriction and the following disclaimer,
** must be included in all copies of the Software, in whole or in part, and
** all derivative works of the Software, unless such copies or derivative
** works are solely in the form of machine-executable object code generated by
** a source language processor.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
** IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
** FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
** SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
** FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
** ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
** DEALINGS IN THE SOFTWARE.
** -LICENSE-END-
*/
/* DeckLinkAPIDispatch_v7_6.cpp */

#include "DeckLinkAPI_v7_6.h"
#include <pthread.h>

#define kDeckLinkAPI_BundlePath "/Library/Frameworks/DeckLinkAPI.framework"

typedef IDeckLinkIterator* (*CreateIteratorFunc_v7_6)(void);
typedef IDeckLinkGLScreenPreviewHelper_v7_6* (*CreateOpenGLScreenPreviewHelperFunc_v7_6)(void);
typedef IDeckLinkCocoaScreenPreviewCallback_v7_6* (*CreateCocoaScreenPreviewFunc_v7_6)(void*);
typedef IDeckLinkVideoConversion_v7_6* (*CreateVideoConversionInstanceFunc_v7_6)(void);

static pthread_once_t								gDeckLinkOnceControl		= PTHREAD_ONCE_INIT;
static CFBundleRef									gBundleRef					= NULL;
static CreateIteratorFunc_v7_6						gCreateIteratorFunc			= NULL;
static CreateOpenGLScreenPreviewHelperFunc_v7_6		gCreateOpenGLPreviewFunc	= NULL;
static CreateCocoaScreenPreviewFunc_v7_6			gCreateCocoaPreviewFunc		= NULL;
static CreateVideoConversionInstanceFunc_v7_6		gCreateVideoConversionFunc	= NULL;


void	InitDeckLinkAPI_v7_6 (void)
{
	CFURLRef		bundleURL;

	bundleURL = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, CFSTR(kDeckLinkAPI_BundlePath), kCFURLPOSIXPathStyle, true);
	if (bundleURL != NULL)
	{
		gBundleRef = CFBundleCreate(kCFAllocatorDefault, bundleURL);
		if (gBundleRef != NULL)
		{
			gCreateIteratorFunc = (CreateIteratorFunc_v7_6)CFBundleGetFunctionPointerForName(gBundleRef, CFSTR("CreateDeckLinkIteratorInstance"));
			gCreateOpenGLPreviewFunc = (CreateOpenGLScreenPreviewHelperFunc_v7_6)CFBundleGetFunctionPointerForName(gBundleRef, CFSTR("CreateOpenGLScreenPreviewHelper"));
			gCreateCocoaPreviewFunc = (CreateCocoaScreenPreviewFunc_v7_6)CFBundleGetFunctionPointerForName(gBundleRef, CFSTR("CreateCocoaScreenPreview"));
			gCreateVideoConversionFunc = (CreateVideoConversionInstanceFunc_v7_6)CFBundleGetFunctionPointerForName(gBundleRef, CFSTR("CreateVideoConversionInstance"));
		}
		CFRelease(bundleURL);
	}
}

IDeckLinkIterator*		CreateDeckLinkIteratorInstance_v7_6 (void)
{
	pthread_once(&gDeckLinkOnceControl, InitDeckLinkAPI_v7_6);

	if (gCreateIteratorFunc == NULL)
		return NULL;

	return gCreateIteratorFunc();
}

IDeckLinkGLScreenPreviewHelper_v7_6*		CreateOpenGLScreenPreviewHelper_v7_6 (void)
{
	pthread_once(&gDeckLinkOnceControl, InitDeckLinkAPI_v7_6);

	if (gCreateOpenGLPreviewFunc == NULL)
		return NULL;

	return gCreateOpenGLPreviewFunc();
}

IDeckLinkCocoaScreenPreviewCallback_v7_6*	CreateCocoaScreenPreview_v7_6 (void* parentView)
{
	pthread_once(&gDeckLinkOnceControl, InitDeckLinkAPI_v7_6);

	if (gCreateCocoaPreviewFunc == NULL)
		return NULL;

	return gCreateCocoaPreviewFunc(parentView);
}

IDeckLinkVideoConversion_v7_6* CreateVideoConversionInstance_v7_6 (void)
{
	pthread_once(&gDeckLinkOnceControl, InitDeckLinkAPI_v7_6);

	if (gCreateVideoConversionFunc == NULL)
		return NULL;

	return gCreateVideoConversionFunc();
}

