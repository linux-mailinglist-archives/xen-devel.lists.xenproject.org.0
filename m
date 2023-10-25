Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54457D72EA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 20:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623151.970699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qviHF-0006qB-NC; Wed, 25 Oct 2023 18:06:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623151.970699; Wed, 25 Oct 2023 18:06:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qviHF-0006mc-H9; Wed, 25 Oct 2023 18:06:45 +0000
Received: by outflank-mailman (input) for mailman id 623151;
 Wed, 25 Oct 2023 18:06:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWkD=GH=citrix.com=prvs=6553ec402=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qviHE-0006Zm-02
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 18:06:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f4e719d-7361-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 20:06:42 +0200 (CEST)
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
X-Inumbo-ID: 3f4e719d-7361-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698257202;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PrWVaHB2rEiz5xABgTcH+1DhAHUFJoymf4nqaft0ID8=;
  b=fGtB0hcoK68UbRQaMlQyUE1DsFpUujdrjkZDE5XgNIz+HXHy85dZbjqH
   W9vARzju+94/QcmDBxROD0X2TAPQvzz/rvRYqn0AdJ0GmdryLbXr+YK/Y
   d01eBjWM6jURAu/9FP1HcjrDXOASOiiCQNoKe6sDx+vrOfBsbAafduHWD
   0=;
X-CSE-ConnectionGUID: o+bZL5mCRnmfqLITOaXR1g==
X-CSE-MsgGUID: QolnCxsJRMuIgBbPu+rrVQ==
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 126508435
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:qSkReKkKnuX+Mn+4Ehw4dv7o5gyyJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZDG6Bb6mDM2T8ftgjPY+w9kpQ7ZeBm9QxSlNv+y82RSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkT5gKGzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 ftbIgIpMxWoveSzzqufa9VLj/QZdca+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dMlsQYj/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xxzG+
 zqWoz+kav0cHOWYzTyu4mmOvMrSvCzRUroPV6eiyMc/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 TehhM/kCzVpt/uOVXuX+7OQrDWzESEQISkJYipsZRsI5djq5ps6gRPGQt9gF7Odh9j5Xzr3x
 li3QDMW3utJy5RRjuPioAGB3GrESoX1ohAd4UbdbEb46yhDYourfqiJ1X/S3cwZI9PMJrWeh
 0Toi/Ry/chXU8DdznTREbRTdF26z6zbamGC2zaDC7Fkp2z3pSP5FWxFyGsmTHqFJProbtMAj
 KX7kgRL7ZsbB2OwbKl4eOpd4OxxlvC/TLwJuh3OB+eig6SdlyfdpUmCnWbKgwjQfLEEyMnTw
 6uzf8e2Fmo9Aq961jewTOp1+eZ1l3BnmjmJGMGgn0nPPV+iiJi9E+lt3LymN71R0U95iF+Nr
 4Y32zWikH2zr9ESkgGIqNVOfDjm3FAwBIzsqtw/S9Nv1jFOQTl7Y9eImO9JRmCQt/gN/gs+1
 i3nCxAwJZuWrSGvFDhmnVg8OOqxAMwu8yNT0O5FFQ/A5kXPqL2HtM83H6bbt5F9nAC/5ZaYl
 8U4Rvg=
IronPort-HdrOrdr: A9a23:iTVoFqn2JJEge0IPxMLHY+Q0vFbpDfII3DAbv31ZSRFFG/Fw9v
 re/sjzsCWftN9/YgBCpTntAtj5fZr8z+8T3WByB8bYYOHm0FHYVb2KhLGKq1aBJ8SXzI9gPM
 xbAsxD4bPLfD1HZAXBjDVQ0exM/DBKys+VbJzlvhFQpMhRBZ1I6wd8BkKFHlZtRA9AbKBJbq
 ah2g==
X-Talos-CUID: 9a23:91mncGAsUnHsp8H6Ey4k/nwwR8UOSHvYwm70AnOfAFZTEbLAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A83+6ogy+SBx8lL4nQ1hZ80J0ZFqaqJ2pDEYmgY4?=
 =?us-ascii?q?kgeyZFCNaMQ+Azy6tfLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,250,1694750400"; 
   d="scan'208";a="126508435"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Alejandro Vallejo
	<alejandro.vallejo@cloud.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>
Subject: [PATCH 2/2] x86/Kconfig: Introduce CONFIG_{AMD,INTEL} and conditionalise ucode
Date: Wed, 25 Oct 2023 19:06:30 +0100
Message-ID: <20231025180630.3230010-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231025180630.3230010-1-andrew.cooper3@citrix.com>
References: <20231025180630.3230010-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We eventually want to be able to build a stripped down Xen for a single
platform.  Make a start with CONFIG_{AMD,INTEL} (hidden behind EXPERT, but
available to randconfig), and adjust the microcode logic.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>
CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>

I've intentionally ignored the other vendors for now.  They can be put into
Kconfig by whomever figures out the actual dependencies between their init
routines.

CC Stefano/Xenia as I know you want to go down this line, but I don't recall
patches to this effect yet.
---
 xen/arch/x86/Kconfig                 |  2 ++
 xen/arch/x86/Kconfig.cpu             | 22 ++++++++++++++++++++++
 xen/arch/x86/cpu/microcode/Makefile  |  4 ++--
 xen/arch/x86/cpu/microcode/private.h |  9 +++++++++
 4 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 xen/arch/x86/Kconfig.cpu

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index eac77573bd75..d9eacdd7e0fa 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -49,6 +49,8 @@ config HAS_CC_CET_IBT
 
 menu "Architecture Features"
 
+source "arch/x86/Kconfig.cpu"
+
 source "arch/Kconfig"
 
 config PV
diff --git a/xen/arch/x86/Kconfig.cpu b/xen/arch/x86/Kconfig.cpu
new file mode 100644
index 000000000000..0ce09b292045
--- /dev/null
+++ b/xen/arch/x86/Kconfig.cpu
@@ -0,0 +1,22 @@
+menu "Supported processor vendors"
+	visible if EXPERT
+
+config AMD
+	bool "AMD"
+        default y
+        help
+          Detection, tunings and quirks for AMD processors.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on AMD processors.
+
+config INTEL
+	bool "Intel"
+        default y
+        help
+          Detection, tunings and quirks for Intel processors.
+
+	  May be turned off in builds targetting other vendors.  Otherwise,
+	  must be enabled for Xen to work suitably on Intel processors.
+
+endmenu
diff --git a/xen/arch/x86/cpu/microcode/Makefile b/xen/arch/x86/cpu/microcode/Makefile
index aae235245b06..30d600544f45 100644
--- a/xen/arch/x86/cpu/microcode/Makefile
+++ b/xen/arch/x86/cpu/microcode/Makefile
@@ -1,3 +1,3 @@
-obj-y += amd.o
+obj-$(CONFIG_AMD) += amd.o
 obj-y += core.o
-obj-y += intel.o
+obj-$(CONFIG_INTEL) += intel.o
diff --git a/xen/arch/x86/cpu/microcode/private.h b/xen/arch/x86/cpu/microcode/private.h
index b58611e908aa..da556fe5060a 100644
--- a/xen/arch/x86/cpu/microcode/private.h
+++ b/xen/arch/x86/cpu/microcode/private.h
@@ -70,7 +70,16 @@ struct microcode_ops {
  * support available) and (not) ops->apply_microcode (i.e. read only).
  * Otherwise, all hooks must be filled in.
  */
+#ifdef CONFIG_AMD
 void ucode_probe_amd(struct microcode_ops *ops);
+#else
+static inline void ucode_probe_amd(struct microcode_ops *ops) {}
+#endif
+
+#ifdef CONFIG_INTEL
 void ucode_probe_intel(struct microcode_ops *ops);
+#else
+static inline void ucode_probe_intel(struct microcode_ops *ops) {}
+#endif
 
 #endif /* ASM_X86_MICROCODE_PRIVATE_H */
-- 
2.30.2


