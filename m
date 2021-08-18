Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38E53F02BE
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 13:31:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168195.307078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGJmB-0004eh-Iv; Wed, 18 Aug 2021 11:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168195.307078; Wed, 18 Aug 2021 11:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGJmB-0004bm-FT; Wed, 18 Aug 2021 11:30:31 +0000
Received: by outflank-mailman (input) for mailman id 168195;
 Wed, 18 Aug 2021 11:30:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWQ4=NJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mGJmA-0004bg-JD
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 11:30:30 +0000
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5976ecd0-4254-4e54-ab35-de5548c03260;
 Wed, 18 Aug 2021 11:30:29 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 38C25320091A;
 Wed, 18 Aug 2021 07:30:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 18 Aug 2021 07:30:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 07:30:26 -0400 (EDT)
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
X-Inumbo-ID: 5976ecd0-4254-4e54-ab35-de5548c03260
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zxyarP
	+tas0XgyBPBKBNTglDsM/L05/Fmb3AxR7oaqc=; b=lLM8w5h2bmx389d+h1lSCC
	RjfjAS9CB8B6LwyMk+fq7N4VysAap6CF/unlnmAN8gF4NjVnYV0JoOjMq5vTg86l
	ZpZkmzB/OlmSwkA+dKHEqNwNHjAlnXiTAJydRBombnXgSgTS1t0m86wO5/93uycx
	ONbUO0Cs6j3Rb0WPb8r6j+IddGCEY/9vC/dyXNBwbeH67MmNSXEPpEm52HHfQT95
	yaAnM4nsK31ffFm4idJWKP7NjetW0fAWYdCfWY3qRbhOax2QoV0BNhrnuNz2zMcG
	TdGvDf/eesFeU/RCkBO0FkHvkR+2zDuUetIARpFb5+6CtFLvUH9L1hkti+ZSYh5w
	==
X-ME-Sender: <xms:U-8cYWPp4dSZpxy-Xt5-95rTpm2nvccFw2jd7zj2A5OI7iuMrOH3aQ>
    <xme:U-8cYU9tGeUCpImoxjcWVQsyIcgVlgc5tRLul1VxjfMnsPUWsNTD8LorLXiGKOMg-
    gmtrZcG4eB4Mw>
X-ME-Received: <xmr:U-8cYdTcPKKyyYogwEPbGU2BY23UDZIrlH81YY2ZfQCfMcJttQ5cGvhRKpxigtaeTxpk46d8zy9B9xN4BbS-ta_PJSZs7RSD4nqX47Yc4URLvCZKLQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleehgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofggtghogfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteegteek
    ueekfffhjeeuleduheettdekueeitdfggfdthfevfeeuieeihfduheegnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:U-8cYWvqo3JYSV_OQNFjliEjVmUx3UQwc4f8iqaWpfhoyN6F-AWpiQ>
    <xmx:U-8cYee1TjUbmcgpfqEEeKRA7NxQUOEYmX52FjD02jrWvFIPpRPUQA>
    <xmx:U-8cYa2Zy-3Mi-9bPUDCmlsitqK5r2eoBsJgTmelGxZyFGqYxglkDg>
    <xmx:U-8cYe6nWqoVw7-AzVYgkXo0hYDEOyI4z2-6hYnN4Z-ICxdz1kiXOA>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/xstate: reset cached register values on resume
Date: Wed, 18 Aug 2021 13:30:17 +0200
Message-Id: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
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
---
 xen/arch/x86/xstate.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 6aaf9a2f1546..28726d8fbf2b 100644
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
+    this_cpu(xss) = 0;
+
     cpuid_count(XSTATE_CPUID, 0, &eax, &ebx, &ecx, &edx);
     feature_mask = (((u64)edx << 32) | eax) & XCNTXT_MASK;
     BUG_ON(!valid_xcr0(feature_mask));
-- 
2.31.1


