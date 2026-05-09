Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BHDNycR/2lU1wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 12:49:11 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E274FF5BB
	for <lists+xen-devel@lfdr.de>; Sat, 09 May 2026 12:49:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1304600.1577511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfEQ-0001de-7V; Sat, 09 May 2026 10:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1304600.1577511; Sat, 09 May 2026 10:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wLfEP-0001ap-Uq; Sat, 09 May 2026 10:48:25 +0000
Received: by outflank-mailman (input) for mailman id 1304600;
 Sat, 09 May 2026 10:48:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>) id 1wLfEN-0001aT-OQ
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 10:48:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wLfEN-0010Ja-5Y
 for xen-devel@lists.xenproject.org; Sat, 09 May 2026 12:48:23 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10a2-e002-0a2a0a5209dd-0a2a4504db1e-46
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:23 +0200
Received: from [49.212.243.89] (helo=www3579.sakura.ne.jp)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <odaki@rsg.ci.i.u-tokyo.ac.jp>)
 id 69ff10f4-1dec-0a2a45040019-31d4f359d609-3
 for <xen-devel@lists.xenproject.org>; Sat, 09 May 2026 12:48:22 +0200
Received: from h183.csg.ci.i.u-tokyo.ac.jp (h183.csg.ci.i.u-tokyo.ac.jp
 [133.11.54.183]) (authenticated bits=0)
 by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 649AlY2R090834
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 9 May 2026 19:48:03 +0900 (JST)
 (envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=temperror header.s=rs20250326 header.d=rsg.ci.i.u-tokyo.ac.jp header.i="@rsg.ci.i.u-tokyo.ac.jp"
DKIM-Signature: a=rsa-sha256; bh=1HZL/g+SoS2O30ERYe2Yb6nxo7jFOLr4qDArV1Di8vs=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-Id:To:Subject:Date;
        s=rs20250326; t=1778323683; v=1;
        b=t78Qg2FX6fQPQYjv6ccpjNB5PHM57Z7vH/sFNvFVepBntRbIzBYVxDoFA4Z8zcUH
         yNwbFuM/ho+hh5SZ7tf+Lkfd6Wii0FvKwt2Neo7Zxyyjj0CPtZ4hhs+44YPVNLLd
         H36Sm6ApZio0GZOtvJjE7gfl/iPNr1pEm9G79xaqieF17GWnxd4PNKVHVkqEn2ls
         /0VUSq1OHHAEnBbOUVdWr/eFNLlH0fNvZTrUrycauuM0c2twgV+IGere0olLlQui
         J1WlwuqN0kKbylZVRId1EEn/7T+bo86HLmzUhdvkZ04CYAklhxjCBTPvbnydSqGn
         /+uvgM+9RWPYf4U/G5z4Iw==
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Date: Sat, 09 May 2026 19:34:38 +0900
Subject: [PATCH RFC 26/28] qemu-keymap: Use Linux key codes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260509-input-v1-26-66f18d2edde6@rsg.ci.i.u-tokyo.ac.jp>
References: <20260509-input-v1-0-66f18d2edde6@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <20260509-input-v1-0-66f18d2edde6@rsg.ci.i.u-tokyo.ac.jp>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Jan Kiszka <jan.kiszka@web.de>,
        Peter Maydell <peter.maydell@linaro.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Anthony PERARD <anthony@xenproject.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Thomas Huth <th.huth+qemu@posteo.eu>,
        =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
        qemu-arm@nongnu.org, xen-devel@lists.xenproject.org,
        qemu-ppc@nongnu.org,
        =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
X-Mailer: b4 0.16-dev-16047
X-Developer-Signature: v=1; a=openpgp-sha256; l=4832;
 i=odaki@rsg.ci.i.u-tokyo.ac.jp; h=from:subject:message-id;
 bh=gcrDwacqS5bkEtnqJY5QTRr0nAfP9KdzJWUdu+r+4i4=;
 b=owGbwMvMwCWmMbc20y1CyJDxtFoSQ+Z/gdv2pyc8enzc0iTzyvf7mQVVX9WD1Rq6ixadzH/JV
 yrMcK6po5SFQYyLQVZMkSWlaDe3RnTtp8KE+BaYOaxMIEMYuDgFYCJC+xn+x7yYeKUtmfn115RK
 3xvJgtvLP+5/9FLHS22im/b1xpj4EIb/gfX6z9rXXG/80tV+1W2F992I945mHGvOMaadZLTVPBL
 LDwA=
X-Developer-Key: i=odaki@rsg.ci.i.u-tokyo.ac.jp; a=openpgp;
 fpr=AEDC03C9AF734F2EC26A7BFFA4BAEAA73536753C
X-purgate-ID: tlsNG-ebf023/1778323703-42B633FF-F2E52775/0/0
X-purgate-type: clean
X-purgate-size: 4834
X-Rspamd-Queue-Id: 45E274FF5BB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[u-tokyo.ac.jp : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:qemu-devel@nongnu.org,m:marcandre.lureau@redhat.com,m:pbonzini@redhat.com,m:jan.kiszka@web.de,m:peter.maydell@linaro.org,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:mark.cave-ayland@ilande.co.uk,m:kraxel@redhat.com,m:mst@redhat.com,m:th.huth+qemu@posteo.eu,m:alex.bennee@linaro.org,m:qemu-arm@nongnu.org,m:xen-devel@lists.xenproject.org,m:qemu-ppc@nongnu.org,m:philmd@linaro.org,m:odaki@rsg.ci.i.u-tokyo.ac.jp,m:edgariglesias@gmail.com,m:th.huth@posteo.eu,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_PERMFAIL(0.00)[rsg.ci.i.u-tokyo.ac.jp:s=rs20250326];
	DBL_BLOCKED_OPENRESOLVER(0.00)[u-tokyo.ac.jp:email,qcode.data:url];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[redhat.com,web.de,linaro.org,kernel.org,xenproject.org,gmail.com,ilande.co.uk,posteo.eu,nongnu.org,lists.xenproject.org,rsg.ci.i.u-tokyo.ac.jp];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[rsg.ci.i.u-tokyo.ac.jp:~];
	NEURAL_SPAM(0.00)[0.843];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[odaki@rsg.ci.i.u-tokyo.ac.jp,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel,qemu];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

QemuInputEvent now stores Linux key codes for key events. Use those
codes directly instead of translating between internal key code
representations.

Signed-off-by: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
---
 qemu-keymap.c | 41 ++++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/qemu-keymap.c b/qemu-keymap.c
index d4dccf456ef3..d63b6be8ce32 100644
--- a/qemu-keymap.c
+++ b/qemu-keymap.c
@@ -11,6 +11,7 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/notify.h"
+#include "standard-headers/linux/input-event-codes.h"
 #include "ui/input.h"
 
 #include <xkbcommon/xkbcommon.h>
@@ -32,19 +33,17 @@ static FILE *outfile;
 
 /* ------------------------------------------------------------------------ */
 
-static uint32_t qcode_to_number(uint32_t qcode)
+static uint32_t linux_to_number(uint32_t lnx)
 {
-    KeyValue keyvalue;
     uint32_t number;
 
-    keyvalue.type = KEY_VALUE_KIND_QCODE;
-    keyvalue.u.qcode.data = qcode;
-    number = qemu_input_key_value_to_number(&keyvalue);
+    assert(lnx < qemu_input_map_linux_to_qnum_len);
+    number = qemu_input_map_linux_to_qnum[lnx];
     assert(number != 0);
     return number;
 }
 
-static void print_sym(xkb_keysym_t sym, uint32_t qcode, const char *mod)
+static void print_sym(xkb_keysym_t sym, uint32_t lnx, const char *mod)
 {
     char name[64];
 
@@ -54,7 +53,7 @@ static void print_sym(xkb_keysym_t sym, uint32_t qcode, const char *mod)
     xkb_keysym_get_name(sym, name, sizeof(name));
 
     /* TODO: make ui/keymap.c parser accept QKeyCode names */
-    fprintf(outfile, "%s 0x%02x%s\n", name, qcode_to_number(qcode), mod);
+    fprintf(outfile, "%s 0x%02x%s\n", name, linux_to_number(lnx), mod);
 }
 
 static void walk_map(struct xkb_keymap *map, xkb_keycode_t code, void *data)
@@ -84,37 +83,37 @@ static void walk_map(struct xkb_keymap *map, xkb_keycode_t code, void *data)
     fprintf(outfile, "# evdev %d (0x%x), QKeyCode \"%s\", number 0x%x\n",
             evdev, evdev,
             QKeyCode_str(qcode),
-            qcode_to_number(qcode));
+            linux_to_number(evdev));
 
     /*
      * check which modifier states generate which keysyms
      */
     xkb_state_update_mask(state,  0, 0, 0,  0, 0, 0);
     kbase = xkb_state_key_get_one_sym(state, code);
-    print_sym(kbase, qcode, "");
+    print_sym(kbase, evdev, "");
 
     xkb_state_update_mask(state,  0, 0, numlock,  0, 0, 0);
     knumlock = xkb_state_key_get_one_sym(state, code);
     if (kbase != knumlock) {
-        print_sym(knumlock, qcode, " numlock");
+        print_sym(knumlock, evdev, " numlock");
     }
 
     xkb_state_update_mask(state,  shift, 0, 0,  0, 0, 0);
     kshift = xkb_state_key_get_one_sym(state, code);
     if (kbase != kshift && knumlock != kshift) {
-        print_sym(kshift, qcode, " shift");
+        print_sym(kshift, evdev, " shift");
     }
 
     xkb_state_update_mask(state,  altgr, 0, 0,  0, 0, 0);
     kaltgr = xkb_state_key_get_one_sym(state, code);
     if (kbase != kaltgr) {
-        print_sym(kaltgr, qcode, " altgr");
+        print_sym(kaltgr, evdev, " altgr");
     }
 
     xkb_state_update_mask(state,  altgr | shift, 0, 0,  0, 0, 0);
     kaltgrshift = xkb_state_key_get_one_sym(state, code);
     if (kshift != kaltgrshift && kaltgr != kaltgrshift) {
-        print_sym(kaltgrshift, qcode, " shift altgr");
+        print_sym(kaltgrshift, evdev, " shift altgr");
     }
 }
 
@@ -251,16 +250,16 @@ int main(int argc, char *argv[])
             "# keysyms.  So append them here.\n"
             "#\n"
             "\n");
-    print_sym(XKB_KEY_Print,            Q_KEY_CODE_SYSRQ,      "");
-    print_sym(XKB_KEY_Sys_Req,          Q_KEY_CODE_SYSRQ,      "");
-    print_sym(XKB_KEY_Execute,          Q_KEY_CODE_SYSRQ,      "");
+    print_sym(XKB_KEY_Print,            KEY_SYSRQ,    "");
+    print_sym(XKB_KEY_Sys_Req,          KEY_SYSRQ,    "");
+    print_sym(XKB_KEY_Execute,          KEY_SYSRQ,    "");
 
-    print_sym(XKB_KEY_KP_Decimal,       Q_KEY_CODE_KP_DECIMAL, " numlock");
-    print_sym(XKB_KEY_KP_Separator,     Q_KEY_CODE_KP_DECIMAL, " numlock");
+    print_sym(XKB_KEY_KP_Decimal,       KEY_KPDOT,    " numlock");
+    print_sym(XKB_KEY_KP_Separator,     KEY_KPDOT,    " numlock");
 
-    print_sym(XKB_KEY_Alt_R,            Q_KEY_CODE_ALT_R,      "");
-    print_sym(XKB_KEY_ISO_Level3_Shift, Q_KEY_CODE_ALT_R,      "");
-    print_sym(XKB_KEY_Mode_switch,      Q_KEY_CODE_ALT_R,      "");
+    print_sym(XKB_KEY_Alt_R,            KEY_RIGHTALT, "");
+    print_sym(XKB_KEY_ISO_Level3_Shift, KEY_RIGHTALT, "");
+    print_sym(XKB_KEY_Mode_switch,      KEY_RIGHTALT, "");
 
     fprintf(outfile,
             "\n"

-- 
2.54.0


