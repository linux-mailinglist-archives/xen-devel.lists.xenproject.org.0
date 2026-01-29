Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIPbMwNse2mMEgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:17:39 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C840B0D5F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jan 2026 15:17:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1216513.1526443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSXj-0004hI-5U; Thu, 29 Jan 2026 13:58:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1216513.1526443; Thu, 29 Jan 2026 13:58:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vlSXj-0004f7-2E; Thu, 29 Jan 2026 13:58:43 +0000
Received: by outflank-mailman (input) for mailman id 1216513;
 Thu, 29 Jan 2026 13:58:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o8n3=AC=bounce.vates.tech=bounce-md_30504962.697b678c.v1-95a7ad1aa6614e6c9fd97afbcb7e6816@srs-se1.protection.inumbo.net>)
 id 1vlSXh-0004f1-Kx
 for xen-devel@lists.xenproject.org; Thu, 29 Jan 2026 13:58:41 +0000
Received: from mail134-16.atl141.mandrillapp.com
 (mail134-16.atl141.mandrillapp.com [198.2.134.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c175314-fd1a-11f0-9ccf-f158ae23cfc8;
 Thu, 29 Jan 2026 14:58:38 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-16.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4f212N6ZPbzB5pPZY
 for <xen-devel@lists.xenproject.org>; Thu, 29 Jan 2026 13:58:36 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 95a7ad1aa6614e6c9fd97afbcb7e6816; Thu, 29 Jan 2026 13:58:36 +0000
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
X-Inumbo-ID: 9c175314-fd1a-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769695116; x=1769965116;
	bh=nZZKxilMtRL3J+I70azAXAYJ51FgiO9wKoPvoCmQgzM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=LfiUGTwAIHVsF8yxzGgPcU+x1lpqo6Mz0U0vnHc727Yy6qzd+iUJ+lMy0o08UQc0J
	 TdcrxZjkgjSu3pXkiPzWP5EVnNZYdLqStZ9NpIUqJ2AbWcjEroVL6EyQz66da0oUZx
	 2m7kzgEQ+tjiwTp+CeRyKjuc5/3OPRNoKlFa67is29gZmEvsfJTcZPfUtxzMSrQCID
	 0OSKEzfMZ/yXQBCo8WRYtLZvDM50rzQgubl8S/siNGe4VRaW0KAwRY839NcdRJw9Pb
	 bX7hljYiDYNWs6KEuQTjJQFrozh0IwteVvUBKJ1auAzOBev1t3YqQ3UxGpQtjpgv+B
	 tpgeGf478bzhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769695116; x=1769955616; i=teddy.astie@vates.tech;
	bh=nZZKxilMtRL3J+I70azAXAYJ51FgiO9wKoPvoCmQgzM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=J0YvPz2fJIW33V5eKM2AK/4b6ldJFPl+eDxk6tSF1w8ygaDZo48N1+I/etNNBIPjl
	 bIWObLyDc6qZSu8cDC+/HaM8CD+ikMW08fnRluX3Smq5CncJYRuqUa+lbLt8AuiCoE
	 spIr3vUXBgbytZEYvY5VGeF50d+fI5h2qWrnpJ+ldu/d7BNTgG2lx/W6bMNNWihaSj
	 he0y37vEyCfeikWg11VnsAs1M758RgbM01DvBfKRMsFj0eWUf9P4zKcggmcByQsPmT
	 2TOOr+myjGXghBN+kSPwWOJzBQiZK6JAOaOI6ZXIVQFK0BGMYrnzNJgE2T4XEzz1mY
	 JjeGmNirx8WXA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86:=20Always=20display=20CPU=20vendor=20string?=
X-Mailer: git-send-email 2.52.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769695115816
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <8b50a689e549fd174d6c34dadc5df5c65711c615.1769694285.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.95a7ad1aa6614e6c9fd97afbcb7e6816?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260129:md
Date: Thu, 29 Jan 2026 13:58:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 9C840B0D5F
X-Rspamd-Action: no action

While we may not want all the other CPU informations. We likely
want to keep the CPU string as it's more practical than trying to
decode it from the family/model/stepping combination.

Amends: 35d60c59af28 ("Increase default console ring allocation size and reduce default verbosity")
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
It would be preferable it such message could be written sooner, e.g right
after the family/model/stepping one of early_cpu_init() instead of at the
beginning of smp_prepare_cpus().

 xen/arch/x86/cpu/common.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index ebe2baf8b9..831da72cd8 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -819,9 +819,6 @@ void print_cpu_info(unsigned int cpu)
 	const struct cpuinfo_x86 *c = cpu_data + cpu;
 	const char *vendor = NULL;
 
-	if (!opt_cpu_info)
-		return;
-
 	printk("CPU%u: ", cpu);
 
 	vendor = x86_cpuid_vendor_to_str(c->x86_vendor);
-- 
2.52.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


