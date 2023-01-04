Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ACC65D13A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 12:12:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471110.730844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD1gm-0006KB-97; Wed, 04 Jan 2023 11:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471110.730844; Wed, 04 Jan 2023 11:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pD1gm-0006I0-5p; Wed, 04 Jan 2023 11:12:08 +0000
Received: by outflank-mailman (input) for mailman id 471110;
 Wed, 04 Jan 2023 11:12:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pD1gk-0005kw-GW
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 11:12:06 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ee64cf1-8c20-11ed-91b6-6bf2151ebd3b;
 Wed, 04 Jan 2023 12:12:05 +0100 (CET)
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
X-Inumbo-ID: 9ee64cf1-8c20-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672830725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UAKOXtp3MBtKPheGYD3/xlv27YzzrN4rSPgxLhvD/Gw=;
  b=gsmztJ5C15L7xl8g1EBQWbQHx3f7E+sRte6/Ie2UVzZ0mnXeGwEqIBZ2
   8Q8R4Aoy8MRxnI/ptxIzVfMfyimU1plmfMeJl4VqzGCC9oe2PhayoXbzz
   p68ax8G9BKYci/UN8HEeq18cwqqoSOm8OjM4QZa8JoHgp2nttozNI0KpD
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93590518
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/saynqt14HnKlcVzlDMXqR6G8OfnVFheMUV32f8akzHdYApBsoF/q
 tZmKWDVbqyOZWHzKYt/bN/npxgH756AxoNqHgZr+3g9EypH+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoQ5AaGyyFMZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwBjQVTS+7luWM8pmHDehGh5oGLMTlI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfAdMYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27J/
 T+XpzmgUnn2MvS8zRuZ23apm9bPvnLyfJwvGuW3ytV11Qj7Kms7V0RNCArTTeOColG6c8JSL
 QoT4CVGhYoY+VGvT9L9dwalu3PCtRkZM/JAHut/5AyTx6785weCGnNCXjNHcMYhtsI9WXotz
 FDhoj/yLWUx6vvPEyvbr+rK62PpUcQIEYMcTQEAVSg628jkmrMYslXOZNc9Na64gMKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKu1mSx28zaK7onAMFh
 2eN0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZo3sxOhbAjzi0zBhEfUQD1
 XCzKJ/EMJrnIf4/kGreqxk1i9fHORzSNUuMHMumnnxLIJKVZWKPSKdtDWZimtsRtfveyC2Mq
 oY3Cid/40kHOAEISnWNoNF7wJFjBSRTOK0aXOQOLLbSelA/RzhxYxITqJt4E7FYc21uvr+g1
 hmAtoVwkTITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:Enyza6labInGAmMNtvOt8hz+WEXpDfIi3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyEJwTOssJbyK
 d8Y+xfJbTLfDxHZB/BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.96,299,1665460800"; 
   d="scan'208";a="93590518"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] x86/cpuid: Infrastructure for leaves 7:1{ecx,edx}
Date: Wed, 4 Jan 2023 11:11:45 +0000
Message-ID: <20230104111146.2094-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230104111146.2094-1-andrew.cooper3@citrix.com>
References: <20230104111146.2094-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We don't actually need ecx yet, but adding it in now will reduce the amount to
which leaf 7 is out of order in a featureset.

cpufeatureset.h remains in leaf architectrual order for the sanity of anyone
trying to locate where to insert new rows.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Fix decodes[] short string
---
 tools/misc/xen-cpuid.c                      | 10 ++++++++++
 xen/arch/x86/cpu/common.c                   |  3 ++-
 xen/include/public/arch-x86/cpufeatureset.h |  3 +++
 xen/include/xen/lib/x86/cpuid.h             | 15 ++++++++++++++-
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index d5833e9ce879..addb3a39a11a 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -202,6 +202,14 @@ static const char *const str_7b1[32] =
     [ 0] = "ppin",
 };
 
+static const char *const str_7c1[32] =
+{
+};
+
+static const char *const str_7d1[32] =
+{
+};
+
 static const char *const str_7d2[32] =
 {
     [ 0] = "intel-psfd",
@@ -229,6 +237,8 @@ static const struct {
     { "0x80000021.eax",  "e21a", str_e21a },
     { "0x00000007:1.ebx", "7b1", str_7b1 },
     { "0x00000007:2.edx", "7d2", str_7d2 },
+    { "0x00000007:1.ecx", "7c1", str_7c1 },
+    { "0x00000007:1.edx", "7d1", str_7d1 },
 };
 
 #define COL_ALIGN "18"
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 0412dbc915e5..b3fcf4680f3a 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -450,7 +450,8 @@ static void generic_identify(struct cpuinfo_x86 *c)
 			cpuid_count(7, 1,
 				    &c->x86_capability[FEATURESET_7a1],
 				    &c->x86_capability[FEATURESET_7b1],
-				    &tmp, &tmp);
+				    &c->x86_capability[FEATURESET_7c1],
+				    &c->x86_capability[FEATURESET_7d1]);
 		if (max_subleaf >= 2)
 			cpuid_count(7, 2,
 				    &tmp, &tmp, &tmp,
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 7915f5826f57..7a896f0e2d92 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -288,6 +288,9 @@ XEN_CPUFEATURE(NSCB,               11*32+ 6) /*A  Null Selector Clears Base (and
 /* Intel-defined CPU features, CPUID level 0x00000007:1.ebx, word 12 */
 XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory Number */
 
+/* Intel-defined CPU features, CPUID level 0x00000007:1.ecx, word 14 */
+/* Intel-defined CPU features, CPUID level 0x00000007:1.edx, word 15 */
+
 /* Intel-defined CPU features, CPUID level 0x00000007:2.edx, word 13 */
 XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
 XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*   MSR_SPEC_CTRL.IPRED_DIS_* */
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index 73a5c330365e..fa98b371eef4 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -18,6 +18,8 @@
 #define FEATURESET_e21a  11 /* 0x80000021.eax      */
 #define FEATURESET_7b1   12 /* 0x00000007:1.ebx    */
 #define FEATURESET_7d2   13 /* 0x00000007:2.edx    */
+#define FEATURESET_7c1   14 /* 0x00000007:1.ecx    */
+#define FEATURESET_7d1   15 /* 0x00000007:1.edx    */
 
 struct cpuid_leaf
 {
@@ -194,7 +196,14 @@ struct cpuid_policy
                 uint32_t _7b1;
                 struct { DECL_BITFIELD(7b1); };
             };
-            uint32_t /* c */:32, /* d */:32;
+            union {
+                uint32_t _7c1;
+                struct { DECL_BITFIELD(7c1); };
+            };
+            union {
+                uint32_t _7d1;
+                struct { DECL_BITFIELD(7d1); };
+            };
 
             /* Subleaf 2. */
             uint32_t /* a */:32, /* b */:32, /* c */:32;
@@ -343,6 +352,8 @@ static inline void cpuid_policy_to_featureset(
     fs[FEATURESET_e21a] = p->extd.e21a;
     fs[FEATURESET_7b1] = p->feat._7b1;
     fs[FEATURESET_7d2] = p->feat._7d2;
+    fs[FEATURESET_7c1] = p->feat._7c1;
+    fs[FEATURESET_7d1] = p->feat._7d1;
 }
 
 /* Fill in a CPUID policy from a featureset bitmap. */
@@ -363,6 +374,8 @@ static inline void cpuid_featureset_to_policy(
     p->extd.e21a  = fs[FEATURESET_e21a];
     p->feat._7b1  = fs[FEATURESET_7b1];
     p->feat._7d2  = fs[FEATURESET_7d2];
+    p->feat._7c1  = fs[FEATURESET_7c1];
+    p->feat._7d1  = fs[FEATURESET_7d1];
 }
 
 static inline uint64_t cpuid_policy_xcr0_max(const struct cpuid_policy *p)
-- 
2.11.0


