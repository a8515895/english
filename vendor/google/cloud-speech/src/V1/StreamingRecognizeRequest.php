<?php
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: google/cloud/speech/v1/cloud_speech.proto

namespace Google\Cloud\Speech\V1;

use Google\Protobuf\Internal\GPBType;
use Google\Protobuf\Internal\RepeatedField;
use Google\Protobuf\Internal\GPBUtil;

/**
 * The top-level message sent by the client for the `StreamingRecognize` method.
 * Multiple `StreamingRecognizeRequest` messages are sent. The first message
 * must contain a `streaming_config` message and must not contain `audio` data.
 * All subsequent messages must contain `audio` data and must not contain a
 * `streaming_config` message.
 *
 * Generated from protobuf message <code>google.cloud.speech.v1.StreamingRecognizeRequest</code>
 */
class StreamingRecognizeRequest extends \Google\Protobuf\Internal\Message
{
    protected $streaming_request;

    /**
     * Constructor.
     *
     * @param array $data {
     *     Optional. Data for populating the Message object.
     *
     *     @type \Google\Cloud\Speech\V1\StreamingRecognitionConfig $streaming_config
     *           Provides information to the recognizer that specifies how to process the
     *           request. The first `StreamingRecognizeRequest` message must contain a
     *           `streaming_config`  message.
     *     @type string $audio_content
     *           The audio data to be recognized. Sequential chunks of audio data are sent
     *           in sequential `StreamingRecognizeRequest` messages. The first
     *           `StreamingRecognizeRequest` message must not contain `audio_content` data
     *           and all subsequent `StreamingRecognizeRequest` messages must contain
     *           `audio_content` data. The audio bytes must be encoded as specified in
     *           `RecognitionConfig`. Note: as with all bytes fields, protobuffers use a
     *           pure binary representation (not base64). See
     *           [content limits](/speech-to-text/quotas#content).
     * }
     */
    public function __construct($data = NULL) {
        \GPBMetadata\Google\Cloud\Speech\V1\CloudSpeech::initOnce();
        parent::__construct($data);
    }

    /**
     * Provides information to the recognizer that specifies how to process the
     * request. The first `StreamingRecognizeRequest` message must contain a
     * `streaming_config`  message.
     *
     * Generated from protobuf field <code>.google.cloud.speech.v1.StreamingRecognitionConfig streaming_config = 1;</code>
     * @return \Google\Cloud\Speech\V1\StreamingRecognitionConfig
     */
    public function getStreamingConfig()
    {
        return $this->readOneof(1);
    }

    /**
     * Provides information to the recognizer that specifies how to process the
     * request. The first `StreamingRecognizeRequest` message must contain a
     * `streaming_config`  message.
     *
     * Generated from protobuf field <code>.google.cloud.speech.v1.StreamingRecognitionConfig streaming_config = 1;</code>
     * @param \Google\Cloud\Speech\V1\StreamingRecognitionConfig $var
     * @return $this
     */
    public function setStreamingConfig($var)
    {
        GPBUtil::checkMessage($var, \Google\Cloud\Speech\V1\StreamingRecognitionConfig::class);
        $this->writeOneof(1, $var);

        return $this;
    }

    /**
     * The audio data to be recognized. Sequential chunks of audio data are sent
     * in sequential `StreamingRecognizeRequest` messages. The first
     * `StreamingRecognizeRequest` message must not contain `audio_content` data
     * and all subsequent `StreamingRecognizeRequest` messages must contain
     * `audio_content` data. The audio bytes must be encoded as specified in
     * `RecognitionConfig`. Note: as with all bytes fields, protobuffers use a
     * pure binary representation (not base64). See
     * [content limits](/speech-to-text/quotas#content).
     *
     * Generated from protobuf field <code>bytes audio_content = 2;</code>
     * @return string
     */
    public function getAudioContent()
    {
        return $this->readOneof(2);
    }

    /**
     * The audio data to be recognized. Sequential chunks of audio data are sent
     * in sequential `StreamingRecognizeRequest` messages. The first
     * `StreamingRecognizeRequest` message must not contain `audio_content` data
     * and all subsequent `StreamingRecognizeRequest` messages must contain
     * `audio_content` data. The audio bytes must be encoded as specified in
     * `RecognitionConfig`. Note: as with all bytes fields, protobuffers use a
     * pure binary representation (not base64). See
     * [content limits](/speech-to-text/quotas#content).
     *
     * Generated from protobuf field <code>bytes audio_content = 2;</code>
     * @param string $var
     * @return $this
     */
    public function setAudioContent($var)
    {
        GPBUtil::checkString($var, False);
        $this->writeOneof(2, $var);

        return $this;
    }

    /**
     * @return string
     */
    public function getStreamingRequest()
    {
        return $this->whichOneof("streaming_request");
    }

}

