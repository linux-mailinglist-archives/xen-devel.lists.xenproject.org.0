Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EE0FDKZmoWkJsgQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 10:40:54 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 804321B577B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Feb 2026 10:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1242543.1542941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvuK2-0002Yj-5w; Fri, 27 Feb 2026 09:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1242543.1542941; Fri, 27 Feb 2026 09:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvuK2-0002Vu-2C; Fri, 27 Feb 2026 09:39:46 +0000
Received: by outflank-mailman (input) for mailman id 1242543;
 Fri, 27 Feb 2026 09:39:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hdes=A7=bounce.vates.tech=bounce-md_30504962.69a1665c.v1-f157163a010b4c50a07224fe7c27dba4@srs-se1.protection.inumbo.net>)
 id 1vvuK0-0002Vf-Hg
 for xen-devel@lists.xenproject.org; Fri, 27 Feb 2026 09:39:44 +0000
Received: from mail178-23.suw51.mandrillapp.com
 (mail178-23.suw51.mandrillapp.com [198.2.178.23])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d64ccc0-13c0-11f1-9ccf-f158ae23cfc8;
 Fri, 27 Feb 2026 10:39:41 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-23.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4fMjwD1HT4z35hg4R
 for <xen-devel@lists.xenproject.org>; Fri, 27 Feb 2026 09:39:40 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f157163a010b4c50a07224fe7c27dba4; Fri, 27 Feb 2026 09:39:40 +0000
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
X-Inumbo-ID: 3d64ccc0-13c0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772185180; x=1772455180;
	bh=Y1nYe09ke51CdH/6D0EdVY0J4b99jSrb6M8aLy27Luw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ixcy01PAgLxpT7zq1TLjxcINUb6xHhyryIzEEcdvkHQ7nhnBz5edykZoFT/OXwB0k
	 L+c30A9jtq6AGqpmLqUYqimYsykXlm7Cmi8KqlBZ9jxoDK5EmIXXUp6vrjYG6Miepc
	 tUf26rUVSH44ouA1o0iQL2DGth6oYd2FaiqIxeTFkEYqb83qJdP5lT6+lpTT7qR0bz
	 CNP6VvgJKOdhMwQw/eFvR+rVt5z4nl52Y6bbdRD91ILqLasUBP0ISEmgBx2dMxm1w/
	 HxUmNmHoSZS23i8/+VUPx4PGWrOLUxxF4+7EELas9cSW4997G6bFs/BA8e+2bmoRSy
	 2DKW29X9FJBiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772185180; x=1772445680; i=teddy.astie@vates.tech;
	bh=Y1nYe09ke51CdH/6D0EdVY0J4b99jSrb6M8aLy27Luw=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=tOz1SgFXNvE1E4F39kU6xCtAo8ZDv9AtxkBsAcGdwIpghj8WDYHibAEZIZOK5Cs7v
	 +vA0lx7U1BN2V1IydQ2lc/aN/9ceda0BXMI98IJGHyP8S2q+nseObqGPFJCGntZt7b
	 oiGFd6d0a7WDm+JxWToeeoCKunIibakgd5h9xevPITf5YglP5if321+a/pM/zQyOv3
	 DN+1mFnbPvkoJSp3poqih2X5Qn3MV83XZXSvYxq1O42U/7bmCgVe5BZyfPj4DXzfKo
	 CTA3hsl2gHNA3BTVoZM40bGhxuwQDbfANSUgebwfN33Tv5qinWJvlRsZ+a+UTLIOUh
	 yE74SFH30N5+A==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20v4=2005/10]=20xen/domain:=20Add=20DOMCTL=20handler=20for=20claiming=20memory=20with=20NUMA=20awareness?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772185177224
Message-Id: <a1b1daa3-a70e-454e-9cdc-42e26b204a0f@vates.tech>
To: "Bernhard Kaindl" <bernhard.kaindl@citrix.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Roger Pau Monne" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <cover.1772098423.git.bernhard.kaindl@citrix.com> <b2c94f0c3b41976b2691ce15b9f9a2589370e65a.1772098423.git.bernhard.kaindl@citrix.com> <656ff614-9165-49ce-8c55-0cfad33d4ed6@vates.tech> <LV3PR03MB77072E23139DF353E7B8C9D28772A@LV3PR03MB7707.namprd03.prod.outlook.com>
In-Reply-To: <LV3PR03MB77072E23139DF353E7B8C9D28772A@LV3PR03MB7707.namprd03.prod.outlook.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f157163a010b4c50a07224fe7c27dba4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260227:md
Date: Fri, 27 Feb 2026 09:39:40 +0000
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bernhard.kaindl@citrix.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,patchew.org:url,xenproject.org:url,xenserver.com:url];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	NEURAL_SPAM(0.00)[1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 804321B577B
X-Rspamd-Action: no action

Le 27/02/2026 =C3=A0 00:21, Bernhard Kaindl a =C3=A9crit=C2=A0:
> On 26/02/2026 =C3=A0 22:19, Teddy Astie a =C3=A9crit :
>> Le 26/02/2026 =C3=A0 15:54, Bernhard Kaindl a =C3=A9crit :
>>> Add a DOMCTL handler for claiming memory with NUMA awareness. It
>>> rejects claims when LLC coloring (does not support claims) is enabled
>>> and translates the public constant to the internal NUMA_NO_NODE.
>>>
>>> The request is forwarded to domain_set_outstanding_pages() for the
>>> actual claim processing. The handler uses the same XSM hook as the
>>> legacy XENMEM_claim_pages hypercall.
>>>
>>> While the underlying infrastructure currently supports only a single
>>> claim, the public hypercall interface is designed to be extensible for
>>> multiple claims in the future without breaking the API.
>> I'm not sure about the idea of introducing a new hypercall for this
>> operation. Though I may be missing some context about the reasons of
>> introducing a new hypercall.
>>
>> XENMEM_claim_pages doesn't have actual support for NUMA, but the
>> hypercall interface seems to define it (e.g you can pass
>> XENMEMF_exact_node(n) to mem_flags). Would it be preferable instead to
>> make XENMEM_claim_pages aware of NUMA-related XENMEMF flags ?
> 
> Hello Teddy,
> 
> Thank you for your review =E2=80=94 much appreciated.
> 
> Updating the do_memory_op(XENMEM_claim_pages) handler to accept a node
> parameter, as you suggested, is indeed a practical way to retrofit this
> feature into existing Xen builds. That=E2=80=99s also the approach we too=
k in
> v1 of this series:
> 
> * https://lists.xenproject.org/archives/html/xen-devel/2025-03/msg01127.h=
tml
> * https://patchew.org/Xen/20250314172502.53498-1-alejandro.vallejo@cloud.=
com/
> 
> We are currently using this approach also in the XS9 Public Preview:
> 
> * https://www.xenserver.com/downloads/xs9-preview
> 
> That said, during review, Roger Pau Monn=C3=A9 suggested that for upstrea=
m
> inclusion, we should introduce a new hypercall API with support for
> multi-node claims, even if the initial infrastructure only handles
> a single node. See:
> 
> * https://lists.xenproject.org/archives/html/xen-devel/2025-06/msg00484.h=
tml
> 
> He raised the concern that the current interface effectively constrains
> domains to be allocated from one node at a time, or to sequence claims
> across nodes, which undermines the purpose of claims.
> 
> Instead, he proposed that the hypercall interface would ideally allow
> making multi-node claims atomically, rather than requiring multiple
> calls with rollback in case of failure.
> 
> I favour Roger=E2=80=99s position as well: I think we should aim for a cl=
ean
> and extensible interface that supports claims across multiple nodes
> in a single call. Otherwise, we risk having to introduce yet another
> hypercall later when a real-world scenario requires multi-node claims.
> 
> On the implementation side, a reliable first-come, first-served mechanism
> for multi-node claims will require serialisation in the central claim pat=
h.
> Currently, the global heap_lock provides that protection, and it would
> naturally cover the creation of a multi-node claim under a single lock,
> ensuring atomicity and consistent behaviour.
> 

Ok thanks.

Should we state that the old interface is "deprecated" (somehow), and 
that people should take a look at XEN_DOMCTL_claim_memory instead, 
especially if they need a NUMA-aware interface ?
That could be a note on the XENMEM_claim_memory hypercall.

> Thanks again for the review and feedback!
> > Best regards / Bien cordialement / Saludos / Liebe Gr=C3=BC=C3=9Fe,
> 
> With warm greetings from Vienna/Austria,
> Bernhard

Teddy


--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



