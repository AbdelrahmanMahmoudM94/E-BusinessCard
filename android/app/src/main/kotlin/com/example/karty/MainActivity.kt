package com.diyar.eBusinessCard.dev

import io.flutter.embedding.android.FlutterActivity
import java.util.Base64
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.security.KeyFactory
import java.security.spec.X509EncodedKeySpec
import java.text.SimpleDateFormat
import java.util.Date
import javax.crypto.Cipher

class MainActivity: FlutterActivity() {
     private val CHANNEL = "com.diyar.eBusinessCard.dev/encrypt"

     override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
          super.configureFlutterEngine(flutterEngine)
          MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                    call, result ->
              if (call.method == "encryptData") {
                  val data = call.argument<String>("data")
                  val publicKeyBase64 = call.argument<String>("publicKeyBase64")
                  if (data != null && publicKeyBase64 != null) {
                      try {
                          val encryptedData = encryptData(data, publicKeyBase64)
                          result.success(encryptedData)
                      } catch (e: Exception) {
                          result.error("ENCRYPTION_ERROR", "Failed to encrypt data", null)
                      }
                  } else {
                      result.error("INVALID_ARGUMENTS", "Arguments were null", null)
                  }
              }
          }
     }

    private fun encryptData(data: String?, publicKeyBase64: String): String {
          // Convert the provided public key (in Base64) to a PublicKey object
          val publicKeyBytes = Base64.getDecoder().decode(publicKeyBase64)
          val publicKeySpec = X509EncodedKeySpec(publicKeyBytes)
          val keyFactory = KeyFactory.getInstance("RSA")
          val publicKey = keyFactory.generatePublic(publicKeySpec)

          // Create a Cipher instance for RSA encryption
          val cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding")

          // Initialize the cipher with the public key for encryption
          cipher.init(Cipher.ENCRYPT_MODE, publicKey)

          // Generate the current timestamp in the format "yyyyMMddHHmmss"
          val dateFormat = SimpleDateFormat("yyyyMMddHHmmss")
          val timestamp = dateFormat.format(Date())

          // Combine email, timestamp, and "#" delimiter
          val dataToEncrypt = "$data#$timestamp"

          // Encrypt the data using the RSA public key
          val encryptedBytes = cipher.doFinal(dataToEncrypt.toByteArray())

          // Encode the encrypted bytes as a Base64 string
          return Base64.getEncoder().encodeToString(encryptedBytes)
     }


}
