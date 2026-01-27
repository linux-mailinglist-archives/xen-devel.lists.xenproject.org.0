Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM1IBB6reGl9rwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 13:10:06 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE727940ED
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jan 2026 13:10:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214596.1524828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhtM-0005oZ-Jr; Tue, 27 Jan 2026 12:09:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214596.1524828; Tue, 27 Jan 2026 12:09:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkhtM-0005mp-H9; Tue, 27 Jan 2026 12:09:56 +0000
Received: by outflank-mailman (input) for mailman id 1214596;
 Tue, 27 Jan 2026 12:09:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fihw=AA=bounce.vates.tech=bounce-md_30504962.6978ab0e.v1-931d19afa0f34760894945371598942e@srs-se1.protection.inumbo.net>)
 id 1vkhtL-0005mj-Aa
 for xen-devel@lists.xenproject.org; Tue, 27 Jan 2026 12:09:55 +0000
Received: from mail186-9.suw21.mandrillapp.com
 (mail186-9.suw21.mandrillapp.com [198.2.186.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1568a657-fb79-11f0-9ccf-f158ae23cfc8;
 Tue, 27 Jan 2026 13:09:52 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-9.suw21.mandrillapp.com (Mailchimp) with ESMTP id 4f0kjp6wQ4zK5vlN1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jan 2026 12:09:50 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 931d19afa0f34760894945371598942e; Tue, 27 Jan 2026 12:09:50 +0000
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
X-Inumbo-ID: 1568a657-fb79-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1769515791; x=1769785791;
	bh=vua/fd8T1a6bAo2xrvrSMCfcHJPq1mx1BzNMWefyFZ0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=wamqBZBet342RDWcin7LEUb/PavFim0Tpf5YiScdFM4UupY3C89XYvyFdbwWY6r0x
	 EIHYQZ39YWlYbZsxTQgQjNZwrRy+rUhG/FtkozwwizlGpfbLab+GU/c0lYMzUNqz/f
	 FPjlmJl68Hw5/7kHSwaXx6UqAJ/HjqDRI1ZJOlCXVFKGfvNHd/k0bY9SWCxdaclIxO
	 g5XeJmKrDAMK/ir4tu6eL/QpdR9f/FUtCy6zW0IqkGTOgbAakUykncpsornRfWDjKJ
	 NaRQLhNVEum1HWtYsWmE1S7tubgm4n7Nk/oDJgRLcPk8LXVyB1vKlbOC0gBst1vm3J
	 RIiAwalW3xudQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1769515791; x=1769776291; i=teddy.astie@vates.tech;
	bh=vua/fd8T1a6bAo2xrvrSMCfcHJPq1mx1BzNMWefyFZ0=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=RPhRxMNfYBsiuOZik7fSLjBWhXQX1/P6/Iz88lv9sEnvnWnUN4xn2xvhrsnnhwWvU
	 BALGYNamHltxuFRlEw+0bn0jP/AcWjRkLrNLJOJYF6tUzqpO3jbpglCRsaQtPnJ/NV
	 zp+2YnnpndpwEJ/W5DgOL4Qkl3NsjRSkunrTbN3cmEFO081eE2nLvcahko4jea5MbD
	 4gGU0SzcpCQsLvZWNsYTSfUTloaVwU+fJhum87vCDxhQ8+LUaq+E57bRnhxWT3dJDf
	 nfavImZRaAFhDI/Kr3rDDcUGIEAMxIjTn8KgmT3Su7ErJH9emo6QoDdJTErTa+eJJ6
	 /pRMKZnleQr0Q==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=2000/16]=20x86/cpu:=20Cleanup=20for=20NX=20adjustments?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1769515789933
Message-Id: <e5f02207-4f9f-467a-8c25-0af42bf81551@vates.tech>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: "Jan Beulich" <JBeulich@suse.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Julian Vetter" <julian.vetter@vates.tech>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com> <92bff6a4-8fb0-4992-8305-8386f480de74@vates.tech> <658c0167-c3df-4acd-92f8-8c3f022ae453@citrix.com>
In-Reply-To: <658c0167-c3df-4acd-92f8-8c3f022ae453@citrix.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.931d19afa0f34760894945371598942e?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260127:md
Date: Tue, 27 Jan 2026 12:09:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: AE727940ED
X-Rspamd-Action: no action

Le 27/01/2026 =C3=A0 12:39, Andrew Cooper a =C3=A9crit=C2=A0:
> On 27/01/2026 11:23 am, Teddy Astie wrote:
>> Le 26/01/2026 =C3=A0 18:56, Andrew Cooper a =C3=A9crit=C2=A0:
>>> I was hoping this to be a patch or two, but it got out of hand...
>>>
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2287078=
891
>>> https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/nx
>>>
>>> The branch has one extra patch to fake up the firmware settings being s=
et to
>>> Gitlab CI, not included in this series.
>>>
>>> Julien: This ought to suitable to rebase your cleanup on to.  In the en=
d, I
>>> did the AMD adjustment mostly because I needed it to test the correctne=
ss of
>>> the prior cleanup.
>>>
>>> The final 4 patches are tangential cleanup which I've kept out of the p=
rior
>>> work in case we wish to backport it.  Everything prior is relevant to
>>> untangling, and mostly for the benefit of the AMD side.
>>>
>>> The early patches are hopefully non-controvertial.  Later patches are a=
 little
>>> more RFC, and in need of further testing.
>>>
>>> <snip>
>>>
>> Tested on a Intel machine with "DEP" disabled, and "Require NX support"
>> disabled, I get a pagefault in hpet code
> 
>  From above:
> 
>> Julien: This ought to suitable to rebase your cleanup on to.
> 
> This is cleanup only.=C2=A0 I've not got the bugfixes for EFI boot yet, s=
o
> the behaviour you see is still expected for now.
> 
> Although, thinking about it, it might be better if I try to merge the
> two series, so everyone can test the end result.
> 
> Thoughts?
> 

+1

>>> (XEN) Xen version 4.22-unstable (tsnake41@(none)) (gcc (Alpine 15.2.0) =
15.2.0) debug=3Dy Tue Jan 27 12:06:46 CET 2026
>>> (XEN) Latest ChangeSet: Mon Jan 26 17:53:45 2026 +0000 git:6491616ddd
>>> (XEN) build-id: 035024497a4cadebf9e5a2ded61f63ac
>>> (XEN) re-enabled NX (Execute Disable) protection
>>> (XEN) CPU Vendor: Intel, Family 6 (0x6), Model 60 (0x3c), Stepping 3 (r=
aw 000306c3)
>>> (XEN) BSP microcode revision: 0x0000001a
>>> (XEN) microcode: Bad data in container
>>> (XEN) Microcode: Parse error -22
> 
> As a tangent, what's going on here?
> 
> This is the first time I've seen the error outside of my own testing.
> Is it a container you expect to be good, or some leftovers on a test
> machine?
> 

I'm trying to load a Intel ucode (taken from Alpine Linux intel-ucode 
package) using `ucode=3Dintel-ucode.img` in xen.cfg (UEFI direct boot).

Many distros ship microcode in a single CPIO image with e.g 
"kernel/x86/microcode/GenuineIntel.bin" in it.

> ~Andrew
> 



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



