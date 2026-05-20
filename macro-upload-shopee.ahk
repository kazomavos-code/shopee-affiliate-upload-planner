#Requires AutoHotkey v2.0
#SingleInstance Force

; Shopee Affiliate Upload Planner - macro semi-otomatis.
; Aman: tidak menyimpan password, OTP, cookie, atau session.
; Pakai setelah menekan tombol "Copy paket" di tool web.

global ShopeeUrl := "https://affiliate.shopee.co.id/"
global PackageText := ""
global Fields := Map(
  "title", "",
  "account", "",
  "brand", "",
  "email", "",
  "video", "",
  "schedule", "",
  "link", "",
  "caption", "",
  "hashtags", ""
)

^!s::OpenShopee()
^!r::ReadPackageFromClipboard()
^!1::CopyField("title", "Judul")
^!2::CopyField("caption", "Caption")
^!3::CopyField("hashtags", "Hashtag")
^!4::CopyField("link", "Link affiliate")
^!5::CopyField("video", "Nama video")
^!v::PasteClipboard()
^!h::ShowHelp()

OpenShopee() {
  global ShopeeUrl
  Run ShopeeUrl
}

ReadPackageFromClipboard() {
  global PackageText, Fields
  PackageText := A_Clipboard

  if !PackageText {
    MsgBox "Clipboard kosong. Klik tombol Copy paket di tool dulu.", "Macro Shopee", "Icon!"
    return
  }

  Fields["title"] := ReadLineValue(PackageText, "Judul:")
  Fields["account"] := ReadLineValue(PackageText, "Akun:")
  Fields["brand"] := ReadLineValue(PackageText, "Brand:")
  Fields["email"] := ReadLineValue(PackageText, "Email kontak:")
  Fields["video"] := ReadLineValue(PackageText, "Video:")
  Fields["schedule"] := ReadLineValue(PackageText, "Jadwal:")
  Fields["link"] := ReadLineValue(PackageText, "Link affiliate:")
  Fields["hashtags"] := ReadHashTags(PackageText)
  Fields["caption"] := ReadCaption(PackageText, Fields["hashtags"])

  MsgBox "Paket upload sudah dibaca.`n`nCtrl+Alt+1 Judul`nCtrl+Alt+2 Caption`nCtrl+Alt+3 Hashtag`nCtrl+Alt+4 Link`nCtrl+Alt+5 Nama video`nCtrl+Alt+V Paste", "Macro Shopee", "Iconi"
}

ReadLineValue(text, label) {
  for line in StrSplit(text, "`n", "`r") {
    trimmed := Trim(line)
    if InStr(trimmed, label) = 1 {
      return Trim(SubStr(trimmed, StrLen(label) + 1))
    }
  }
  return ""
}

ReadHashTags(text) {
  for line in StrSplit(text, "`n", "`r") {
    trimmed := Trim(line)
    if InStr(trimmed, "#") = 1 {
      return trimmed
    }
  }
  return ""
}

ReadCaption(text, hashtags) {
  lines := StrSplit(text, "`n", "`r")
  captionLines := []
  inBody := false

  for line in lines {
    trimmed := Trim(line)

    if !inBody {
      if trimmed = "" {
        inBody := true
      }
      continue
    }

    if trimmed = "" || trimmed = hashtags || InStr(trimmed, "#") = 1 {
      continue
    }

    captionLines.Push(trimmed)
  }

  return JoinLines(captionLines)
}

JoinLines(lines) {
  output := ""
  for line in lines {
    output .= (output ? "`n" : "") . line
  }
  return output
}

CopyField(key, label) {
  global Fields
  value := Fields[key]

  if !value {
    MsgBox label " belum ada. Tekan Ctrl+Alt+R setelah Copy paket dari tool.", "Macro Shopee", "Icon!"
    return
  }

  A_Clipboard := value
  ToolTip label " dicopy"
  SetTimer () => ToolTip(), -900
}

PasteClipboard() {
  Send "^v"
}

ShowHelp() {
  MsgBox "Hotkey Macro Shopee:`n`nCtrl+Alt+S  Buka Shopee Affiliate`nCtrl+Alt+R  Baca paket dari clipboard`nCtrl+Alt+1  Copy judul`nCtrl+Alt+2  Copy caption`nCtrl+Alt+3  Copy hashtag`nCtrl+Alt+4  Copy link affiliate`nCtrl+Alt+5  Copy nama video`nCtrl+Alt+V  Paste ke field aktif`nCtrl+Alt+H  Bantuan", "Macro Shopee"
}
