Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D23E97A2836
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 22:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603360.940335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYQ-0001Eh-3u; Fri, 15 Sep 2023 20:36:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603360.940335; Fri, 15 Sep 2023 20:36:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhFYQ-0001Ch-0D; Fri, 15 Sep 2023 20:36:42 +0000
Received: by outflank-mailman (input) for mailman id 603360;
 Fri, 15 Sep 2023 20:36:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zf2R=E7=citrix.com=prvs=615989724=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qhFYO-0000xj-PQ
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 20:36:40 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91dfdee2-5407-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 22:36:38 +0200 (CEST)
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
X-Inumbo-ID: 91dfdee2-5407-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694810198;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0efH8BOSizGTOHRB94i57CXHT600TrTwqOEk5f1bQW8=;
  b=KAKrgCbqZvQ0pQp67T2PONKE8SA6gUVZH83X9aKkukUP05AoryQbIXaf
   nVMzfqKT2049jIOvex4dPvz+cytVL2kls1QpOc29rRHERkIa+h1fKJ4Pq
   /LWsZ8bCZIYxKkQsE39lINOdVthWKDrQ0+xEWBOpa0oJ2D+tEcezokPlW
   k=;
X-CSE-ConnectionGUID: 40xdC7HJRICoFGlJfSNwcw==
X-CSE-MsgGUID: MNhrQ7DlQtyNeQeZ9jc8xw==
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 122825025
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:LX78wqj/Dg1MY4UMjzqC9hFpX161VhAKZh0ujC45NGQN5FlHY01je
 htvWGuGP/bZYjPwKYx2b4yyoUMF7ZaHz99nHVc6ry1nRXgb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOhTraCYmYoHVMMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyo0N8klgZmP6sT7QaDzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tREcCABRU+jpdiX67WVZe1OiP8FM8L0adZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 DiWpTmhWExy2Nq37ByF6Evzquv2gTLdVbsfJuy6/a56nwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9/vrBDposPuWQHSSsLSOhTy3MCkRa2QFYEc5oRAtuoe55ttp11SWE4glSfTu5jHoJd3u6
 2zSvCQV2JUxt+8g0IuU+XLJuBSzrYecG2bZ+T7rdm6i6wp4YqusaIqp9UXX4J58EWqJcrWSl
 CNawpbDtYjiGbnIzXXQG7tVQNlF8t7faFXhbUhT847NHthH01qqZshu7T53Py+F2e5UKGayM
 Cc/Ve68jaK/3UdGj4ctM+pd6Oxwl8AM8OgJsdiNNLJzjmBZLlPvwc2XTRf4M5rRuEYti7ojH
 pyQbNyhC30XYYw+kmvqF79Hju92ln1nrY82eXwd507/uVZ5TCTOIYrpzXPUNrxphE96iFq9H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUXX9rivw/G7gtWre1I8cEl4Uq+5/F/UU9A990ijvruSr
 y7Vt44x4AaXuEAr3i3RMyk5MO6+DMonxZ/5VAR1VWuVN7EYSd7HxM8im1EfJNHLKMQLISZIc
 sQ4
IronPort-HdrOrdr: A9a23:u7mL968T0nbFaF8WR/9uk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-Talos-CUID: 9a23:ycw0lm6RMsz7AUlWVdssqBYEFut6Ul/n7VzXDWC8K2hSbqKeVgrF
X-Talos-MUID: 9a23:LOFQuAVcJxKOSdHq/BrKhCtba+ts2ri/Lk00nKdXucLUJTMlbg==
X-IronPort-AV: E=Sophos;i="6.02,150,1688443200"; 
   d="scan'208";a="122825025"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Jinoh Kang
	<jinoh.kang.kr@gmail.com>
Subject: [PATCH 6/7] x86: Extend x86_event with a pending_dbg field
Date: Fri, 15 Sep 2023 21:36:27 +0100
Message-ID: <20230915203628.837732-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230915203628.837732-1-andrew.cooper3@citrix.com>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... using the Intel VMCS PENDING_DBG semantics, and sharing storage with cr2.

This requires working around anonymous union bugs in obsolete versions of GCC,
which in turn needs to drop unnecessary const qualifiers.

Also introduce a pv_inject_DB() wrapper use this field nicely.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jinoh Kang <jinoh.kang.kr@gmail.com>

v2:
 * Split out of prior patch.
---
 xen/arch/x86/include/asm/domain.h      | 18 ++++++++++++++++--
 xen/arch/x86/include/asm/hvm/hvm.h     |  3 ++-
 xen/arch/x86/x86_emulate/x86_emulate.h |  5 ++++-
 3 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
index c2d9fc333be5..fd1f306222be 100644
--- a/xen/arch/x86/include/asm/domain.h
+++ b/xen/arch/x86/include/asm/domain.h
@@ -729,15 +729,29 @@ static inline void pv_inject_hw_exception(unsigned int vector, int errcode)
     pv_inject_event(&event);
 }
 
+static inline void pv_inject_DB(unsigned long pending_dbg)
+{
+    struct x86_event event = {
+        .vector      = X86_EXC_DB,
+        .type        = X86_EVENTTYPE_HW_EXCEPTION,
+        .error_code  = X86_EVENT_NO_EC,
+    };
+
+    event.pending_dbg = pending_dbg;
+
+    pv_inject_event(&event);
+}
+
 static inline void pv_inject_page_fault(int errcode, unsigned long cr2)
 {
-    const struct x86_event event = {
+    struct x86_event event = {
         .vector = X86_EXC_PF,
         .type = X86_EVENTTYPE_HW_EXCEPTION,
         .error_code = errcode,
-        .cr2 = cr2,
     };
 
+    event.cr2 = cr2;
+
     pv_inject_event(&event);
 }
 
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 6d53713fc3a9..ea966f4429f9 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -532,9 +532,10 @@ static inline void hvm_inject_page_fault(int errcode, unsigned long cr2)
         .vector = X86_EXC_PF,
         .type = X86_EVENTTYPE_HW_EXCEPTION,
         .error_code = errcode,
-        .cr2 = cr2,
     };
 
+    event.cr2 = cr2;
+
     hvm_inject_event(&event);
 }
 
diff --git a/xen/arch/x86/x86_emulate/x86_emulate.h b/xen/arch/x86/x86_emulate/x86_emulate.h
index fbc023c37e34..e567a9b635d9 100644
--- a/xen/arch/x86/x86_emulate/x86_emulate.h
+++ b/xen/arch/x86/x86_emulate/x86_emulate.h
@@ -78,7 +78,10 @@ struct x86_event {
     uint8_t       type;         /* X86_EVENTTYPE_* */
     uint8_t       insn_len;     /* Instruction length */
     int32_t       error_code;   /* X86_EVENT_NO_EC if n/a */
-    unsigned long cr2;          /* Only for X86_EXC_PF h/w exception */
+    union {
+        unsigned long cr2;         /* #PF */
+        unsigned long pending_dbg; /* #DB (new DR6 bits, positive polarity) */
+    };
 };
 
 /*
-- 
2.30.2


