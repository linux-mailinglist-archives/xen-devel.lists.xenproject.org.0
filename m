Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLHIC3hmuWkyDgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 15:34:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D44172AC0CB
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2026 15:34:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1256156.1550863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2VUL-0008HN-PH; Tue, 17 Mar 2026 14:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1256156.1550863; Tue, 17 Mar 2026 14:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w2VUL-0008Ea-Lp; Tue, 17 Mar 2026 14:33:41 +0000
Received: by outflank-mailman (input) for mailman id 1256156;
 Tue, 17 Mar 2026 14:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XzQ=BR=bounce.vates.tech=bounce-md_30504962.69b9663e.v1-60c5da4bde924900a8e998088ebd28d4@srs-se1.protection.inumbo.net>)
 id 1w2VUJ-0008EU-UC
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2026 14:33:40 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48064eb8-220e-11f1-b164-2bf370ae4941;
 Tue, 17 Mar 2026 15:33:36 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fZvb26Rngz5QkT4K
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2026 14:33:34 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 60c5da4bde924900a8e998088ebd28d4; Tue, 17 Mar 2026 14:33:34 +0000
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
X-Inumbo-ID: 48064eb8-220e-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773758014; x=1774028014;
	bh=yP02+0uBPHUXsiASIR73DDkx2uRR822xGjQSXWhWDpc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ZPofbuxn/SMw/KVXd9rqtltVNNRz4RPZQ/2sa/5FWysElJrhWY7/TMXuPHzdOHPch
	 gTtpqfhNEbeEXBZGX30R/49shVtry8TxTMIAxozVueyJ0AtSuwN0nMGVJ1xkT04T47
	 JFCv88IsPpL+uRTYvRmqnGbNgYHv+qsRm32PFIjD4NqU6aHd0T+MC0A7Eq814S08OS
	 RUAbtkxyKGLmPxMbNkRPZwW04ugrK1uqDhNLINYZE7SyDviRgJC0c9Fr8d/QkhxCYA
	 Fwx0jTSghHCeQA81I7y53GLW8niN6ivaHEv4U4DrwevMp3BNa8QpF8ZahN+3xJGGDj
	 LM9p4Gz5dTbtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773758014; x=1774018514; i=teddy.astie@vates.tech;
	bh=yP02+0uBPHUXsiASIR73DDkx2uRR822xGjQSXWhWDpc=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=GWrn76jU91H9kGJj4h2vp1vkReuccrB9/U0fEf52rrQHhWvoA68jE4edRNhgrWxqK
	 eREL5n5zZJldbqMjuCph44W7Wveav4+eUFF4/1w95ILFEZDlreOIOXIae/yXvDKPOP
	 VtAVdQnu2oOkBzEfy91d29f6vLU2S8NFJAMM0m+7DYORBHIRI+9x7GAMEtBzHrm93/
	 dEEYZbkrn+J59lC+y9k/VrLJeOyC61HPKMrpdl9tXqmrJwj6byLD2sP+gZvfG8MZ9N
	 Ua6bfJUX85mRfpNu5KOjm6QOznmuRszdVricFnIIZvBM6SEzXy/2YWFiEsLjB6lduw
	 p9I+6DgtWDH8g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2]=20efi:=20Enable=20EFI=5FSET=5FVIRTUAL=5FADDRESS=5FMAP=20by=20default?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773758013577
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>
Message-Id: <14146a9dd53d1662d1e35220125d816045b2f184.1773757913.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.60c5da4bde924900a8e998088ebd28d4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260317:md
Date: Tue, 17 Mar 2026 14:33:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_HAM(-0.00)[-0.900];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: D44172AC0CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Many machines fails to boot if this option is disabled.
It's off by default as it was deemed too risky for being enabled
by default late in the Xen 4.13 cycle, but found out to be safe.
As there are no known drawback by having this option on, enable
it by default.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
v2:
 - review commit description
 - drop "If unsure" note

 xen/common/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d7e79e752a..0a20aa0a12 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -363,14 +363,13 @@ config KEXEC
 
 config EFI_SET_VIRTUAL_ADDRESS_MAP
     bool "EFI: call SetVirtualAddressMap()" if EXPERT
+    default y
     help
       Call EFI SetVirtualAddressMap() runtime service to setup memory map for
       further runtime services. According to UEFI spec, it isn't strictly
       necessary, but many UEFI implementations misbehave when this call is
       missing.
 
-      If unsure, say N.
-
 config XSM
 	bool "Xen Security Modules support"
 	default ARM
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


