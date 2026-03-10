Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WL36OidQsGnFhgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:08:55 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CDE255429
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:08:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250304.1547777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00CZ-0002rs-2Q; Tue, 10 Mar 2026 16:44:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250304.1547777; Tue, 10 Mar 2026 16:44:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00CY-0002q9-UY; Tue, 10 Mar 2026 16:44:58 +0000
Received: by outflank-mailman (input) for mailman id 1250304;
 Tue, 10 Mar 2026 16:44:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vo/M=BK=bounce.vates.tech=bounce-md_30504962.69b04a86.v1-ab72382673ed4219823e03700adaec69@srs-se1.protection.inumbo.net>)
 id 1w00CX-0002px-ED
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 16:44:57 +0000
Received: from mail132-19.atl131.mandrillapp.com
 (mail132-19.atl131.mandrillapp.com [198.2.132.19])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 778b7e3d-1ca0-11f1-b164-2bf370ae4941;
 Tue, 10 Mar 2026 17:44:56 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-19.atl131.mandrillapp.com (Mailchimp) with ESMTP id 4fVfqp0shXz38V
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 16:44:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ab72382673ed4219823e03700adaec69; Tue, 10 Mar 2026 16:44:54 +0000
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
X-Inumbo-ID: 778b7e3d-1ca0-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773161094; x=1773431094;
	bh=PDKUA/ghCpgwOyp0wj5kBTfKQs5YlszkqJ+BY+fssTw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=OJhyg9SKKlUdl7O3lpFHkmEUOf9MjtgLaKrKxX89QZLR0iyI4Fi/KtiGfjKYDRIpD
	 b15pxQOws7eY3U8Rl2R6T2EWg3QBifWTd1QhnQOG69tB8EiL8UY2uMxuNzStwmScsc
	 U9vetnDDhJmURtXVAZB9LGsjOOOUnZgviWdQjQx2oAgexC0BJoTGzQAw+yeuKK6GMU
	 oIDzGQiSPm8FDq6GQbGjH1XH8+WSY03wUdPhptE1KqRsB/xTtoWW/MHuLJr+4x/L3x
	 BtuXAXbLnp50XDM9uqoizB3zzS+Zi03/qoOOjog6nYuQMi/mCbWOGDKC+THEfL1CFl
	 pKL/BS1k1X+Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773161094; x=1773421594; i=teddy.astie@vates.tech;
	bh=PDKUA/ghCpgwOyp0wj5kBTfKQs5YlszkqJ+BY+fssTw=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=RHUniUrECtGwPXN1Uwl7AlAb3UfH+29S0aTDsbL4f7p5fHZpuLA8Igz1SnHWc2jj6
	 hAA2GKL8EXDkOHOGaYttkdmVOB6R3wKLEzfZA0g6Q2NxYGgnXr0ttj09bKFI8IS/T0
	 Vvwuz0QMK6nNV/m9upbHQUdgUQZO0MOD8MdwCjusupZGnF5dJ6zF+/jozf4Pyh5k06
	 TAntwPxvNBnTc3w28UQogHhIq/r52aQHqLLbDnZXl7nt/oLxTLIYqGdJSY2xfLQgwC
	 3xeWRmCU6oGktkqbUfxjPqlyE4OF6j6YQD0ZkOwifOQO9oM7WJste1/EZ6aHSfsAyK
	 J/gur438yD7UA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=200/6]=20Intel=20vPMU=20improvements?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773161093132
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <cover.1773160025.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ab72382673ed4219823e03700adaec69?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260310:md
Date: Tue, 10 Mar 2026 16:44:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A1CDE255429
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:url,vates.tech:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.923];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

First patch fix a problem that prevents vPMU from properly working with
a PV domain on a processor that doesn't have hyperthreading.

The second patch adds a missing PEBS/DS_AREA MSR handler for PV.

The next patches tries to introduce a proper CPUID handling and restrict
some hardware limits to Xen ones.

Last patch allow vPMU to work with PMU version 6 (Intel Core Ultra and alike).

Teddy Astie (6):
  x86/vpmu: Expose up to 8 Intel event selectors in PV Dom0
  x86/vpmu: Expose PEBS and DS area in PV mode
  x86: Define some Intel vPMU leafs
  x86/vpmu: Sanitise Intel PMU version
  x86/vpmu: Limit to using supported general/fixed counters
  x86/vpmu: Allow PMU version 6

 xen/arch/x86/cpu-policy.c            | 39 +++++++++++++++++++++++++++-
 xen/arch/x86/cpu/vpmu_intel.c        | 24 ++++++++++++++---
 xen/arch/x86/domain.c                |  2 +-
 xen/arch/x86/pv/emul-priv-op.c       |  8 ++++--
 xen/include/xen/lib/x86/cpu-policy.h | 10 ++++++-
 5 files changed, 74 insertions(+), 9 deletions(-)

-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


