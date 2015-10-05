//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

//#import "NSObject.h"

//#import "MPAVMetadataItem.h"

@class AVAsset, AVPlayerItem, AVPlayerItemAccessLog, MPAVController, MPAlternateTextTrack, MPAlternateTracks, MPMediaItem, MPQueueFeeder, MPStoreDownload, NSArray, NSError, /*NSObject<OS_dispatch_queue>, */NSString, NSURL;

@interface MPAVItem : NSObject /*<MPAVMetadataItem>*/
{
    // AVAsset *_asset;
    // NSObject<OS_dispatch_queue> *_assetQueue;
    // AVPlayerItem *_avPlayerItem;
    // BOOL _isAssetLoaded;
    // MPQueueFeeder *_feeder;
    // MPAVController *_player;
    // float _soundCheckVolumeNormalization;
    // NSArray *_chapterTimeMarkers;
    // NSArray *_artworkTimeMarkers;
    // NSArray *_urlTimeMarkers;
    // NSArray *_closedCaptionTimeMarkers;
    // MPAlternateTracks *_alternateTracks;
    // double _cachedDuration;
    // double _cachedPlayableDuration;
    // NSArray *_cachedSeekableTimeRanges;
    // double _seekableTimeRangesCacheTime;
    // unsigned int _type;
    // float _defaultPlaybackRate;
    // unsigned int _advancedDuringPlayback:1;
    // unsigned int _handledFinishTime:1;
    // unsigned int _hasPlayedThisSession:1;
    // unsigned int _wasCountedAsSkipped:1;
    // unsigned int _isStreamable:2;
    // unsigned int _watchingAttributes:1;
    // unsigned int _userChangedItemsDuringPlayback:1;
    // unsigned int _lyricsAvailable:1;
    // unsigned int _timeMarkersNeedLoading:1;
    // NSObject<OS_dispatch_queue> *_accessQueue;
    // BOOL _hasPostedNaturalSizeChange;
    // BOOL _hasRegisteredForCaptionsAppearanceChanged;
    // BOOL _hasValidPlayerItemDuration;
    // int _likedState;
    // BOOL _limitReadAhead;
    // CDStruct_1b6d18a9 _playerItemDuration;
    // BOOL _didAttemptToLoadAsset;
    // BOOL _canReusePlayerItem;
    // BOOL _likedStateEnabled;
    // BOOL _supportsLikedState;
    // BOOL _allowsAirPlayFromCloud;
    // BOOL _allowsExternalPlayback;
    // float _currentPlaybackRate;
    // NSError *_assetError;
    // id <MPAVItemPlaylistIdentifier> _playlistIdentifier;
    // id <MPAVItemQueueIdentifier> _queueIdentifier;
    // unsigned int _indexInQueueFeeder;
    // NSArray *_buyOffers;
    // NSString *_copyrightText;
    MPMediaItem *_mediaItem;
    // float _loudnessInfoVolumeNormalization;
    // long long _albumStoreID;
    // long long _storeItemInt64ID;
    // long long _storeSubscriptionAdamID;
}

// + (id)URLFromPath:(id)arg1;
// + (void)applyVolumeNormalizationForQueuedItems:(id)arg1;
// + (unsigned int)defaultScaleMode;
// + (void)setDefaultScaleMode:(unsigned int)arg1;
// - (void).cxx_destruct;
// - (void)_applicationDidBecomeActive:(id)arg1;
// - (void)_captionAppearanceSettingsChanged;
// - (void)_checkAllowsBlockingDurationCall;
// - (void)_clearAsset;
// @property(nonatomic, getter=_currentPlaybackRate, setter=_setCurrentPlaybackRate:) float _currentPlaybackRate; // @synthesize _currentPlaybackRate;
// - (void)_currentPlaybackRateDidChange:(float)arg1;
// - (double)_durationFromExternalMetadataIfAvailable;
// - (double)_durationInSeconds;
// - (void)_handleUpdatedLikedState:(int)arg1 completion:(CDUnknownBlockType)arg2;
// - (id)_imageChapterTrackIDsForAsset:(id)arg1;
// - (void)_internalLikedStateDidChangeNotification:(id)arg1;
// - (void)_itemAttributeAvailableKey:(id)arg1;
// - (void)_likedStateDidChange;
// - (void)_loadAssetAndPlayerItem;
// - (void)_loadAssetProperties;
// - (void)_loadMediaItemWithCompletionHandler:(CDUnknownBlockType)arg1;
// - (void)_loadTimeMarkersAsync;
// - (void)_loadTimeMarkersBlocking;
// - (int)_persistedLikedState;
// - (double)_playableDurationForLoadedTimeRanges:(id)arg1;
// @property(readonly, nonatomic) CDStruct_1b6d18a9 _playerItemDurationIfAvailable;
// - (void)_playerItemNewAccessLogEntryNotification:(id)arg1;
// - (void)_realoadEmbeddedTimeMarkers;
// - (void)_releaseAllTimeMarkers;
// - (id)_seekableTimeRanges;
// - (void)_setListeningForCaptionsAppearanceSettingsChanged:(BOOL)arg1;
// - (void)_setNeedsPersistedLikedStateUpdate;
// - (id)_timeMarkerFromMarkers:(id)arg1 forTime:(double)arg2;
// - (void)_updateSoundCheckVolumeNormalizationForPlayerItem;
// - (void)_willBecomeActivePlayerItem;
// - (void)_willResignActivePlayerItem;
// @property(readonly, nonatomic) AVPlayerItemAccessLog *accessLog;
// @property(readonly, copy, nonatomic) NSString *aggregateDictionaryItemIdentifier;
// @property(readonly, nonatomic) NSString *album;
// @property(readonly, nonatomic) NSString *albumArtist;
// @property(readonly, nonatomic) long long albumStoreID; // @synthesize albumStoreID=_albumStoreID;
// @property(readonly, nonatomic) unsigned int albumTrackCount;
// @property(readonly, nonatomic) unsigned int albumTrackNumber;
// @property(readonly, nonatomic) BOOL allowsAirPlayFromCloud; // @synthesize allowsAirPlayFromCloud=_allowsAirPlayFromCloud;
// @property(readonly, nonatomic) BOOL allowsEQ;
// @property(readonly, nonatomic) BOOL allowsExternalPlayback; // @synthesize allowsExternalPlayback=_allowsExternalPlayback;
// @property(readonly, nonatomic) MPAlternateTracks *alternateTracks; // @synthesize alternateTracks=_alternateTracks;
// - (unsigned int)alternatesCountForTypes:(unsigned int)arg1;
// - (void)applyVolumeNormalizationWithSoundCheckEnabled:(BOOL)arg1;
    @property(readonly, nonatomic) NSString *artist;
// - (id)artworkCatalogForPlaybackTime:(double)arg1;
// - (id)artworkTimeMarkerForTime:(double)arg1;
// @property(retain, nonatomic) NSArray *artworkTimeMarkers; // @synthesize artworkTimeMarkers=_artworkTimeMarkers;
// @property(readonly, nonatomic) AVAsset *asset;
// @property(retain, nonatomic) NSError *assetError; // @synthesize assetError=_assetError;
// - (CDUnknownBlockType)blockForDirectAVControllerNotificationReferencingItem:(id)arg1;
// @property(readonly, copy, nonatomic) NSArray *buyOffers; // @synthesize buyOffers=_buyOffers;
// @property(readonly, nonatomic) BOOL canReusePlayerItem; // @synthesize canReusePlayerItem=_canReusePlayerItem;
// @property(readonly, nonatomic) BOOL canSeedGenius;
// - (id)chapterTimeMarkerForTime:(double)arg1;
// @property(retain, nonatomic) NSArray *chapterTimeMarkers; // @synthesize chapterTimeMarkers=_chapterTimeMarkers;
// - (id)closedCaptionTimeMarkerForTime:(double)arg1;
// @property(retain, nonatomic) NSArray *closedCaptionTimeMarkers;
// @property(readonly, nonatomic) NSString *composer;
// @property(readonly, copy, nonatomic) NSString *copyrightText; // @synthesize copyrightText=_copyrightText;
// @property(readonly, nonatomic) double currentTimeDisplayOverride;
// @property(readonly, nonatomic) int customAVEQPreset;
// - (void)dealloc;
// @property(nonatomic) float defaultPlaybackRate; // @synthesize defaultPlaybackRate=_defaultPlaybackRate;
// @property(readonly, nonatomic) BOOL didAttemptToLoadAsset; // @synthesize didAttemptToLoadAsset=_didAttemptToLoadAsset;
// @property(readonly, nonatomic) unsigned int discCount;
// @property(readonly, nonatomic) unsigned int discNumber;
 @property(readonly, nonatomic) NSString *displayableText;
 @property(readonly, nonatomic) BOOL displayableTextLoaded;
// @property(readonly, nonatomic) CDStruct_1b6d18a9 duration;
// @property(readonly, nonatomic) double durationFromExternalMetadata;
// @property(readonly, nonatomic) double durationIfAvailable;
// - (double)durationInSeconds;
// @property(readonly, nonatomic) BOOL durationIsValid;
// @property(nonatomic) __weak MPQueueFeeder *feeder; // @synthesize feeder=_feeder;
// - (void)flushNowPlayingCaches;
// @property(nonatomic) CDStruct_1b6d18a9 forwardPlaybackEndTime;
// @property(readonly, nonatomic) NSString *genre;
// - (BOOL)hasAlternatesForTypes:(unsigned int)arg1;
// - (BOOL)hasDataForItemArtwork;
 @property(readonly, nonatomic) BOOL hasDisplayableText;
// @property(nonatomic) BOOL hasPlayedThisSession;
// - (id)inBandAlternateTextTracks;
// @property(nonatomic) unsigned int indexInQueueFeeder; // @synthesize indexInQueueFeeder=_indexInQueueFeeder;
// - (id)init;
// - (id)initWithAsset:(id)arg1;
// - (id)initWithPlayerItem:(id)arg1;
// - (id)initWithURL:(id)arg1;
// - (id)initWithURL:(id)arg1 options:(id)arg2;
// @property(readonly, nonatomic) BOOL isAd;
// @property(readonly, nonatomic) BOOL isAlwaysLive;
// @property BOOL isAssetLoaded; // @synthesize isAssetLoaded=_isAssetLoaded;
// - (BOOL)isAssetURLValid;
@property(readonly, nonatomic) BOOL isCloudItem;
// @property(readonly, nonatomic, getter=isExplicitTrack) BOOL explicitTrack;
// @property(readonly, nonatomic, getter=isLikedStateEnabled) BOOL likedStateEnabled; // @synthesize likedStateEnabled=_likedStateEnabled;
// @property(readonly, nonatomic, getter=isStreamable) BOOL streamable;
// @property(readonly, nonatomic) BOOL isStreamingLowQualityAsset;
// - (BOOL)isSupportedDefaultPlaybackSpeed:(unsigned int)arg1;
// - (BOOL)isValidPlayerSubstituteForItem:(id)arg1;
// @property(nonatomic) int likedState;
// @property(nonatomic) BOOL limitReadAhead;
// - (void)loadAssetAndPlayerItem;
// - (id)localeForAssetTrack:(id)arg1;
// - (id)localizedAttributedPositionInPlaylistStringWithRegularTextAttributes:(id)arg1 emphasizedTextAttributes:(id)arg2;
// @property(readonly, nonatomic) NSString *localizedPositionInPlaylistString;
// @property(nonatomic) float loudnessInfoVolumeNormalization; // @synthesize loudnessInfoVolumeNormalization=_loudnessInfoVolumeNormalization;
 @property(readonly, nonatomic) NSString *lyrics;
    @property(readonly, nonatomic) NSString *mainTitle;
// @property(readonly, retain, nonatomic) MPMediaItem *mediaItem; // @synthesize mediaItem=_mediaItem;
// @property(readonly, nonatomic) struct CGSize naturalSize;
// - (void)notePlaybackFinishedByHittingEnd;
// - (void)observeValueForKeyPath:(id)arg1 ofObject:(id)arg2 change:(id)arg3 context:(void *)arg4;
// - (id)path;
// @property(readonly, nonatomic) unsigned long long persistentID;
// @property(readonly, nonatomic) double playableDuration;
// @property(readonly, nonatomic) double playableDurationIfAvailable;
// @property(nonatomic) double playbackCheckpointCurrentTime;
// - (float)playbackRateForLevel:(unsigned int)arg1 direction:(int)arg2 paused:(BOOL)arg3;
// @property(nonatomic) __weak MPAVController *player; // @synthesize player=_player;
// @property(retain, nonatomic) AVPlayerItem *playerItem;
// @property(retain, nonatomic) id <MPAVItemPlaylistIdentifier> playlistIdentifier; // @synthesize playlistIdentifier=_playlistIdentifier;
// @property(readonly, nonatomic) NSURL *podcastURL;
// - (void)prepareForRate:(float)arg1 completionHandler:(CDUnknownBlockType)arg2;
// @property(readonly, nonatomic) struct CGSize presentationSize;
// @property(retain, nonatomic) id <MPAVItemQueueIdentifier> queueIdentifier; // @synthesize queueIdentifier=_queueIdentifier;
// - (void)reevaluateType;
// - (void)replaceOutOfBandAlternateTextTracksWithArray:(id)arg1;
// - (void)replacePlayerItemWithPlayerItem:(id)arg1;
// - (void)resetBookkeeping;
// - (float)scanIntervalForLevel:(unsigned int)arg1 paused:(BOOL)arg2;
// @property(retain, nonatomic) MPAlternateTextTrack *selectedAlternateTextTrack;
// - (void)setAlternateAudioTrackID:(int)arg1;
// - (void)setOverrideDuration:(double)arg1;
// - (void)setPlaybackFinishedTime:(double)arg1;
// - (void)setPlaybackStoppedTime:(double)arg1;
// - (void)setRating:(float)arg1;
// @property(nonatomic) float soundCheckVolumeNormalization; // @synthesize soundCheckVolumeNormalization=_soundCheckVolumeNormalization;
// - (void)setSubtitleTrackID:(int)arg1;
// @property(retain, nonatomic) NSArray *urlTimeMarkers; // @synthesize urlTimeMarkers=_urlTimeMarkers;
// @property(nonatomic) BOOL userAdvancedDuringPlayback;
// @property(nonatomic) BOOL userChangedItemsDuringPlayback;
// @property(nonatomic) BOOL userSkippedPlayback;
// - (void)setupEQPresetWithDefaultPreset:(int)arg1;
// - (void)setupPlaybackInfo;
// @property(readonly, nonatomic) int status;
// @property(readonly, nonatomic) MPStoreDownload *storeDownload;
// @property(readonly, nonatomic) NSString *storeItemID;
// @property(readonly, nonatomic) long long storeItemInt64ID; // @synthesize storeItemInt64ID=_storeItemInt64ID;
// @property(readonly, nonatomic) long long storeSubscriptionAdamID; // @synthesize storeSubscriptionAdamID=_storeSubscriptionAdamID;
// - (int)subtitleTrackID;
// @property(readonly, nonatomic) BOOL supportsLikedState; // @synthesize supportsLikedState=_supportsLikedState;
// @property(readonly, nonatomic) BOOL supportsRewindAndFastForward15Seconds;
// @property(readonly, nonatomic) BOOL supportsSettingCurrentTime;
// @property(readonly, nonatomic) BOOL supportsSkip;
// @property(readonly, nonatomic) double timeOfSeekableEnd;
// @property(readonly, nonatomic) double timeOfSeekableStart;
// @property(readonly, nonatomic) NSArray *timedMetadataIfAvailable;
// - (id)titlesForTime:(double)arg1;
// @property(readonly, nonatomic) unsigned int type;
// - (id)url;
// - (id)urlTimeMarkerForTime:(double)arg1;
// @property(readonly, nonatomic) BOOL useEmbeddedChapterData;
// @property(readonly, nonatomic) float userRating;
// @property(readonly, nonatomic) BOOL usesSubscriptionLease;

// // Remaining properties
// @property(readonly, copy) NSString *debugDescription;
// @property(readonly, copy) NSString *description;
// @property(readonly) unsigned int hash;
// @property(readonly) Class superclass;

@end
