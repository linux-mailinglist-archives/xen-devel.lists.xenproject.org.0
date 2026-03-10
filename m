Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH0+AwNQsGnFhgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:08:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F8C25540C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:08:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250310.1547828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00Cd-00045V-QA; Tue, 10 Mar 2026 16:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250310.1547828; Tue, 10 Mar 2026 16:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00Cd-0003yf-Lh; Tue, 10 Mar 2026 16:45:03 +0000
Received: by outflank-mailman (input) for mailman id 1250310;
 Tue, 10 Mar 2026 16:45:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BkbS=BK=bounce.vates.tech=bounce-md_30504962.69b04a87.v1-dba5e090b02c4a199bdbd3059630d207@srs-se1.protection.inumbo.net>)
 id 1w00Cc-000397-Na
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 16:45:02 +0000
Received: from mail133-21.atl131.mandrillapp.com
 (mail133-21.atl131.mandrillapp.com [198.2.133.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a49f90b-1ca0-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 17:44:59 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fVfqq1hYkz1XLF4d
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 16:44:55 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 dba5e090b02c4a199bdbd3059630d207; Tue, 10 Mar 2026 16:44:55 +0000
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
X-Inumbo-ID: 7a49f90b-1ca0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773161095; x=1773431095;
	bh=3Wd0xKWdvd2LCo+Aysi0R4yuf0yNnldMdvsEMKvsrOI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1qUf6IvwcYn+YBCjZb+CiiNsxrDid8C1mWUh+mEZGnICezlZpOT7U/T9aRF0wgG4q
	 5Fbk9vj5CqsaZ4qzIXjSl6e9kZR+784xJX8oc/FYq6+eWQJa+adD5554wHgi8X7RSK
	 Lg8VqpJZiSimRVxNVBNLldCbQ4c8sPXM74tdFzBJYewAtotjHoAnTEFI93Kxw2Ftgg
	 InICSKP3V3hFKS5Lw1hmXujD/td+RELRLcLBmT+0g6FO7F/qrGfWqvVVB2H3Lu94fy
	 asS2zRfo3zsrgPXs4QXRcqO2a/pTZlXI9swU7oEIBkesgY42ektu4QwC0maQFBu7Gd
	 UfHGxYC61tABw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773161095; x=1773421595; i=teddy.astie@vates.tech;
	bh=3Wd0xKWdvd2LCo+Aysi0R4yuf0yNnldMdvsEMKvsrOI=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BKmy+efIBRyDb9esunrpL58xXMqJt6/vCoQXH79LQX5aUzXatNm0caT83CFzIdg+b
	 EkRH/OScUju4yfFdjJjCPULwuycRypUJ+VM13L+w+si2YfsNM1LmN5XrLxuMZT8b3C
	 Lj4MXkmcAPMsPpIi6V3hx3fmUd1O5Rt+34k2xZHhWMizqjcbGp2viDmmAktTskedBO
	 uqCeu1FDYMQDfKYHkJpbc/eB4jRiK0WhTbD2sTC6eiZHKASFm7P2qQZeuj8w3dYoJs
	 tG9XYpymA7Y+WigUf1CM4NFV8voEVKjKalg9maltqVWgzq7NDp7fwTK7xfM21Z8mOd
	 f4JComHw8BrIw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=205/6]=20x86/vpmu:=20Limit=20to=20using=20supported=20general/fixed=20counters?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773161094391
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <854c5fe569f1a2f1f60e0768ee3d9a921ad54215.1773160025.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1773160025.git.teddy.astie@vates.tech>
References: <cover.1773160025.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.dba5e090b02c4a199bdbd3059630d207?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260310:md
Date: Tue, 10 Mar 2026 16:44:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D0F8C25540C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.922];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Hardware can support more than 8 general or 3 fixed counters, which could lead
to inconsistent access to MSRs (thus failure to initialize vPMU in guest) as we
don't support accessing more than these limits.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
I'm not aware of a processor that have more than that, but the specification
tells that this is possible.

 xen/arch/x86/cpu-policy.c     |  6 ++++++
 xen/arch/x86/cpu/vpmu_intel.c | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 7f4456d5a2..46db7f0726 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -276,6 +276,12 @@ switch ( p->x86_vendor )
         if ( p->basic.pmu.version > 2 )
             p->basic.pmu.version = 2;
 
+        /* Truncate control register count to what we support */
+        if ( p->basic.pmu.num_gp_ctrs > 8 )
+            p->basic.pmu.num_gp_ctrs = 8;
+
+        if ( p->basic.pmu.num_fixed_ctr > 3 )
+            p->basic.pmu.num_fixed_ctr = 3;
         break;
     }
 }
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 85539ce6c5..0871795218 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -924,7 +924,22 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
     }
 
     arch_pmc_cnt = core2_get_arch_pmc_count();
+    if ( arch_pmc_cnt > 8 )
+    {
+        printk(XENLOG_INFO
+               "VPMU: Too many general counters (%u), emulating 8 registers\n",
+               arch_pmc_cnt);
+        arch_pmc_cnt = 8;
+    }
+
     fixed_pmc_cnt = core2_get_fixed_pmc_count();
+    if ( fixed_pmc_cnt > 3 )
+    {
+        printk(XENLOG_INFO
+               "VPMU: Too many fixed counters (%u), emulating 3 registers\n",
+               arch_pmc_cnt);
+        fixed_pmc_cnt = 3;
+    }
 
     if ( cpu_has_pdcm )
     {
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


