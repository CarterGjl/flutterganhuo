package com.example.flutterlearning

import android.content.Intent
import android.os.Bundle
import android.util.Base64
import android.widget.Button
import androidx.appcompat.app.AppCompatActivity
import io.flutter.FlutterInjector
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.FlutterEngineGroup
import io.flutter.embedding.engine.dart.DartExecutor

class Main1Activity : AppCompatActivity() {
    private val topMain = "topMain"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val flutterEngineGroup = FlutterEngineGroup(this)
        val dartEntrypoint = DartExecutor.DartEntrypoint(
            FlutterInjector.instance().flutterLoader().findAppBundlePath
                (), topMain
        )
        val createAndRunEngine1 = flutterEngineGroup.createAndRunEngine(this, DartExecutor.DartEntrypoint.createDefault())
        val createAndRunEngine = flutterEngineGroup.createAndRunEngine(this, dartEntrypoint)
        FlutterEngineCache.getInstance().put(topMain,createAndRunEngine)
        FlutterEngineCache.getInstance().put("default_engine_id",createAndRunEngine1)
        setContentView(R.layout.activity_main1)
        findViewById<Button>(R.id.buttonPanel).setOnClickListener {
            startActivity(
                Intent(this,SingleFlutterActivity::class.java).apply {
                    action = "meeting_feedback"
                    putExtra("route","/")
                }
//                FlutterActivity.withCachedEngine(topMain)
//                    .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
//                    .build(this)
            )
        }

        findViewById<Button>(R.id.buttonPanel1).setOnClickListener {
            val encodeToString = Base64.encodeToString("abc".toByteArray(), Base64.NO_WRAP)
            startActivity(
                Intent(this, SingleFlutterActivity::class.java).apply {
                    action = "meeting_feedback"
                    putExtra("route", "meeting_feedback?msg=1&type=$encodeToString")
                }
//                FlutterActivity.withCachedEngine("default_engine_id").build(this)
            )

        }
    }

    override fun overridePendingTransition(enterAnim: Int, exitAnim: Int) {
        super.overridePendingTransition(R.anim.activity_open, R.anim.activity_end)
    }
}