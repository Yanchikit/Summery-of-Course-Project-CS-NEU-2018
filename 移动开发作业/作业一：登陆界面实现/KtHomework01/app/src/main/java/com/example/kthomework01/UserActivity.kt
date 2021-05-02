package com.example.kthomework01

import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.appcompat.app.AppCompatActivity
import com.example.kthomework01.util.ToastUtil
import kotlinx.android.synthetic.main.activity_user.*
import kotlin.system.exitProcess

class UserActivity : AppCompatActivity() {

    private var msg_username: String? = null
    private var msg_password: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_user)
        // 接受信息

        // 接受信息
        val intent = intent
        msg_username = intent.getStringExtra("username")!!
        msg_password = intent.getStringExtra("password")!!

        // 输出登录信息
        username.hint = "我是$msg_username"
        password.hint = "我的密码是$msg_password"


        // 按钮
        button_change.setOnClickListener {
            ToastUtil.showMsg(this@UserActivity, "用户已登出")
            var intent1: Intent? = Intent(this@UserActivity, MainActivity::class.java)
            startActivity(intent1)
            exitProcess(0)
        }
        button_exit.setOnClickListener { exitProcess(0) }
    }
}