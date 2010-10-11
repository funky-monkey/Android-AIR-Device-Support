package nl.funkymonkey.android.support {

	import flash.display.StageOrientation;
	import flash.media.Camera;
	import flash.media.CameraRoll;
	import flash.media.CameraUI;
	import flash.media.Microphone;
	import flash.sensors.Accelerometer;
	import flash.sensors.Geolocation;
	import flash.system.Capabilities;
	import flash.ui.Multitouch;

	/**
	 * Device Support Class
	 * --
	 * Checks if device has specific features that are unique to devices.
	 * 
	 * @author Sidney de Koning {sidney@funky-monkey.nl}
	 */
	public final class DeviceSupport {
		public static function hasCamera():Boolean {
			return Camera.isSupported;
		}

		public static function hasCameraUI():Boolean {
			return CameraUI.isSupported;
		}

		public static function canReadCameraImages():Boolean {
			return CameraRoll.supportsBrowseForImage;
		}

		public static function canWriteCameraImages():Boolean {
			return CameraRoll.supportsAddBitmapData;
		}

		public static function hasMicrophone():Boolean {
			return Microphone.isSupported;
		}

		public static function hasGPS():Boolean {
			return Geolocation.isSupported;
		}

		public static function hasMotionSensor():Boolean {
			return Accelerometer.isSupported;
		}

		public static function hasMultiTouch():Boolean {
			return Multitouch.supportsTouchEvents;
		}

		public static function touchscreenType():String {
			return ( hasMultiTouch() ) ? Capabilities.touchscreenType : "None";
		}

		public static function hasOrientationChange():Boolean {
			return (StageOrientation.DEFAULT) ? true : false;
		}

		public static function playerType():String {
			return Capabilities.playerType;
		}

		public static function getScreenResolution():ScreenResolution {
			return new ScreenResolution();
		}

		public static function showSupportedFeatures():String {
			return "Device Features: \n" + "Camera : " + hasCamera() + ", " + "Has Camera UI : " + hasCameraUI() + ", " + "Can Read Camera Images :" + canReadCameraImages() + ", " + "Can Write Camera Images:" + canWriteCameraImages() + ", " + "Has Microphone :" + hasMicrophone() + ", " + "Has GPS :" + hasGPS() + ", " + "Has Accelerometer :" + hasMotionSensor() + ", " + "Has Multitouch capabilities :" + hasMultiTouch() + ", " + "Flash Player Type :" + playerType() + ", " + "Screen size :" + getScreenResolution().maxWidth + " x " + getScreenResolution().maxHeight + ", ";
		}
	}
}

import flash.system.Capabilities;

internal class ScreenResolution  {
	
	public function get maxWidth():int {
		return Capabilities.screenResolutionX;
	}
	
	public function get maxHeight():int {
		return Capabilities.screenResolutionY;
	}

}
