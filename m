Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855D8444872
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 19:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.221118.382663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miLBi-0007nL-Gw; Wed, 03 Nov 2021 18:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 221118.382663; Wed, 03 Nov 2021 18:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miLBi-0007lR-CZ; Wed, 03 Nov 2021 18:40:42 +0000
Received: by outflank-mailman (input) for mailman id 221118;
 Wed, 03 Nov 2021 18:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vzBQ=PW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1miLBh-0007lL-72
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 18:40:41 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89dbeffd-3cd5-11ec-a9d2-d9f7a1cc8784;
 Wed, 03 Nov 2021 19:40:39 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B55FC5C0191;
 Wed,  3 Nov 2021 14:40:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 03 Nov 2021 14:40:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Nov 2021 14:40:36 -0400 (EDT)
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
X-Inumbo-ID: 89dbeffd-3cd5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=gVU9tB
	42BsY+gMOp4NsCDMzjhsyHYtjFguFfI9f80Wg=; b=ml5mUmEAHe7+lWKSmf89GZ
	2Ys0ZfPZHkmKjQ1LLMmBPKu7C2Eyz+p6M6XwjNez2/NClaZgdmYavPLRNQyJCNP1
	3zjStRnHK7Sd1vRf9RwnTonlT7DK36z8O2zFFRwtK0fL5aT0XuFPANiwybQa44A/
	CEq0R7CoX8y2ZJY992EtaSipVE6aVnA3XpUWCLyL+FIL2iKuT7NH4Fk/sruSWU4a
	/EqHpNTCJg5Sweh36UAG7sOUXszbp/VrsBDSU20hRy353QXgyEFf7UMoY36v4Te9
	0jXTWBsYPuuMmYdWD67Rb7MRH9se+pZZWPL/DcFSljdXQbw2srwsIcC1dGlq/pog
	==
X-ME-Sender: <xms:pdeCYchd0SuPwcyMrkGZP5GlSs8C3UyBDh5ClqeeIxak1ILd73828A>
    <xme:pdeCYVC6vO5AqzNqJeWEMoVZ8Ij-rriozjyD_xr_pQg68FY7brl7KLlLyzcvQ35FF
    JMM0XvMOZ251A>
X-ME-Received: <xmr:pdeCYUGM3054m9NDNES5IA9bXmF0A5nmMllU2d4ArI1BCQkxdliz_eiH0Td8GDQAB7gxD8HArHmACn8HlZOpDDx2dRO3eqNkj5_RTERoogktuYSdIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddvgdduuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetgeet
    keeukeffhfejueeludehtedtkeeuiedtgffgtdfhveefueeiiefhudehgeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:pdeCYdSJAFwrH13tn3_xLf6CXsOtiMci8TfXIHScrQlPlPATzfnM3A>
    <xmx:pdeCYZzrwsus5y_vPDayyw546y5Fbt7oDnUyd5Bo78hSioZWv6z7og>
    <xmx:pdeCYb4VY97MfESZdN6ywUfLsVPgoAQrA5-jBScwcZUHWDniemteZw>
    <xmx:pdeCYbsX-XicQAaFcDLosChEP_iDw_cunfUGT8J_zrKfreW1gRLgcw>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH-4.16 v2] x86/xstate: reset cached register values on resume
Date: Wed,  3 Nov 2021 19:40:20 +0100
Message-Id: <20211103184020.1276465-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

set_xcr0() and set_msr_xss() use cached value to avoid setting the
register to the same value over and over. But suspend/resume implicitly
reset the registers and since percpu areas are not deallocated on
suspend anymore, the cache gets stale.
Reset the cache on resume, to ensure the next write will really hit the
hardware. Choose value 0, as it will never be a legitimate write to
those registers - and so, will force write (and cache update).

Note the cache is used io get_xcr0() and get_msr_xss() too, but:
- set_xcr0() is called few lines below in xstate_init(), so it will
  update the cache with appropriate value
- get_msr_xss() is not used anywhere - and thus not before any
  set_msr_xss() that will fill the cache

Fixes: aca2a985a55a "xen: don't free percpu areas during suspend"
Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
 - adjust xss init value per Jan request

For 4.16: this unbreaks S3 resume, it was posted initially back in
August and is shipped in Qubes since September (although backported to
4.14, not unstable) with no reported regressions.

Cc: Ian Jackson <iwj@xenproject.org>
---
 xen/arch/x86/xstate.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 6aaf9a2f1546..a16dfbb3877b 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -642,6 +642,13 @@ void xstate_init(struct cpuinfo_x86 *c)
         return;
     }
 
+    /*
+     * Clear the cached value to make set_xcr0() and set_msr_xss() really
+     * write it.
+     */
+    this_cpu(xcr0) = 0;
+    this_cpu(xss) = ~0;
+
     cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
     feature_mask = (((u64)edx << 32) | eax) & XCNTXT_MASK;
     BUG_ON(!valid_xcr0(feature_mask));
-- 
2.31.1


