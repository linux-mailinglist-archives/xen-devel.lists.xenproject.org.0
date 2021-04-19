Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8662A364596
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 16:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112931.215294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTG-00060T-MF; Mon, 19 Apr 2021 14:01:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112931.215294; Mon, 19 Apr 2021 14:01:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYUTG-000600-J8; Mon, 19 Apr 2021 14:01:50 +0000
Received: by outflank-mailman (input) for mailman id 112931;
 Mon, 19 Apr 2021 14:01:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3l5R=JQ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lYUTF-0005yZ-Du
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 14:01:49 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98467370-7f61-41ad-84a3-b50c4d4368dc;
 Mon, 19 Apr 2021 14:01:48 +0000 (UTC)
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
X-Inumbo-ID: 98467370-7f61-41ad-84a3-b50c4d4368dc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618840908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u9A8Xbp2f28xpiyEql1FXS9QDyMZHqIW8dHroVxEQz0=;
  b=damj74y7thsnEtJgAqNQsH7qvba371RodFW5o/h4CozHQDXSOT3Gb4+n
   WteTk3aS4KWEquTli3301epwJQTUxy3XPi2KI3yVnRSGG6qJfSh+bumh9
   EaHZ13HnvqwKwH0FeTjQ2kp0An+DLxfdi/x3jIGkSr7yZTmFrP0xDNuci
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9dLxGOaIsnB66Fuzg95ph/S9+suSyg6IWMg+z9hhurXGdoZA5tb3pUkQGGadGtQyIqHDplGWwY
 aJ1/XU0bwious1VjmOyp+YBy6PF+VAIbBtt0OtKuCAGqcH/br8zyTuqIReMFLee4fTHtjBwCSP
 4OWoy7wOC8ksgqyluh4Hjh2LKdtXFEux4H1aMrA59k4hkJlp6LTJWby5wv2SMD8RFujrULqmpQ
 BzNP/37eL4OdmULPuRYn/BR3Hq5iYK4MBslA8oGjtOOZL5LVZ67heT6c60m2h5ygNTlFds2KQB
 X/E=
X-SBRS: 5.1
X-MesageID: 42271885
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:HRN7aaCJLywv6UHlHekp55DYdL4zR+YMi2QD/WoZc3JoW+afkN
 2jm+le6AT9jywfVGpltdeLPqSBRn20z+8N3aA6O7C+UA76/Fa5NY0K1/qF/xTMEzDzn9Q86Y
 5OaK57YeedMXFbioLA7BC8A5IcxrC8gcWVrMP/61socg1wcaFn6G5Ce2GmO2l7XhNPC5Z8NL
 f03LslmxOadX4abtu2CxA+NoCpzbD2vanrbhIcCxks5BPmt0LN1JfAHwWFxRBbajtTwN4ZgB
 D4ujbk7aauuezT8H7h/lLUhq44pPLRjv9KBMmBkaEuW1fRtjo=
X-IronPort-AV: E=Sophos;i="5.82,234,1613451600"; 
   d="scan'208";a="42271885"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/7] x86/shim: Fix compilation at -Og
Date: Mon, 19 Apr 2021 15:01:27 +0100
Message-ID: <20210419140132.16909-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210419140132.16909-1-andrew.cooper3@citrix.com>
References: <20210419140132.16909-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

When compiling at -Og:

  shim.c: In function ‘write_start_info’:
  shim.c:288:22: error: ‘param’ may be used uninitialized in this function[-Werror=maybe-uninitialized]
       si->store_evtchn = param;
       ~~~~~~~~~~~~~~~~~^~~~~~~

and a slew of knock-on failures.  All are caused by
xen_hypercall_hvm_get_param(), and presumably insufficient analysis to observe
that *value is always written on the ret=0 path.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/pv/shim.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index d16c0048c0..a05aaa7bcc 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -282,7 +282,7 @@ static void write_start_info(struct domain *d)
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     start_info_t *si = map_domain_page(_mfn(is_pv_32bit_domain(d) ? regs->edx
                                                                   : regs->rdx));
-    uint64_t param;
+    uint64_t param = 0;
 
     snprintf(si->magic, sizeof(si->magic), "xen-3.0-x86_%s",
              is_pv_32bit_domain(d) ? "32p" : "64");
@@ -311,8 +311,8 @@ int pv_shim_shutdown(uint8_t reason)
     struct domain *d = current->domain;
     struct vcpu *v;
     unsigned int i;
-    uint64_t old_store_pfn, old_console_pfn = 0, store_pfn, console_pfn;
-    uint64_t store_evtchn, console_evtchn;
+    uint64_t old_store_pfn = 0, old_console_pfn = 0, store_pfn = 0, console_pfn = 0;
+    uint64_t store_evtchn = 0, console_evtchn = 0;
     long rc;
 
     if ( reason != SHUTDOWN_suspend )
-- 
2.11.0


