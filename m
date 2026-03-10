Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PtFB9hPsGnFhgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:07:36 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 087CB2553F6
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:07:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250305.1547782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00CZ-0002vT-B8; Tue, 10 Mar 2026 16:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250305.1547782; Tue, 10 Mar 2026 16:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00CZ-0002ro-5n; Tue, 10 Mar 2026 16:44:59 +0000
Received: by outflank-mailman (input) for mailman id 1250305;
 Tue, 10 Mar 2026 16:44:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C8PL=BK=bounce.vates.tech=bounce-md_30504962.69b04a86.v1-c66df3a63a2745999a983d58575806a8@srs-se1.protection.inumbo.net>)
 id 1w00CY-0002px-13
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 16:44:58 +0000
Received: from mail133-21.atl131.mandrillapp.com
 (mail133-21.atl131.mandrillapp.com [198.2.133.21])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77b54216-1ca0-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 17:44:56 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fVfqp5vQqz1XLF4k
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 16:44:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c66df3a63a2745999a983d58575806a8; Tue, 10 Mar 2026 16:44:54 +0000
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
X-Inumbo-ID: 77b54216-1ca0-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773161094; x=1773431094;
	bh=CfuPpakjv5VmFwTUwLXalLDXQ40VB5TUP6pk/iH94Mc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NlfPTojucJusZHKLi6w6bLI+26+pMCkFf+LmI0t2hsSNyXRwQYYcNrytcU7y2r/BN
	 ySRFDfvRjMQzfQt17OvPPexYh5YTv+tteWSo4yi/h6MGAlF3L3YAJpuZHsM7NoWjpT
	 /KgajU85j8Tgnunm+WWKMH9LS3lamAMH8xBAIIGygKPVBxqk6LGz23Jv1nk7P7miFk
	 71B8bkQdWDk/oig5YftVIkBYo825SjLTk4wr7QLZ4clBBRPswWd/otT/mSM5QGU19L
	 bCJVkILZQjxKYyUnG73iQnIjVbtGilhJg3lQ3OfnmYXATdeDcbPzUy3wF47ho+M/S1
	 jhg48+CASmoJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773161094; x=1773421594; i=teddy.astie@vates.tech;
	bh=CfuPpakjv5VmFwTUwLXalLDXQ40VB5TUP6pk/iH94Mc=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jUWiZix4iMfwXTgNinrqPvUPRLbR1PWDcCQvOlThYYof7lF/1IwZ6I1prTfX0f1OJ
	 LizvwpgYDVklA38XGcfBa4Nn9SKpDfvNuDsxe7HVev6C7YGu4KUiEjUZFHCVSezeOu
	 WumJf4gqoTwRa+On5JkFc8LNWbxxI9BcWTt6JTUK6dYIrPMiCneQACqdOx7uTgw31e
	 Pt1doXVYbAHEQnSISOiAfRh1RqXoFJJTOEr1VsjJS8YuHydPbU0HxaHY+gWU+j6R8X
	 HGaCOtGGMskaJSKPknGFwg967aQ00z2Tz+7bH+kJb6ogqaX9tFOBy9sIvVbCBQfMFz
	 UmL49GlFYiAtg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=203/6]=20x86:=20Define=20some=20Intel=20vPMU=20leafs?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773161093903
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <83a573dcb365761c0f089325365090b6f963fb03.1773160025.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1773160025.git.teddy.astie@vates.tech>
References: <cover.1773160025.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c66df3a63a2745999a983d58575806a8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260310:md
Date: Tue, 10 Mar 2026 16:44:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 087CB2553F6
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
	GREYLIST(0.00)[pass,meta];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid,mandrillapp.com:dkim,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.905];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/vpmu_intel.c        |  4 ++--
 xen/arch/x86/domain.c                |  2 +-
 xen/include/xen/lib/x86/cpu-policy.h | 10 +++++++++-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index 1e3b06ef8e..f43faf9567 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -818,8 +818,8 @@ static int cf_check core2_vpmu_initialise(struct vcpu *v)
     u64 msr_content;
     static bool ds_warned;
 
-    if ( v->domain->arch.cpuid->basic.pmu_version <= 1 ||
-         v->domain->arch.cpuid->basic.pmu_version >= 6 )
+    if ( v->domain->arch.cpuid->basic.pmu.version <= 1 ||
+         v->domain->arch.cpuid->basic.pmu.version >= 6 )
         return -EINVAL;
 
     if ( (arch_pmc_cnt + fixed_pmc_cnt) == 0 )
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index e658c2d647..5762b38fce 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -458,7 +458,7 @@ void domain_cpu_policy_changed(struct domain *d)
 
         /* If PMU version is zero then the guest doesn't have VPMU */
         if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
-             p->basic.pmu_version == 0 )
+             p->basic.pmu.version == 0 )
             vpmu_destroy(v);
     }
 }
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index d29e380359..9161e2ad8d 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -162,7 +162,15 @@ struct cpu_policy
             uint64_t :64, :64; /* Leaf 0x9 - DCA */
 
             /* Leaf 0xa - Intel PMU. */
-            uint8_t pmu_version, _pmu[15];
+            struct {
+                uint8_t /* a */ version, num_gp_ctrs, gp_ctr_width,
+                                event_enum_length;
+                uint32_t /* b */:32;
+                uint32_t /* c */ fixed_ctr_mask;
+                uint32_t /* d */ num_fixed_ctr:5, fixed_ctr_width:8, :1,
+                                 anythread_depreciation:1, slots_per_cyc:4,
+                                 :13;
+            } pmu;
 
             uint64_t :64, :64; /* Leaf 0xb - Topology. */
             uint64_t :64, :64; /* Leaf 0xc - rsvd */
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


