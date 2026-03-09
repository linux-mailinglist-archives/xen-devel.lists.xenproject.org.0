Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4M6KKpi9rmn6IQIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:31:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF3D238DCA
	for <lists+xen-devel@lfdr.de>; Mon, 09 Mar 2026 13:31:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1249408.1546886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlN-0005qW-Kt; Mon, 09 Mar 2026 12:31:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1249408.1546886; Mon, 09 Mar 2026 12:31:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vzZlN-0005iM-Fa; Mon, 09 Mar 2026 12:31:09 +0000
Received: by outflank-mailman (input) for mailman id 1249408;
 Mon, 09 Mar 2026 12:31:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S8hQ=BJ=bounce.vates.tech=bounce-md_30504962.69aebd87.v1-032a1be8fa454067a55673a79402ae81@srs-se1.protection.inumbo.net>)
 id 1vzZlL-0005Rm-Rt
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2026 12:31:07 +0000
Received: from mail132-19.atl131.mandrillapp.com
 (mail132-19.atl131.mandrillapp.com [198.2.132.19])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6d7e0fc-1bb3-11f1-9ccf-f158ae23cfc8;
 Mon, 09 Mar 2026 13:31:05 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-19.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4fTxFM5n8nz38S
 for <xen-devel@lists.xenproject.org>; Mon,  9 Mar 2026 12:31:03 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 032a1be8fa454067a55673a79402ae81; Mon, 09 Mar 2026 12:31:03 +0000
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
X-Inumbo-ID: d6d7e0fc-1bb3-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773059463; x=1773329463;
	bh=I8BSfceyMGDNtjYI3I25tiqYMa8WyFnZJjroIloiPck=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=N3Nmv77Jl5i5MvG8JhByUKf2yn8GJwFJ+NhVaZ03LuU15bHhn0cdXq+IV9UuBgmNw
	 TlKV13ESA04obF1pkFU+wTZnw5nkqyMJD4eBv8iZ9rXqvy836iZ4zhWWlgln+b6oyC
	 5KGpte28suw+5Pt9jkNS5g8n4y7bG1k38yeJhlj0PCs3iG7yDA+uPiJiSDmgb+e55T
	 ByFCgJJnGVM1tqIPGaEsUskPVcgKDmduSF1LDEYB2e3d0KdQkcvGvNXWHUtAo4S0kA
	 J7jE/MmnGasuut8uWHuIg6760MjGfnTW3y2j78yp9xkt9oBqHC+qaeme7h9TaQGxEz
	 Oe9PcKMQhdO9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773059463; x=1773319963; i=julian.vetter@vates.tech;
	bh=I8BSfceyMGDNtjYI3I25tiqYMa8WyFnZJjroIloiPck=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GfgUDR6hb/VtLN1mNSdipyZVxtJ8oGhRwQTayso00UGGCk6umpwiTe5LZIHMHoyp0
	 NfE+bYJSItrDRqyu8pnOJXG27s/8+3vm0dssXX2ESxQFVvjucIJfMppMH77Byz9R1/
	 wDrPU7/fElu9tn+gccoJoPJJ2PoUBeUxHDb8IRj1RfYLLCFk5P2lbts/Ck9spqYKiI
	 EkRyY1eXL7suuyt6bqUbOH1/FPftR8OaIebEp61NA/yXlVGBoENpoYc2H22SY3ufQy
	 4BMF3GNQrl7FC6cAEJP6tixZ8bnxFx0NLk2AZFwsbW25TzQw/qVIIJ4ZDOpmqv2zsl
	 A0oB3TB8rHvIQ==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=204/7]=20x86/passthrough:=20Use=20extended=20destination=20ID=20in=20PT=20MSI=20bind/unbind?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773059462530
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Juergen Gross" <jgross@suse.com>, "Julien Grall" <julien@xen.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260309123055.880050-4-julian.vetter@vates.tech>
In-Reply-To: <20260309123055.880050-1-julian.vetter@vates.tech>
References: <20260309123055.880050-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.032a1be8fa454067a55673a79402ae81?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260309:md
Date: Mon, 09 Mar 2026 12:31:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7CF3D238DCA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:jgross@suse.com,m:julien@xen.org,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_HAM(-0.00)[-0.389];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

In pt_irq_create_bind() and _hvm_dpci_msi_eoi() replace the bare
MASK_EXTR(..., XEN_DOMCTL_VMSI_X86_DEST_ID_MASK) calls with
XEN_DOMCTL_VMSI_X86_FULL_DEST() so that the high 7 destination ID bits
stored in XEN_DOMCTL_VMSI_X86_EXT_DEST_ID_MASK are included when
computing the target vCPU for MSI passthrough IRQs. Increase the local
dest and delivery_mode variables to uint32_t to match.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in V3:
- New patch, but no changes to previous patchset
---
 xen/drivers/passthrough/x86/hvm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index b73bb55055..9c3c8d28d6 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -281,7 +281,7 @@ int pt_irq_create_bind(
     {
     case PT_IRQ_TYPE_MSI:
     {
-        uint8_t dest, delivery_mode;
+        uint32_t dest, delivery_mode;
         bool dest_mode;
         int dest_vcpu_id;
         const struct vcpu *vcpu;
@@ -357,8 +357,7 @@ int pt_irq_create_bind(
             }
         }
         /* Calculate dest_vcpu_id for MSI-type pirq migration. */
-        dest = MASK_EXTR(pirq_dpci->gmsi.gflags,
-                         XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
+        dest = XEN_DOMCTL_VMSI_X86_FULL_DEST(pirq_dpci->gmsi.gflags);
         dest_mode = pirq_dpci->gmsi.gflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
         delivery_mode = MASK_EXTR(pirq_dpci->gmsi.gflags,
                                   XEN_DOMCTL_VMSI_X86_DELIV_MASK);
@@ -807,8 +806,7 @@ static int cf_check _hvm_dpci_msi_eoi(
     if ( (pirq_dpci->flags & HVM_IRQ_DPCI_MACH_MSI) &&
          (pirq_dpci->gmsi.gvec == vector) )
     {
-        unsigned int dest = MASK_EXTR(pirq_dpci->gmsi.gflags,
-                                      XEN_DOMCTL_VMSI_X86_DEST_ID_MASK);
+        unsigned int dest = XEN_DOMCTL_VMSI_X86_FULL_DEST(pirq_dpci->gmsi.gflags);
         bool dest_mode = pirq_dpci->gmsi.gflags & XEN_DOMCTL_VMSI_X86_DM_MASK;
 
         if ( vlapic_match_dest(vcpu_vlapic(current), NULL, 0, dest,
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


