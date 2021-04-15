Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB4E360671
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 12:04:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111015.212188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyrk-0004Te-EL; Thu, 15 Apr 2021 10:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111015.212188; Thu, 15 Apr 2021 10:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWyrk-0004T5-AK; Thu, 15 Apr 2021 10:04:52 +0000
Received: by outflank-mailman (input) for mailman id 111015;
 Thu, 15 Apr 2021 10:04:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C/wI=JM=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1lWyrj-0004Sv-5m
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 10:04:51 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ae1a2da-2134-4fb3-a202-dc69953984f8;
 Thu, 15 Apr 2021 10:04:50 +0000 (UTC)
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
X-Inumbo-ID: 9ae1a2da-2134-4fb3-a202-dc69953984f8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618481089;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=XM/KC8VilFwVpZaPc2wNIuqDGK9utm8Pm2v2UbjAvFI=;
  b=BQjVTd2ingDFFR7yLGc82TtUku9ie639hi8qMCz1piIgyxcR+wUWF58F
   9wF8ZWMv66+LguzUXusnVBjzREoPHwsby0yg2zpacMxlGMBRHycUJMHuA
   YZCgpuDrlc6Qzcx6av7nlgt5YsX423JKJtPbYl/PlIVHcvhuxloEU8J8c
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 96QOzxdbZpGNDreiqxcT08JvuAmgfU27g96unckYg1kCfLyhRfZKpx2XU3adRS6IHc8KhRpxQ4
 6ACu6xYaHke17zZOfhzkMcuEQhXXjcF2ubTl4YU8lHZsaL9NKu4vc8YI/oAcJ/VJfdqhamrC0X
 kInQWBXP19ognevZ0COV8dvpGlEpj6PKN6O+DYOeLqp6XS3wnJlGkzzGOffim8BFxDFNY/zGrh
 8FKysYsros8OadRGZrQDXvjwhXsqEpEe8ft2PSxA37MUxkRlpYViV6fWNVBQ3vkmrJtheB/hih
 llA=
X-SBRS: 4.0
X-MesageID: 41492243
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:wpaSEaOZ925J7cBcTgSjsMiAIKoaSvp033AA/SlKJyB9WMqeis
 yogbAnxQb54QxhP00ItNicNMC7IU/02oVy5eAqUYuKeCnDlC+WIJp57Y3kqgeQfxHW0uJGz6
 9vf+xfJbTLfDtHpP336gW5DNosqePvmMvD6Nv29HtxURpsL5hp8gYRMHf/LmRNWAJECZAlfa
 D82uN7oVObFkg/X4CeDnkBU/OrnayoqK7b
X-IronPort-AV: E=Sophos;i="5.82,223,1613451600"; 
   d="scan'208";a="41492243"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jun.nakajima@intel.com>, <kevin.tian@intel.com>, <jbeulich@suse.com>,
	<andrew.cooper3@citrix.com>, <roger.pau@citrix.com>, <wl@xen.org>, "Igor
 Druzhinin" <igor.druzhinin@citrix.com>
Subject: [PATCH v5 1/2] x86/vtx: add LBR_SELECT to the list of LBR MSRs
Date: Thu, 15 Apr 2021 11:04:21 +0100
Message-ID: <1618481062-16094-1-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

This MSR exists since Nehalem / Silvermont and is actively used by Linux,
for instance, to improve sampling efficiency.

Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Changes in v5:
- added Silvermont+ LBR_SELECT support

New patch in v4 as suggested by Andrew.
---
 xen/arch/x86/hvm/vmx/vmx.c      | 20 ++++++++++++++++----
 xen/include/asm-x86/msr-index.h | 10 ++++++++--
 2 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 835b905..30c6a57 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2915,14 +2915,16 @@ static const struct lbr_info {
 }, nh_lbr[] = {
     { MSR_IA32_LASTINTFROMIP,       1 },
     { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_C2_LASTBRANCH_TOS,        1 },
+    { MSR_NHL_LBR_SELECT,           1 },
+    { MSR_NHL_LASTBRANCH_TOS,       1 },
     { MSR_P4_LASTBRANCH_0_FROM_LIP, NUM_MSR_P4_LASTBRANCH_FROM_TO },
     { MSR_P4_LASTBRANCH_0_TO_LIP,   NUM_MSR_P4_LASTBRANCH_FROM_TO },
     { 0, 0 }
 }, sk_lbr[] = {
     { MSR_IA32_LASTINTFROMIP,       1 },
     { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_SKL_LASTBRANCH_TOS,       1 },
+    { MSR_NHL_LBR_SELECT,           1 },
+    { MSR_NHL_LASTBRANCH_TOS,       1 },
     { MSR_SKL_LASTBRANCH_0_FROM_IP, NUM_MSR_SKL_LASTBRANCH },
     { MSR_SKL_LASTBRANCH_0_TO_IP,   NUM_MSR_SKL_LASTBRANCH },
     { MSR_SKL_LASTBRANCH_0_INFO,    NUM_MSR_SKL_LASTBRANCH },
@@ -2934,10 +2936,19 @@ static const struct lbr_info {
     { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
     { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
     { 0, 0 }
+}, sm_lbr[] = {
+    { MSR_IA32_LASTINTFROMIP,       1 },
+    { MSR_IA32_LASTINTTOIP,         1 },
+    { MSR_SM_LBR_SELECT,            1 },
+    { MSR_SM_LASTBRANCH_TOS,        1 },
+    { MSR_C2_LASTBRANCH_0_FROM_IP,  NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
+    { MSR_C2_LASTBRANCH_0_TO_IP,    NUM_MSR_ATOM_LASTBRANCH_FROM_TO },
+    { 0, 0 }
 }, gm_lbr[] = {
     { MSR_IA32_LASTINTFROMIP,       1 },
     { MSR_IA32_LASTINTTOIP,         1 },
-    { MSR_GM_LASTBRANCH_TOS,        1 },
+    { MSR_SM_LBR_SELECT,            1 },
+    { MSR_SM_LASTBRANCH_TOS,        1 },
     { MSR_GM_LASTBRANCH_0_FROM_IP,  NUM_MSR_GM_LASTBRANCH_FROM_TO },
     { MSR_GM_LASTBRANCH_0_TO_IP,    NUM_MSR_GM_LASTBRANCH_FROM_TO },
     { 0, 0 }
@@ -2991,6 +3002,7 @@ static const struct lbr_info *last_branch_msr_get(void)
             return sk_lbr;
         /* Atom */
         case 0x1c: case 0x26: case 0x27: case 0x35: case 0x36:
+            return at_lbr;
         /* Silvermont */
         case 0x37: case 0x4a: case 0x4d: case 0x5a: case 0x5d:
         /* Xeon Phi Knights Landing */
@@ -2999,7 +3011,7 @@ static const struct lbr_info *last_branch_msr_get(void)
         case 0x85:
         /* Airmont */
         case 0x4c:
-            return at_lbr;
+            return sm_lbr;
         /* Goldmont */
         case 0x5c: case 0x5f:
             return gm_lbr;
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index 43d26ef..020908f 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -606,15 +606,21 @@
 #define NUM_MSR_C2_LASTBRANCH_FROM_TO	4
 #define NUM_MSR_ATOM_LASTBRANCH_FROM_TO	8
 
+/* Nehalem (and newer) last-branch recording */
+#define MSR_NHL_LBR_SELECT		0x000001c8
+#define MSR_NHL_LASTBRANCH_TOS		0x000001c9
+
 /* Skylake (and newer) last-branch recording */
-#define MSR_SKL_LASTBRANCH_TOS		0x000001c9
 #define MSR_SKL_LASTBRANCH_0_FROM_IP	0x00000680
 #define MSR_SKL_LASTBRANCH_0_TO_IP	0x000006c0
 #define MSR_SKL_LASTBRANCH_0_INFO	0x00000dc0
 #define NUM_MSR_SKL_LASTBRANCH		32
 
+/* Silvermont (and newer) last-branch recording */
+#define MSR_SM_LBR_SELECT		0x000001c8
+#define MSR_SM_LASTBRANCH_TOS		0x000001c9
+
 /* Goldmont last-branch recording */
-#define MSR_GM_LASTBRANCH_TOS		0x000001c9
 #define MSR_GM_LASTBRANCH_0_FROM_IP	0x00000680
 #define MSR_GM_LASTBRANCH_0_TO_IP	0x000006c0
 #define NUM_MSR_GM_LASTBRANCH_FROM_TO	32
-- 
2.7.4


